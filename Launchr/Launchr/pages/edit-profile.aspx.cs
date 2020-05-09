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
		string current;
		protected void Page_Load(object sender, EventArgs e)
		{
			if(this.Session["user"] == null && this.Session["creator"] == null)
			{
				Response.Redirect("login.aspx");
			} else if (this.Session["user"] != null && this.Session["creator"] == null)
			{
				this.user = (User)this.Session["user"];
				this.creator = null;
				this.current = "user";
				this.makePage(this.user);
			} else if (this.Session["user"] == null && this.Session["creator"] != null)
			{
				this.user = null;
				this.creator = (Creator)this.Session["creator"];
				this.current = "creator";
				this.makePage(this.creator);
			} else
			{
				Response.Redirect("404.aspx");
			}

		}

		private void makePage(User user)
		{
			this.txtName.Text = user.name;
			this.txtUsername.Text = user.username;
			this.txtEmail.Text = user.email;
			this.txtPhone.Text = user.phone_number;
			this.txtAddress.Text = user.address;
			this.cobCountry.Text = user.country;
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

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			string current_password = this.txtCurrPassword.Text;
			string name = this.txtName.Text;
			string username = this.txtUsername.Text;
			string email = this.txtEmail.Text;
			string phone = this.txtPhone.Text;
			string address = this.txtAddress.Text;
			string country = this.cobCountry.SelectedValue;
			string password;
			if(this.txtPassword.Text.Trim(' ') != "")
			{
				password = this.txtPassword.Text.Trim(' ');
			} else
			{
				password = null;
			}
			if (this.current == "user")
			{
				if(this.user.password == current_password)
				{
					this.user.name = name;
					this.user.username = username;
					this.user.email = email;
					this.user.phone_number = phone;
					this.user.address = address;
					this.user.country = country;
					if(password != null)
					{
						this.user.password = password;
					}
					int update_user_status = this.user.update();
					if(update_user_status == 1)
					{
						// update successful
					} else if (update_user_status == 2)
					{
						// update failed, same email
					} else if (update_user_status == 3)
					{
						// update failed, same username
					}else
					{
						// update failed
					}
				} else
				{
					// wrong password
				}
				
			} else if (this.current == "creator")
			{
				if(this.creator.password == current_password)
				{
					this.creator.name = name;
					this.creator.username = username;
					this.creator.email = email;
					this.creator.phone_number = phone;
					this.creator.address = address;
					this.creator.country = country;
					if (password != null)
					{
						this.creator.password = password;
					}
					int update_creator_status = this.creator.update();
					if (update_creator_status == 1)
					{
						// update successful
					}
					else if (update_creator_status == 2)
					{
						// update failed, same email
					}
					else if (update_creator_status == 3)
					{
						// update failed, same username
					} else
					{
						// update failed
					}
				} else
				{
					// wrong password
				}
					
			}
			
		}
		[WebMethod]
		protected static int editProfile(object fullname, object username, object email, object hpno, object address, object newPW, object country, object currPW)
		{
			return 1;
		}
	}
}