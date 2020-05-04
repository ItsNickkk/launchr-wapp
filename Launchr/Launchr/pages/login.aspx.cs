﻿using System;
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
				this.Session["user"] = user_list[0];
				Response.Redirect("home");

			} else
			{
				//alertbox.Style["display"] = "block";
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
			} else 
			{	// everything in this else block should be error code
				if (add_user_status == 0)
				{
					// sql execution error
					displayErrorMessage("SQL Execution Error.", add_user_status);
				} else if (add_user_status == 2)
				{
					// user with same email found, show error message here...
					displayErrorMessage("Someone already has this email address. Try another email.", add_user_status);
				} else if (add_user_status == 3)
				{
					// user with same username found, show error message here...
					displayErrorMessage("Someone already has this username. Try another username.", add_user_status);
				}
			}
		}

		protected void displayErrorMessage(String errormsg, int type){
			StringBuilder html = new StringBuilder();
			html.Append("<div class=\"mt-3\" runat=\"server\">");
			html.Append("<div class=\"alert alert-danger\">");
			html.Append("<i>Error!</i> " + errormsg);
			html.Append("</div></div>");

			if(type==1){
				loginError.Controls.Add(new Literal { Text = html.ToString() });
			}
			else{
				registerError.Controls.Add(new Literal { Text = html.ToString() });
				registerErrorModal.Controls.Add(new Literal { Text = html.ToString() });
			}
			
		}
	}
}