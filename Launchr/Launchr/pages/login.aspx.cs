using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Launchr.pages
{
	public partial class WebForm2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		
		}
		protected void memberUsernameCustValidator_ServerValidate(object source, ServerValidateEventArgs args)
		{
			if (!string.IsNullOrEmpty(memberUsername.Text)){
				if (args.Value.Length < 9)
					args.IsValid = false;
				else
					args.IsValid = true;
			}
		}
		
	}
}