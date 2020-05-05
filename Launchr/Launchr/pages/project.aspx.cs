using Launchr.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Launchr.pages
{
	public partial class WebForm3 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Creator creator = (Creator)this.Session["creator"];
			if (Session["creator"] != null){
				backProject.Enabled = false;
				backProject.Attributes["data-toggle"] = "tooltip";
				backProject.Attributes["data-placement"] = "right";
				backProject.Attributes["title"] = "You can only pledge a tier as a normal member.";
				backProject.Attributes.Remove("data-target");
			}

			if (!IsPostBack)
			{
				try
				{
					int project_id = int.Parse(Request.QueryString["id"]);
					List<Project> project_list = new SiteDB().getProjectById(project_id);
					if (project_list.Count() != 0)
					{
						Project project = (Project)project_list[0];
						this.makePage(project);

					} else
					{
						// project does not exist, do something here!
					}
				} catch (Exception ex)
				{
					// id invalid (not convertible to int), do something here!
				}
			}

			

		}

		private void makePage(Project project)
		{
			this.makeContent(project.content);
		}

		private void makeContent(string content)
		{
			StringBuilder html = new StringBuilder();
			html.Append(content);
			this.plcContent.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}
	}
}