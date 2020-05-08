using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
			User user = (User)this.Session["user"];
			Creator creator = (Creator)this.Session["creator"];
			if (this.Session["user"] == null && this.Session["creator"] == null)
			{
				StringBuilder html = new StringBuilder();

				html.Append("<div class='container-fluid border pt-5 pb-5'>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-10 offset-md-1'><h1>Like what you see?</h1></div> ");
				html.Append("</div>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-10 offset-md-1 pt-3'>Join us in the adventure to bring ideas that solves real life problem - big or small from drawing board into real life!</div> ");
				html.Append("</div>");
				html.Append("<div class='row'>");
				html.Append("<div class='text-center col-2 offset-md-5 mt-4'><a href=\"login\" ID = 'btnSignUpPage' Class='btn btn-secondary launchr-btn' OnClick='btnSignUpPage_Click'/>Sign Up</button></a>");
				html.Append("</div>");
				html.Append("</div>");

				signUpDiv.Controls.Add(new Literal { Text = html.ToString() });
			}
		}

		protected void btnSignUpPage_Click(object sender, EventArgs e)
		{
			Response.Redirect("login");
		}
	}
}