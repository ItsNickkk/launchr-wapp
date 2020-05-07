using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
	public partial class add_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		[WebMethod]
		public static int assignAdmin(object userID){
			return 1; //return 1 for successful data manipulation
		}

		[WebMethod]
		public static int unassignAdmin(object userID)
		{
			return 1; //return 1 for successful data manipulation
		}
	}
}