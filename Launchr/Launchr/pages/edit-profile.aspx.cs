using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;

namespace Launchr.pages
{
	public partial class edit_profile : System.Web.UI.Page
	{
		User user;
		Creator creator;
		protected void Page_Load(object sender, EventArgs e)
		{
			if(this.Session["user"] != null || this.Session["creator"] != null)
			{
				if (Request.QueryString["id"] == null)
				{
					Response.Redirect("404.aspx");
				}
				else
				{
					string profile_id_str = Request.QueryString["id"];
					if (profile_id_str.StartsWith("1"))
					{
						if (int.Parse(profile_id_str) == ((User)this.Session["user"]).id)
						{
							user = (User)this.Session["user"];
							creator = null;
						}

					}
					else if (profile_id_str.StartsWith("2"))
					{
						if (int.Parse(profile_id_str) == ((Creator)this.Session["creator"]).id)
						{
							creator = new SiteDB().getCreatorById(int.Parse(profile_id_str));
							user = null;
						}

					}
					else
					{
						Response.Redirect("404.aspx");
					}
					if (user == null && creator == null)
					{
						Response.Redirect("404.aspx");
					}
					else if (user != null && !IsPostBack)
					{
						this.makePage(user);
					}
					else if (creator != null && !IsPostBack)
					{
						this.makePage(creator);
					}
				}
			}
			else
			{
				Response.Redirect("login.aspx");
			}

		}

		private void makePage(Creator creator)
		{
			this.txtName.Text = creator.name;
			this.txtUsername.Text = creator.username;
			this.txtEmail.Text = creator.email;
			this.txtPhone.Text = creator.phone_number;
			this.txtAddress.Text = creator.address;
			this.cobCountry.SelectedValue = creator.country;
		}

		private void makePage(User user)
		{
			this.txtName.Text = user.name;
			this.txtUsername.Text = user.username;
			this.txtEmail.Text = user.email;
			this.txtPhone.Text = user.phone_number;
			this.txtAddress.Text = user.address;
			this.cobCountry.SelectedValue = user.country;
		}


		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			if(this.Session["user"] != null)
			{
				User user = (User)this.Session["user"];
				if(this.txtCurrPassword.Text == user.password)
				{
					user.name = this.txtName.Text;
					user.username = this.txtUsername.Text;
					user.email = this.txtEmail.Text;
					user.phone_number = this.txtPhone.Text;
					user.address = this.txtAddress.Text;
					user.country = this.cobCountry.SelectedValue;
					if(this.txtPassword.Text.Trim(' ') != "")
					{
						user.password = this.txtPassword.Text;
					}
					int user_update_status = user.update();
					if (user_update_status == 1)
					{
						// update successful
					}
					else if (user_update_status == 2)
					{
						// same email
					}
					else if (user_update_status == 3)
					{
						// same username
					}
					else
					{
						// critical error
					}
				} else
				{
					// wrong password
				}
				
			} else if (this.Session["creator"] != null)
			{
				Creator creator = (Creator)this.Session["creator"];
				if (this.txtCurrPassword.Text == creator.password)
				{
					creator.name = this.txtName.Text;
					creator.username = this.txtUsername.Text;
					creator.email = this.txtEmail.Text;
					creator.phone_number = this.txtPhone.Text;
					creator.address = this.txtAddress.Text;
					creator.country = this.cobCountry.SelectedValue;
					if (this.txtPassword.Text.Trim(' ') != "")
					{
						creator.password = this.txtPassword.Text;
					}
					int creator_update_status = creator.update();
					if (creator_update_status == 1)
					{
						// update successful
					}
					else if (creator_update_status == 2)
					{
						// same email
					}
					else if (creator_update_status == 3)
					{
						// same username
					}
					else
					{
						// critical error
					}
				} else
				{
					// wrong password
				}
			}
		}
	}
}