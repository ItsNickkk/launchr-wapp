using System;
using System.Collections.Generic;
using System.Linq;
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
				alertbox.Style["display"] = "block";
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
				Response.Redirect("home");
			} else
			{
				if (add_creator_status == 0)
				{
					// sql execution error
					this.txtCreatorName.Text = "0";
				}
				else if (add_creator_status == 2)
				{
					// creator with same email found, show error message here...
					this.txtCreatorName.Text = "2";
				}
				else if (add_creator_status == 3)
				{
					// creator with same username found, show error message here...
					this.txtCreatorName.Text = "3";
				}
			}
		}
	}
}