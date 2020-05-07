using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;
using System.Text;

namespace Launchr.pages
{
	public partial class add_admin : System.Web.UI.Page
	{
		SiteDB siteDB;
		protected void Page_Load(object sender, EventArgs e)
		{
			siteDB = new SiteDB();
			this.makeUserList(siteDB.getAllUsers());

		}

		private void makeUserList(List<User> user_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(User user in user_list)
			{
				if (!user.is_admin)
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + user.id.ToString() + "</th><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnAssignAdmin launchr-btn btn p-2 assign-admin-btn\">Assign as admin</button></td></tr>");
				} else
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + user.id.ToString() + "</th><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnUnassignAdmin launchr-btn btn p-2 assign-admin-btn\">Unassign admin</button></td></tr>");
				}
			}

			this.plcUserAdminList.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		[WebMethod]
		public static int assignAdmin(object userID){
			int user_id = int.Parse((string)userID);
			List<User> user_list = new SiteDB().getUserById(user_id);
			if (user_list.Count() == 1)
			{
				User user = user_list[0];
				user.is_admin = true;
				int update_user_status = new SiteDB().updateUser(user);
				return update_user_status;
			} else
			{
				return 0; // no user found (should not happen)
			}
		}

		[WebMethod]
		public static int unassignAdmin(object userID)
		{
			int user_id = int.Parse((string)userID);
			List<User> user_list = new SiteDB().getUserById(user_id);
			if (user_list.Count() == 1)
			{
				User user = user_list[0];
				user.is_admin = false;
				int update_user_status = new SiteDB().updateUser(user);
				return update_user_status;
			}
			else
			{
				return 0; // no user found (should not happen)
			}
		}
	}
}