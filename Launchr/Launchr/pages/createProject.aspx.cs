using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
	public partial class WebForm6 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnCreateProject_Click(object sender, EventArgs e)
		{
			string title = this.txtTitle.Text;
			string date = this.txtDate.Text;
		}
	}
}