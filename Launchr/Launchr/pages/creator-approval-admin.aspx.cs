using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;
using System.Text;
using System.IO;

namespace Launchr.pages
{
	public partial class creator_approval_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			List<Creator> creator_list = new SiteDB().getWaitingCreator();
			this.makePendingCreator(creator_list);
		}

		private void makePendingCreator(List<Creator> creator_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Creator creator in creator_list)
			{
				html.Append("<th scope=\"row\" class=\"text-right\">" + creator.id + "</th><td>" + creator.name + "</td><td>" + creator.email + "</td><td>" + creator.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnViewDoc launchr-btn btn p-2\"onclick=\"window.open('" + creator.document + "')\">View Document</button></td><td class=\"text-center\"><button type=\"button\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Approve\"class=\"btnApprove btn-success btn p-2 creator-approval-btn\">&#10003;</button><button type=\"button\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Reject\"class=\"btnReject btn-danger btn p-2 creator-approval-btn\">&#10005;</button></td>");
			}
			this.plcPendingCreator.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		[WebMethod]
		public static int approveCreator(object userID)
		{
			int creator_id = int.Parse((string)userID);
			Creator creator = new SiteDB().getCreatorById(creator_id);
			if(creator != null)
			{
				creator.status = 1;
				return creator.update();
			} else
			{
				return 0; // no user found
			}
		}

		[WebMethod]
		public static int rejectCreator(object userID)
		{
			int creator_id = int.Parse((string)userID);
			Creator creator = new SiteDB().getCreatorById(creator_id);
			if (creator != null)
			{
				int delete_creator_status = new SiteDB().deleteCreator(creator);
				if(delete_creator_status == 1)
				{
					try
					{
						FileInfo fi = new FileInfo(creator.document);
						string document_path = System.IO.Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/Content/documents/"), fi.Name);
						FileInfo fiTemp = new FileInfo(document_path);
						fiTemp.Delete();
						return 1;
					} catch(Exception e)
					{
						return 0;
					}
					
				} else
				{
					return 0;
				}
			}
			else
			{
				return 0; // no user found
			}
		}
	}
}