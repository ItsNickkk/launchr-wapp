using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;

namespace Launchr.pages
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		protected void btnSignUpPage_Click(object sender, EventArgs e)
		{
			Response.Redirect("login");
		}
	}
}