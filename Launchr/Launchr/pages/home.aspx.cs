using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;
using System.Text;

namespace Launchr.pages
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Title = "Home | Launch:r";
			User user = (User)this.Session["user"];
			Creator creator = (Creator)this.Session["creator"];
			if (this.Session["user"] == null && this.Session["creator"] == null)
			{
				StringBuilder html = new StringBuilder();

				html.Append("<div class='container-fluid border pt-5 pb-5'>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-10 offset-md-1'><h1>Like what you see?</h1></div> ");
				html.Append("</div>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-10 offset-md-1 pt-3'>Join us in the adventure to bring ideas that solves real life problem - big or small from drawing board into real life!</div> ");
				html.Append("</div>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-2 offset-md-5 mt-4'><a href=\"login\" ID = 'btnSignUpPage' Class='btn btn-secondary launchr-btn' OnClick='btnSignUpPage_Click'/>Sign Up</button></a>");
				html.Append("</div>");
				html.Append("</div>");

				signUpDiv.Controls.Add(new Literal { Text = html.ToString() });

				this.makePage();
			}
		}

		private void makePage()
		{
			SiteDB siteDB = new SiteDB();
			this.plcNumProjects.Controls.Add(new Literal
			{
				Text = siteDB.countProjectActive().ToString()
			});
			this.makeTrending(siteDB);
			this.makeNew(siteDB);
		}

		private void makeTrending(SiteDB siteDB)
		{
			List<Project> project_list = siteDB.getTransactionProjectOrderByLatest();
			if (project_list.Count() > 6)
			{
				project_list.RemoveRange(6, project_list.Count() - 6);
			}
			List<String> project_card_list = this.makePairs(this.makeCard(project_list));
			StringBuilder carousel_paginator = new StringBuilder();
			foreach (String project_card in project_card_list)
			{
				carousel_paginator.Append("<button class=\"btn btn-secondary\" data-target=\"#new-carousel\" data-slide-to=\"" + project_card_list.IndexOf(project_card) + "\">" + (project_card_list.IndexOf(project_card) + 1) + "</button>");
			}
			this.plcTrendingCarousel.Controls.Add(new Literal
			{
				Text = carousel_paginator.ToString()
			});
			// string carousel = this.makeCarousel(project_card_list);
			this.plcTrendingCarouselInner.Controls.Add(new Literal
			{
				Text = this.makeCarousel(project_card_list)
			});
		}

		private void makeNew(SiteDB siteDB)
		{
			List<Project> project_list = siteDB.getProjectAlive();
			project_list.Reverse();
			if(project_list.Count() > 6)
			{
				project_list.RemoveRange(6, project_list.Count() - 6);
			}
			List<String> project_card_list = this.makePairs(this.makeCard(project_list));
			StringBuilder carousel_paginator = new StringBuilder();
			foreach(String project_card in project_card_list)
			{
				carousel_paginator.Append("<button class=\"btn btn-secondary\" data-target=\"#new-carousel\" data-slide-to=\"" + project_card_list.IndexOf(project_card) + "\">" + (project_card_list.IndexOf(project_card) + 1) + "</button>");
			}
			this.plcNewCarousel.Controls.Add(new Literal
			{
				Text = carousel_paginator.ToString()
			});
			// string carousel = this.makeCarousel(project_card_list);
			this.plcNewCarouselInner.Controls.Add(new Literal
			{
				Text = this.makeCarousel(project_card_list)
			});
		}

		private List<String> makeCard(List<Project> project_list)
		{
			List<String> project_card_list = new List<String>();
			foreach (Project project in project_list)
			{
				project_card_list.Add("<a href=\"project?id=" + project.id + "\" class=\"col-xl-6 text-decoration-none card\"><div class=\"projects-card\"><div class=\"row\"><div class=\"col-xl-6\"><img src=\"" + project.image_path_list[0] + "\" /></div><div class=\"col-xl-6 p-4\"><div class=\"row\"><div class=\"col\"><h6>" + project.topic + "</h6></div></div><div class=\"row h-30\"><div class=\"col\"><h4>" + project.title + "</h4></div></div><div class=\"row h-30\"><div class=\"col\"><p>" + project.description + "</p></div></div><div class=\"row\"><div class=\"col\"><div class=\"progress mr-2\"><div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\"role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\"style=\"width: " + project.calcProgress() + "%\"></div></div></div></div><div class=\"row\"><div class=\"col-xl\"><span class=\"project-card-details\">$" + project.getTransactionTotal() + "</span> raised of $" + project.target + "</div><div class=\"text-right col-xl mr-2\"><span class=\"project-card-details\">" + project.calcProgress() + "%</span></div></div><div class=\"row\"><div class=\"col\"><p class=\"mb-2\">" + project.countBackers() + " backers</p></div></div></div></div></div></a>");
			}
			return project_card_list;
		}

		private List<String> makePairs(List<String> project_card_list)
		{
			List<String> project_card_pair_list = new List<String>();
			foreach(String project_card in project_card_list)
			{
				if(project_card_list.IndexOf(project_card) % 2 == 0)
				{
					StringBuilder html = new StringBuilder();
					html.Append("<div class=\"row project-card-tray\">");
					html.Append(project_card);
					if(project_card != project_card_list.Last())
					{
						html.Append(project_card_list[project_card_list.IndexOf(project_card) + 1]);
					}
					html.Append("</div>");
					project_card_pair_list.Add(html.ToString());
				}
			}
			return project_card_pair_list;
		}

		private string makeCarousel(List<String> project_card_pair_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(String project_card_pair in project_card_pair_list)
			{
				html.Append("<div class=\"carousel-item");
				if(project_card_pair_list.IndexOf(project_card_pair) == 0)
				{
					html.Append(" active");
				}
				html.Append("\">");
				html.Append(project_card_pair);
				html.Append("</div>");
			}
			return html.ToString();
		}

		protected void btnSignUpPage_Click(object sender, EventArgs e)
		{
			Response.Redirect("login");
		}
	}
}