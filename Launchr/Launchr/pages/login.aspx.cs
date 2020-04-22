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
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		protected void btnLogin_Click(object sender, EventArgs e)
		{
			SiteDB siteDB = new SiteDB();
			List<User> user_list = siteDB.getUserByUsernameAndPassword(this.txtMemberLoginUsername.Text, this.txtMemberLoginPasssword.Text);
			if(user_list.Count() == 0)
			{
				this.txtMemberLoginUsername.Text = "Incorrect Credentials!";
			} else if (user_list.Count() == 1)
			{
				this.txtMemberLoginUsername.Text = "Success!";

			}

		}
	}
}