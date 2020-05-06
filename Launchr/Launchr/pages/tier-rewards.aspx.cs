using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using Launchr.models;

namespace Launchr.pages
{
	public partial class WebForm7 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request.QueryString["id"] != null)
				{
					try
					{
						int project_id = int.Parse(Request.QueryString["id"]);
						List<Project> project_list = new SiteDB().getProjectById(project_id);
						if (project_list.Count() != 0)
						{
							Project project = (Project)project_list[0];

						}
						else
						{
							// project does not exist, do something here!
						}
					}
					catch (Exception ex)
					{
						// id invalid (not convertible to int), do something here!
					}
				} else
				{
					Response.Redirect("tier-rewards.aspx?id=300001");
				}
				
			}
		}

		[WebMethod]
		public static string saveTiers(object test)
		{
			List<object> tier_list = new JavaScriptSerializer().ConvertToType<List<object>>(test);
			System.Diagnostics.Debug.WriteLine("touch");
			return "touch";		
		}
	}
}