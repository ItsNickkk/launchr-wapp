using Launchr.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
	public partial class summary_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			User current_user = (User)this.Session["user"];
			if (Session["user"] != null)
			{
				if (current_user.is_admin != true)
				{
					Response.Redirect("404.aspx");
				}
			}
			else
			{
				Response.Redirect("404.aspx");
			}
		}
	}
}