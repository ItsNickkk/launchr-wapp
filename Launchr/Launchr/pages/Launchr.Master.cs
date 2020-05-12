using Launchr.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
		}

		protected void logoutBtn_Click(object sender, EventArgs e)
		{
			// logout code here...?
		}

		protected void generateProfileDropdown(String name, int id, int type)
		{
			Response.Write("<div class=\"dropdown mr-3\">");
			Response.Write("<a id=\"profile\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-haspopup=\"true\" aria-expanded=\"false\">" + name + "</a>");
			Response.Write("<div class=\"dropdown-menu\" aria-labelledby=\"profile\">");
			if (type == 1)
			{
				Response.Write("<a class=\"dropdown-item\" href=\"profile?id=" + id + "\">Profile</a>");
				Response.Write("<a class=\"dropdown-item\" href=\"summary-admin\">Admin Panel</a>");
				Response.Write("<a class=\"dropdown-item\" href=\"add-admin\">Add Admin</a>");
				Response.Write("<a class=\"dropdown-item\" href=\"creator-approval-admin\">Approve Creator Account</a>");
				Response.Write("<a class=\"dropdown-item\" href=\"ban-user-admin\">Ban User Account</a>");
			}
			else
			{
				Response.Write("<a class=\"dropdown-item\" href=\"profile?id=" + id + "\">Profile</a>");
			}
			Response.Write("<a id=\"logoutbtn\" onserverclick=\"logoutBtn_Click\" class=\"dropdown-item\" runat=\"server\" href=\"logout\">Logout</a>");
			Response.Write("</div></div>");
		}
	}
}