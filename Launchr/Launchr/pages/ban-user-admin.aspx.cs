using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Launchr.models;

namespace Launchr.pages
{
	public partial class ban_user_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			SiteDB siteDB = new SiteDB();
			this.makeUserList(siteDB.getAllUsers());
			this.makeCreatorList(siteDB.getAllCreators());
		}

		private void makeUserList(List<User> user_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(User user in user_list)
			{
				if(user.status == 1)
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + user.id + "</th><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnBanUser launchr-btn btn p-2 btnBanUser\">Ban User</button></td></tr>");
				} else
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + user.id + "</th><td>" + user.name + "</td><td>" + user.email + "</td><td>" + user.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnUnbanUser launchr-btn btn p-2 btnUnbanUser\">Unban User</button></td></tr>");
				}
			}

			this.plcUserList.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		private void makeCreatorList(List<Creator> creator_list)
		{
			StringBuilder html = new StringBuilder();
			foreach(Creator creator in creator_list)
			{
				if (creator.status == 1)
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + creator.id + "</th><td>" + creator.name + "</td><td>" + creator.email + "</td><td>" + creator.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnBanUser launchr-btn btn p-2 btnBanUser\">Ban User</button></td></tr>");
				} else
				{
					html.Append("<tr><th scope=\"row\" class=\"text-right\">" + creator.id + "</th><td>" + creator.name + "</td><td>" + creator.email + "</td><td>" + creator.username + "</td><td class=\"text-center\"><button type=\"button\" class=\"btnUnbanUser launchr-btn btn p-2 btnUnbanUser\">Unban User</button></td></tr>");
				}
			}
			this.plcCreatorList.Controls.Add(new Literal
			{
				Text = html.ToString()
			});
		}

		[WebMethod]
		public static int banMember(object userID)
		{
			int user_id = int.Parse((string)userID);
			User user = new SiteDB().getUserById(user_id);
			if (user != null)
			{
				user.status = 0;
				return user.update();
			}
			else
			{
				return 0;
			}
		}

		[WebMethod]
		public static int unbanMember(object userID)
		{
			int user_id = int.Parse((string)userID);
			User user = new SiteDB().getUserById(user_id);
			if (user != null)
			{
				user.status = 1;
				return user.update();
			} else
			{
				return 0;
			}
		}

		[WebMethod]
		public static int banCreator(object userID)
		{
			int creator_id = int.Parse((string)userID);
			Creator creator = new SiteDB().getCreatorById(creator_id);
			if(creator != null)
			{
				creator.status = 0;
				return creator.update();
			} else
			{
				return 0;
			}
		}

		[WebMethod]
		public static int unbanCreator(object userID)
		{
			return 1; //return 1 for successful data manipulation
		}
	}
}