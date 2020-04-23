using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Launchr.models;

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
			if(user_list.Count() == 0)
			{
				alertbox.Style["display"] = "block";
			}
			else if (user_list.Count() == 1)
			{
				Response.Redirect("home");

			}

		}

		protected void btnSignUp_Click(object sender, EventArgs e)
		{
			string member_name = this.txtMemberName.Text;
			string member_username = this.txtMemberUsername.Text;
			string member_email = this.txtMemberEmail.Text;
			string member_phone_number = this.txtMemberPhone.Text;
			string member_address = this.txtMemberAddress.Text;
			string member_password = this.txtMemberPassword.Text;
			string member_country = this.txtMemberCountry.SelectedValue;

			int add_user_status = siteDB.addNewUser(member_name, member_address, member_phone_number, member_email, member_country, member_username, member_password);
			if (add_user_status == 1)
			{
				// signup successful; do something here
			} else
			{
				// signup failed, do something here
			}
		}
	}
}