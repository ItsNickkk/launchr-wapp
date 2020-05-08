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
	public partial class WebForm4 : System.Web.UI.Page
	{
		private User user;
		private Creator creator;

		protected void Page_Load(object sender, EventArgs e)
		{
			if(Request.QueryString["id"] != null)
			{
				try
				{
					string profile_id_str = Request.QueryString["id"];
					if (profile_id_str.StartsWith("1"))
					{
						user = new SiteDB().getUserById(int.Parse(profile_id_str));
						creator = null;
					} else if (profile_id_str.StartsWith("2"))
					{
						creator = new SiteDB().getCreatorById(int.Parse(profile_id_str));
						user = null;
					}
					if (user == null && creator == null)
					{
						Response.Redirect("404.aspx");
					}
					else if (user != null)
					{
						this.makePage(user);
					} else
					{
						this.makePage(creator);
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

		private void makePage(User user)
		{
			this.makeName(user.name);
			if(user.getBacked().Count >= 25)
			{
				this.makeTitle(0);
			}
			this.makeCountry(user.country);
			if (this.Session["user"]!= null)
			{
				User current_user = (User)this.Session["user"];
				if(current_user.id == user.id)
				{
					this.makeEditButton(user.id);
				}
			}
			this.makeTabTitle(0);
			this.makeCards(user.getBacked());
			this.makeComments(user.getComments());
		}

		private void makePage(Creator creator)
		{
			this.makeName(creator.name);
			this.makeTitle(1);
			this.makeCountry(creator.country);
			if(this.Session["creator"] != null)
			{
				Creator current_creator = (Creator)this.Session["creator"];
				if (current_creator.id == creator.id)
				{
					this.makeEditButton(creator.id);
				}
			}
			this.makeTabTitle(1);
			this.makeCards(creator.getProjects());
			this.makeComments(creator.getComments());
		}

		private void makeComments(List<Comment> comment_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Comment comment in comment_list)
			{
				if(comment.user != null)
				{
					html.Append("<div id=\"" + comment.user.id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><h4>" + comment.user.name + "</h4><a href=\"project?id=" + comment.project.id + "\"><h5>reply to " + comment.project.title + "</h5></a><p>" + comment.content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted align-right\">#" + comment.id + "</h5></div><div class=\"row pl-3\"><div class=\"col pb-3\"><a href=\"project?id=" + comment.project.id + "#" + comment.id + "\" class=\"comment-input-btn\">Go to Comment</a></div></div></div></div></div>");
				} else if (comment.creator != null)
				{
					html.Append("<div id=\"" + comment.creator.id + "\" class=\"row p-2\"><div class=\"col-xl-12 border pt-3\"><div class=\"row pl-3\"><div class=\"col-xl-10\"><h4>" + comment.creator.name + "</h4><a href=\"project?id=" + comment.project.id + "\"><h5>reply to " + comment.project.title + "</h5></a><p>" + comment.content + "</p></div><div class=\"col-xl-2\"><h5 class=\"text-muted align-right\">#" + comment.id + "</h5></div><div class=\"row pl-3\"><div class=\"col pb-3\"><a href=\"project?id=" + comment.project.id + "#" + comment.id + "\" class=\"comment-input-btn\">Go to Comment</a></div></div></div></div></div>");
				}
			}

			this.plcComments.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeTabTitle(int mode)
		{
			if(mode == 0)
			{
				this.plcTabTitle.Controls.Add(new Literal
				{
					Text = "<a class=\"nav-link active project-tab p-3\" data-toggle=\"tab\" href=\"#project-backed\">Project Backed</a>"
				});
			} else if (mode == 1)
			{
				this.plcTabTitle.Controls.Add(new Literal
				{
					Text = "<a class=\"nav-link active project-tab p-3\" data-toggle=\"tab\" href=\"#project-backed\">Project Created</a>"
				});
			}
		}

		private void makeCards(List<Project> project_list)
		{
			project_list.Reverse();
			StringBuilder html = new StringBuilder();
			foreach (Project project in project_list)
			{
				html.Append("<div class=\"row mb-3 search-card\"><div class=\"col neumorph\"><div class=\"row mb-3\"><div class=\"col-xl-4\"><img src=\"" + project.image_path_list[0] + "\" /></div><div class=\"col-xl-5 pt-3 pl-0\"><a href=\"project.aspx?id=" + project.id + "\"><h3>" + project.title + "</h3></a><p>" + project.description + "</p></div><div class=\"col-xl-3 pt-3\"><div class=\"row\"><div class=\"col\"><div class=\"progress\"><div class=\"progress-bar progress-bar-striped bg-launchr progress-bar-animated\"role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\"style=\"width: " + project.calcProgress() + "%\"></div></div></div></div><div class=\"row\"><div class=\"col-xl mt-3\"><span class=\"project-card-details\">$" + project.getTransactionTotal() + "</span> raised of $" + project.target + "</div><div class=\"col-xl text-right mt-3\"><span class=\"project-card-details\">" + project.calcProgress() + "%</span></div></div><div class=\"row\"><div class=\"col\"><p class=\"mb-2\">" + project.countBackers() + " backers</p></div><div class=\"col\"><p class=\"mb-2 text-right\">" + project.calcRemainingTime() + " days left</p></div></div></div></div></div></div>");
			}
			this.plcCard.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeEditButton(int id)
		{
			this.plcEdit.Controls.Add(new Literal
			{
				Text = "<a ID=\"editProfile\" href=\"edit-profile?id=\"" + id + " class=\"btn launchr-btn mt-2\">Edit Profile</a>"
			});
		}

		private void makeCountry(string country)
		{
			this.plcCountry.Controls.Add(new Literal
			{
				Text = country
			});
		}

		private void makeName(string name)
		{
			this.plcName.Controls.Add(new Literal
			{
				Text = name
			});
		}

		private void makeTitle(int mode)
		{
			if(mode == 0)
			{
				this.plcTitle.Controls.Add(new Literal
				{
					Text = "<span class=\"backer-status mt-3\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"This user has backed over 25 projects!\">Superbacker</span>"
				});
			} else if (mode == 1)
			{
				this.plcTitle.Controls.Add(new Literal
				{
					Text = "<span class=\"backer-status mt-3\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"This user is a creator.\">Creator</span>"
				});
			}
				
			
		}
	}
}