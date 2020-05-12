using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Launchr.models;

namespace Launchr.pages
{
	public partial class search_result : System.Web.UI.Page
	{
		List<Project> search_results;
		protected void Page_Load(object sender, EventArgs e)
		{
			if(Request.QueryString["query"] != null)
			{
				search_results = new SiteDB().findProjectByTitle(Request.QueryString["query"]);
				search_results.Reverse();
				Page.Title = "Search: "+ Request.QueryString["query"] + " | Launch:r";
			} else if (Request.QueryString["topic"] != null)
			{
				search_results = new SiteDB().findProjectByTopic(Request.QueryString["topic"]);
				search_results.Reverse();
				Page.Title = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(Request.QueryString["topic"]) + " | Launch:r";
			} else
			{
				search_results = new List<Project>();
			}

			this.makePage();
		}

		private void makePage()
		{
			StringBuilder html = new StringBuilder();
			foreach(Project project in search_results)
			{
				string remaining_text;
				if (project.time_end > DateTime.Now)
				{
					remaining_text = (project.time_end - DateTime.Now).Days.ToString() + " days left";
				}
				else
				{
					remaining_text = "Campaign ended";
				}
				html.Append("<div class=\"row mb-3 search-card\"><div class=\"col neumorph\"><div class=\"row mb-3\"><div class=\"col-xl-4\"><img src=\"" + project.image_path_list[0] + "\" /></div><div class=\"col-xl-5 pt-3 pl-0\"><a href=\"project.aspx?id=" + project.id + "\"><h3>" + project.title + "</h3></a><p>" + project.description + "</p></div><div class=\"col-xl-3 pt-3\"><div class=\"row\"><div class=\"col\"><div class=\"progress\"><div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\"role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\"style=\"width: " + project.calcProgress() + "%\"></div></div></div></div><div class=\"row\"><div class=\"col-xl mt-3\"><span class=\"project-card-details\">$" + project.getTransactionTotal() + "</span> raised of $" + project.target + "</div><div class=\"col-xl text-right mt-3\"><span class=\"project-card-details\">" + project.calcProgress() + "%</span></div></div><div class=\"row\"><div class=\"col\"><p class=\"mb-2\">" + project.countBackers() + " backers</p></div><div class=\"col\"><p class=\"mb-2 text-right\">" + remaining_text + "</p></div></div></div></div></div></div>");
			}
			this.plcResult.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}
	}
}