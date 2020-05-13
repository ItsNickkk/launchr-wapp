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
			
			if (this.Session["creator"] != null && Request.QueryString["id"] != null)
			{
				try
				{
					int project_id = int.Parse(Request.QueryString["id"]);
					project = new SiteDB().getProjectById(project_id);
					if (project == null)
					{
						Response.Redirect("404.aspx");
					}
					else
					{
						if (!IsPostBack)
						{
							this.makePage(project);
						}
						
					}
				}
				catch (Exception ex)
				{
					Response.Redirect("404.aspx");
				}
			}
			else
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

			this.txtTitle.Text = project.title;
			this.txtDescription.Text = project.description;
			this.txtContentFaux.Text = project.content;
			this.cobTopic.SelectedValue = project.topic;
		}
		protected void displayErrorMessage(String alertmsg, int type)
		{
			StringBuilder html = new StringBuilder();
			html.Append("<div class=\"mt-3\" runat=\"server\">");
			if (type == 1)
			{
				html.Append("<div class=\"alert alert-success\">");
			}
			else
			{
				html.Append("<div class=\"alert alert-danger\">");
			}
			html.Append(alertmsg);
			html.Append("</div></div>");

			plcAlert.Controls.Add(new Literal { Text = html.ToString() });

		}
		protected void btnSaveProject_Click(object sender, EventArgs e)
		{
			string title = this.txtTitle.Text;
			string description = this.txtDescription.Text;
			string content = this.txtContentFaux.Text;
			string topic = this.cobTopic.SelectedValue;
			project.title = title;
			project.description = description;
			project.content = content;
			project.topic = topic;
			if(project.update() == 1)
			{
				// success, do something here
				displayErrorMessage("Project details successfully updated.",1 );
			} else
			{
				// fail, do something here
				displayErrorMessage("An error occured.", 2);
			}
		}
	}
}