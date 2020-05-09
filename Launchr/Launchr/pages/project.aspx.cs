using Launchr.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Services;

namespace Launchr.pages
{
	public partial class WebForm3 : System.Web.UI.Page
	{
		Project project;
		protected void Page_Load(object sender, EventArgs e)
		{
			User user = (User)this.Session["user"];
			if(this.Session["user"] != null){
				txtUserID.Value = user.id.ToString();
			}	
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
					project = new SiteDB().getProjectById(project_id);
					if (project != null & project.creator.status == 1)
					{
						this.makePage(project);
						String project_title = project.title + " | Launch:r";
						Page.Title = project_title;

					} else
					{
						// project does not exist, do something here!
						Response.Redirect("404.aspx");
					}
				} catch (Exception ex)
				{
					// id invalid (not convertible to int), do something here!
					Response.Redirect("404.aspx");
				}

			}
			else
			{
				Response.Redirect("404.aspx");
			}

			txtCommentReplyPointer.Attributes.Add("readonly", "readonly");



		}

		private void makePage(Project project)
		{
			this.makeContent(project.content);
			this.makeTitle(project.title);
			this.makeDesc(project.description);
			this.makeAlbum(project.image_path_list);
			this.makeTarget(project.getTransactionTotal(), project.target, project.calcProgress());
			this.makeCreatorName(project.creator);
			this.makeBackers(project.countBackers());
			this.makeRemaining(project.calcRemainingTime());
			this.makeTiers(project, project.getTiers());
			this.makeComments(project.getComments());
		}

		private void makeCreatorName(Creator creator)
		{
			this.plcCreatorName.Controls.Add(new Literal
			{
				Text = "<a class=\"creator-info\" href=\"profile?id=" + creator.id + "\">" + creator.name + "</a>"
			});
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

		private void makeTarget(int current, int target, int percentage)
		{
			
			StringBuilder html = new StringBuilder();
			html.Append("$" + current.ToString() + " plegded of $" + target.ToString());
			this.plcTarget.Controls.Add(new Literal
			{
				Text = html.ToString()
			});

			StringBuilder html_progress = new StringBuilder();
			html_progress.Append("<div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\" role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: " + percentage.ToString() + "%\"></div>");
			this.plcProgressBar.Controls.Add(new Literal
			{
				Text = html_progress.ToString()
			});
		}

		private void makeBackers(int num)
		{
			StringBuilder html = new StringBuilder();
			html.Append(num + " backers");
			this.plcBackers.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeRemaining(int remaining)
		{
			DateTime time_now = DateTime.Now;
			StringBuilder html = new StringBuilder();
			html.Append(remaining + " days left");
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
				if(comment.parent_comment == null)
				{
					if(comment.user != null)
					{
						html.Append(this.generateComment(comment.id, comment.user.id, comment.user.name, comment.content, 600000, false));
					} else
					{
						html.Append(this.generateComment(comment.id, comment.creator.id, comment.creator.name, comment.content, 600000, true));
					}
				} else
				{
					if (comment.user != null)
					{
						html.Append(this.generateComment(comment.id, comment.user.id, comment.user.name, comment.content, comment.parent_comment.id, false));
					}
					else
					{
						html.Append(this.generateComment(comment.id, comment.creator.id, comment.creator.name, comment.content, comment.parent_comment.id, true));
					}
				}
				
			}

			this.plcComment.Controls.Add(new Literal
			{
				Text = html.ToString()
			});

		}

		private string generateComment(int comment_id, int author_id, string author_name, string content, int parent_comment_id, bool label)
		{
			StringBuilder s = new StringBuilder();
			s.Append("<div id=\"" + comment_id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><a href=\"profile.aspx?id=" + author_id + "\"><h4>" + author_name + "</h4></a>");
			if (label == true)
			{
				s.Append("<p>Creator</p>");
			}
			if(parent_comment_id != 600000)
			{
				s.Append("<a href=\"#" + parent_comment_id + "\"><h5>reply to #" + parent_comment_id + "</h5></a>");
			}
			s.Append("<p>" + content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted\">#" + comment_id + "</h5></div></div><div class=\"row pl-3\"><div class=\"col pb-3\"><input type=\"button\" class=\"reply-btn comment-input-btn\" value=\"Reply\" /></div></div></div></div>");
			return s.ToString();
			/*if (parent_comment_id == 600000)
			{
				return "<div id=\"" + comment_id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><a href=\"profile.aspx?id=" + author_id + "\"><h4>" + author_name + "</h4></a><p>" + content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted\">#" + comment_id + "</h5></div></div><div class=\"row pl-3\"><div class=\"col pb-3\"><input type=\"button\" class=\"reply-btn comment-input-btn\" value=\"Reply\" /></div></div></div></div>";
			} else
			{
				return "<div id=\"" + comment_id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><a href=\"profile.aspx?id=" + author_id + "\"><h4>" + author_name + "</h4></a><a href=\"#" + parent_comment_id + "\"><h5>reply to #" + parent_comment_id + "</h5></a><p>" + content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted\">#" + comment_id + "</h5></div></div><div class=\"row pl-3\"><div class=\"col pb-3\"><input type=\"button\" class=\"reply-btn comment-input-btn\" value=\"Reply\" /></div></div></div></div>";
			}*/
		}

		private void makeTiers(Project project, List<Tier> tier_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Tier tier in tier_list)
			{
				int num = project.getTierNumber(tier);
				int percentage = (int)Math.Ceiling((double)num / tier.max_amount * 100);
				html.Append("<div class=\"row pt-3\"><div class=\"p-4 tier-card neumorph\"><h4 class=\"pledge-title\">" + tier.title + "</h4><h4 class=\"pledge-amount\">$" + tier.value + "</h4><p class=\"text-muted\">Description</p><span><zero-md><template><xmp>" + tier.description + "</xmp></template></zero-md></span><div class=\"progress mt-4\"><div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\" role=\"progressbar\"aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: " + percentage + "%\"></div></div><p>" + num + " out of " + tier.max_amount + " slots left</p><button type=\"button\" runat=\"server\" Class=\"btn join-sign-up-btn mt-3 launchr-btn pledge-tier-btn\" data-toggle=\"modal\" data-target=\"#tier-pledge-modal\">Pledge</button><input type=\"text\" class=\"d-none tier-id\" readonly value=\"" + tier.id + "\"/></div></div>");
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
			string parent = txtCommentReplyPointer.Text;
			int author_id;
			if (this.Session["user"] != null)
			{
				// logged in as user
				User user_temp = (User)this.Session["user"];
				author_id = user_temp.id;
				this.remakePage(1, this.leaveComment(parent, author_id, content));
			} else if (this.Session["creator"] != null)
			{
				// logged in as creator
				Creator creator_temp = (Creator)this.Session["creator"];
				if(creator_temp.id == this.project.creator.id)
				{
					author_id = creator_temp.id;
					this.remakePage(1, this.leaveComment(parent, author_id, content));
				} else
				{
					displayErrorMessage("You cannot comment on this project.", 1, 0);
				}
			} else
			{
				displayErrorMessage("Are you logged in?", 1, 0);
			}
			
		}

		private int leaveComment(string parent, int author_id, string content)
		{
			if (parent == "this project")
			{
				return this.project.addComment(author_id, content);
			} else
			{
				try
				{
					Comment target_comment = new SiteDB().getCommentById(int.Parse(parent));
					if (target_comment != null)
					{
						return target_comment.addReply(author_id, content);
					} else
					{
						return 0;
					}
				} catch (Exception e)
				{
					return 0;
				}
			}
		}

		private void remakePage(int a1, int a2)
		{
			Response.Redirect(Request.RawUrl);
			if(a2 == 1)
			{
				displayErrorMessage("Comment successfully added", a1, a2);
			} else
			{
				displayErrorMessage("Error occured, please try again", a1, a2);
			}
			
		}

		protected void displayErrorMessage(String alertmsg, int type, int status)
		{
			StringBuilder html = new StringBuilder();
			html.Append("<div class=\"mt-3\" runat=\"server\">");
			if (status == 1)
			{
				html.Append("<div class=\"alert alert-success\">");
			}
			else
			{
				html.Append("<div class=\"alert alert-danger\">");
			}
			html.Append(alertmsg);
			html.Append("</div></div>");

			if (type == 1)
			{
				plcCommentAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else if (type == 5)
			{
				//registerAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else
			{
				//registerAlert.Controls.Add(new Literal { Text = html.ToString() });
				//registerAlertModal.Controls.Add(new Literal { Text = html.ToString() });
			}

		}
		[WebMethod]
		public static int pledgeTier(object backerID, object tierID)
		{
			return 1; //return when successful
		}

		[WebMethod]
		public static int pledgeTierNoReward(object backerID, object tierID, object amount)
		{
			return 1; //return when successful
		}
	}
}