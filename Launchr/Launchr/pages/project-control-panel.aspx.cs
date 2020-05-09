using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;
using System.Text;

namespace Launchr.pages
{
	public partial class WebForm9 : System.Web.UI.Page
	{
		Project project;
		protected void Page_Load(object sender, EventArgs e)
		{
			if(this.Session["creator"] != null && Request.QueryString["id"] != null)
			{
				try
				{
					int project_id = int.Parse(Request.QueryString["id"]);
					project = new SiteDB().getProjectById(project_id);
					if (project == null)
					{
						Response.Redirect("404.aspx");
					} else
					{
						this.makePage(project);
					}
				} catch (Exception ex)
				{
					Response.Redirect("404.aspx");
				}
			} else
			{
				Response.Redirect("404.aspx");
			}
		}

		public void makePage(Project project)
		{
			StringBuilder html = new StringBuilder();
			foreach(Transaction transaction in project.getTransactions())
			{
				string tier_condition;
				if(transaction.tier == null)
				{
					tier_condition = "None Applicable";
				} else
				{
					tier_condition = transaction.tier.title;
				}
				html.Append("<tr><th scope=\"row\" class=\"text-right\">" + transaction.user.id + "</th><td>" + transaction.user.name + "</td><td>" + transaction.user.email + "</td><td>" + transaction.user.username + "</td><td class=\"text-break\">" + transaction.user.address + "</td><td>" + transaction.user.phone_number + "</td><td>" + transaction.user.country + "</td><td>" + tier_condition + "</td><td>" + transaction.amount + "</td></tr>");
			}

			this.plcBackerList.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}
	}
}