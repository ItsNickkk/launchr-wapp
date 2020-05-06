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
			this.makeTitle(project.title);
			this.makeDesc(project.description);
			this.makeAlbum(project.image_path_list);
			this.makeTarget(20, project.target);
			this.makeBackers(20);
			this.makeRemaining(project.time_end);
		}

		private void makeAlbum(List<String> image_path_list)
		{
			StringBuilder html_indicator = new StringBuilder();
			StringBuilder html_images = new StringBuilder();
			foreach(string image_path in image_path_list)
			{
				if (image_path_list.IndexOf(image_path) != 0)
				{
					html_indicator.Append("<li data-target=\"#project-photo-carousel\" data-slide-to=\"" + image_path_list.IndexOf(image_path) + "\"></li>");
					html_images.Append("<div class=\"carousel-item project-photo-div\"><img class=\"project-photo-carousel\" src=\"" + image_path + "\" /></div>");
				} else
				{
					html_indicator.Append("<li data-target=\"#project-photo-carousel\" data-slide-to=\"" + image_path_list.IndexOf(image_path) + "\" class=\"active\"></li>");
					html_images.Append("<div class=\"carousel-item active project-photo-div\"><img class=\"project-photo-carousel\" src=\"" + image_path + "\" /></div>");
				}
				
			}
			this.plcAlbumIndicator.Controls.Add(new Literal
			{
				Text = html_indicator.ToString()
			});
			this.plcImageAlbum.Controls.Add(new Literal
			{
				Text = html_images.ToString()
			});


		}

		private void makeTitle(string title)
		{
			StringBuilder html = new StringBuilder();
			html.Append(title);
			this.plcTitle.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeDesc(string desc)
		{
			StringBuilder html = new StringBuilder();
			html.Append(desc);
			this.plcDescription.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
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

		private void makeTarget(int current, int target)
		{
			StringBuilder html = new StringBuilder();
			html.Append("$" + current.ToString() + " plegded of $" + target.ToString());
			this.plcTarget.Controls.Add(new Literal
			{
				Text = html.ToString()
			});

			StringBuilder html_progress = new StringBuilder();
			int percentage = (int)Math.Ceiling((double)current / target * 100);
			html_progress.Append("<div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\" role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: " + percentage.ToString() + "%\"></div>");
			this.plcProgressBar.Controls.Add(new Literal
			{
				Text = html_progress.ToString()
			});
		}

		private void makeBackers(int num)
		{
			StringBuilder html = new StringBuilder();
			html.Append(num.ToString() + " backers");
			this.plcBackers.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeRemaining(DateTime time_end)
		{
			DateTime time_now = DateTime.Now;
			int in_between = (int) (time_end - time_now).TotalDays;
			StringBuilder html = new StringBuilder();
			html.Append(in_between.ToString() + " days left");
			this.plcRemaining.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}
	}
}