﻿using Launchr.models;
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
		Project project;
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

			if (Request.QueryString["id"] != null)
			{
				try
				{
					int project_id = int.Parse(Request.QueryString["id"]);
					List<Project> project_list = new SiteDB().getProjectById(project_id);
					if (project_list.Count() != 0)
					{
						project = (Project)project_list[0];
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
			else
			{
				Response.Redirect("project.aspx?id=300003");
			}
			

			

		}

		private void makePage(Project project)
		{
			this.makeContent(project.content);
			this.makeTitle(project.title);
			this.makeDesc(project.description);
			this.makeAlbum(project.image_path_list);
			this.makeTarget(project.getTransactionTotal(), project.target);
			this.makeBackers(project.countBackers());
			this.makeComments(project.getComments());
			this.makeRemaining(project.time_end);
			this.makeTiers(project, project.getTiers());
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

		private void makeComments(List<Comment> comment_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Comment comment in comment_list)
			{
				html.Append("<div id=\"" + comment.id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><a href=\"profile.aspx?id=" + comment.user.id + "\"><h4>" + comment.user.name + "</h4></a><p>" + comment.content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted\">#" + comment.id + "</h5></div></div><div class=\"row pl-3\"><div class=\"col pb-3\"><input type=\"button\" class=\"reply-btn comment-input-btn\" value=\"Reply\" /></div></div></div></div>");
			}

			this.plcComments.Controls.Add(new Literal
			{
				Text = html.ToString()
			});

		}

		private void makeTiers(Project project, List<Tier> tier_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Tier tier in tier_list)
			{
				int num = project.getTierNumber(tier);
				int percentage = (int)Math.Ceiling((double)num / tier.max_amount * 100);
				html.Append("<div class=\"row pt-3\"><div class=\"p-4 tier-card\"><h4>" + tier.title + "</h4><h4>$" + tier.value + "</h4><p class=\"text-muted\">Description</p><span><zero-md><template><xmp>" + tier.description + "</xmp></template></zero-md></span><div class=\"progress mt-4\"><div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\" role=\"progressbar\"aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: " + percentage + "%\"></div></div><p>" + num + " out of " + tier.max_amount + " slots left</p><asp:Button runat=\"server\" Text=\"Pledge\" CssClass=\"btn join-sign-up-btn mt-3 launchr-btn\" /></div></div>");
			}
			this.plcTier.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
			this.plcTierSide.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}
		protected void btnComment_Click(object sender, EventArgs e)
		{
			string content = txtProjectComment.Text;
			if(this.Session["user"] != null && content.TrimStart(' ') != "")
			{
				if (txtCommentReplyPointer.Text == "")
				{
					int add_comment_status = project.addComment((User)this.Session["user"], content);
					if (add_comment_status == 1)
					{
						// add comment successful
					} else
					{
						// add comment failed
					}
				}
				
			}
			
		}
	}
}