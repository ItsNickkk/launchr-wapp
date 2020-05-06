using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Launchr.models;
using System.Text;

namespace Launchr.pages
{
	public partial class WebForm2 : System.Web.UI.Page
	{
		private SiteDB siteDB;
		protected void Page_Load(object sender, EventArgs e)
		{
			if(this.Session["user"] != null || this.Session["creator"] != null){
				Response.Redirect("404.aspx");
			}
			siteDB = new SiteDB();
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			List<User> user_list = siteDB.getUserByUsernameAndPassword(this.txtMemberLoginUsername.Text, this.txtMemberLoginPasssword.Text);
			if (user_list.Count() == 1) 
			{
				// exactly one user exists with the same username and password
				// store current login user as User object in session
				// (remember to explicitly declare the user object before use in later pages like so: User user = (User) this.Session["user"];)
				User user = (User)user_list[0];
				if (user.status == 1)
				{
					this.Session["user"] = user;
					Response.Redirect("home");
				} else // if user.status is other than 1 
				{
					if (user.status == 0)
					{
						// user is banned, do something here...
						displayErrorMessage("This account had been banned for violating our rules", 1);
					} else
					{
						// user account error, contact admin...
						displayErrorMessage("Unexpected Error. Please contact administrator at <a href=\"mailto:support@launchr.com\">support@launchr.com</a>", 1);
					}
				}

			} else
			{
				displayErrorMessage("Username or password is incorrect.", 1);
			}

		}

		protected void btnSignUp_Click(object sender, EventArgs e)
		{
			// validators exist, so no more validation here

			string member_name = this.txtMemberName.Text;
			string member_username = this.txtMemberUsername.Text;
			string member_email = this.txtMemberEmail.Text;
			string member_phone_number = this.txtMemberPhone.Text;
			string member_address = this.txtMemberAddress.Text;
			string member_password = this.txtMemberPassword.Text;
			string member_country = this.txtMemberCountry.SelectedValue;

			// can directly use siteDB function here, because error checking is available in SiteDB class/object

			int add_user_status = siteDB.addNewUser(member_name, member_address, member_phone_number, member_email, member_country, member_username, member_password);
			if (add_user_status == 1)
			{
				// signup successful; do something here
				displayErrorMessage("<i>Success!</i> Registration successful! You may log in now.", 5);
			} else 
			{	// everything in this else block should be error code
				if (add_user_status == 0)
				{
					// sql execution error
					displayErrorMessage("<i>Error!</i> SQL Execution Error.", 4);
				} else if (add_user_status == 2)
				{
					// user with same email found, show error message here...
					displayErrorMessage("<i>Error!</i> Someone already has this email address. Try another email.", 2);
				} else if (add_user_status == 3)
				{
					// user with same username found, show error message here...
					displayErrorMessage("<i>Error!</i> Someone already has this username. Try another username.", 3);
				}
			}
		}

		protected void displayErrorMessage(String alertmsg, int type){
			StringBuilder html = new StringBuilder();
			html.Append("<div class=\"mt-3\" runat=\"server\">");
			if (type==5){
				html.Append("<div class=\"alert alert-success\">");
			}
			else{
				html.Append("<div class=\"alert alert-danger\">");
			}
			html.Append(alertmsg);
			html.Append("</div></div>");

			if(type==1){
				loginAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else if(type==5){
				registerAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else{
				registerAlert.Controls.Add(new Literal { Text = html.ToString() });
				registerAlertModal.Controls.Add(new Literal { Text = html.ToString() });
			}
			
		}
	}
}