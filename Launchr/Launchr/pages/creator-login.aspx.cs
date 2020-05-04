﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;

namespace Launchr.pages
{
	public partial class WebForm5 : System.Web.UI.Page
	{
		private SiteDB siteDB;
		protected void Page_Load(object sender, EventArgs e)
		{
			siteDB = new SiteDB();
		}

		protected void btnCreatorLogin_Click(object sender, EventArgs e)
		{
			List<Creator> creator_list = this.siteDB.getCreatorByUsernameAndPassword(this.txtCreatorLoginUsername.Text, this.txtCreatorLoginPasssword.Text);
			if(creator_list.Count() == 1)
			{
				this.Session["creator"] = creator_list[0];
				Response.Redirect("home");
			} else
			{
				displayErrorMessage("Username or password is incorrect.", 1);
			}
		}
		protected void btnCreatorSignUp_Click(object sender, EventArgs e)
		{
			string name = this.txtCreatorName.Text;
			string address = this.txtCreatorAddress.Text;
			string phone_number = this.txtCreatorPhone.Text;
			string email = this.txtCreatorEmail.Text;
			string country = this.txtCreatorCountry.Text;
			HttpPostedFile document = this.filDocument.PostedFile;
			string type = this.txtBusinessType.Text;
			string username = this.txtCreatorUsername.Text;
			string password = this.txtCreatorPassword.Text;
			string document_name = "creator_" + username + ".pdf";
			string document_path = System.IO.Path.Combine(Server.MapPath("~/Content/documents/"), document_name);

			int add_creator_status = siteDB.addNewCreator(name, address, phone_number, email, country, document_path, type, username, password);
			if (add_creator_status == 1)
			{
				// signup successful, save document and redirect
				document.SaveAs(document_path);
				displayErrorMessage("Your information had been submitted. You may log in to your account after 3-5 working days upon Launch:r administrator's approval.", 5);
			} else
			{
				if (add_creator_status == 0)
				{
					// sql execution error
					displayErrorMessage("<i>Error!</i> SQL Execution Error.", 4);
				}
				else if (add_creator_status == 2)
				{
					// creator with same email found, show error message here...
					displayErrorMessage("<i>Error!</i> Someone already has this email address. Try another email.", 2);
				}
				else if (add_creator_status == 3)
				{
					// creator with same username found, show error message here...
					displayErrorMessage("<i>Error!</i> Someone already has this username. Try another username.", 3);
				}
			}
		}

		protected void displayErrorMessage(String alertmsg, int type)
		{
			StringBuilder html = new StringBuilder();
			html.Append("<div class=\"mt-3\" runat=\"server\">");
			if (type == 5)
			{
				html.Append("<div class=\"alert alert-info\">");
			}
			else
			{
				html.Append("<div class=\"alert alert-danger\">");
			}
			html.Append(alertmsg);
			html.Append("</div></div>");

			if (type == 1)
			{
				loginAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else if (type == 5)
			{
				registerAlert.Controls.Add(new Literal { Text = html.ToString() });
			}
			else
			{
				registerAlert.Controls.Add(new Literal { Text = html.ToString() });
				registerAlertModal.Controls.Add(new Literal { Text = html.ToString() });
			}

		}
	}
}