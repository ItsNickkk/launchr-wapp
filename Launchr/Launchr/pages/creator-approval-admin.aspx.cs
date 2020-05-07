using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
	public partial class creator_approval_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		[WebMethod]
		public static int approveCreator(object userID)
		{
			return 1;
		}

		[WebMethod]
		public static int rejectCreator(object userID)
		{
			return 1;
		}
	}
}