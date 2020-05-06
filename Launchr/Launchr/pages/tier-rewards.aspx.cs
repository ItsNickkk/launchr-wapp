using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using Launchr.models;

namespace Launchr.pages
{
	public partial class WebForm7 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request.QueryString["id"] != null)
				{
					try
					{
						int project_id = int.Parse(Request.QueryString["id"]);
						List<Project> project_list = new SiteDB().getProjectById(project_id);
						if (project_list.Count() != 0)
						{
							Project project = (Project)project_list[0];
						}
						else
						{
							// project does not exist, do something here!
						}
					}
					catch (Exception ex)
					{
						// id invalid (not convertible to int), do something here!
					}
				} else
				{
					Response.Redirect("tier-rewards.aspx?id=300001");
				}


				
			}
		}

		[WebMethod]
		public static int saveTiers(object tiers)
		{
			int return_id = 1;
			Dictionary<string, object> tier_dict = (Dictionary<string, object>)tiers;
			foreach (KeyValuePair<string, object> kvp in tier_dict)
			{
				// what does every tier have?
				// cast value of kvp
				Dictionary<string, object> subValues = (Dictionary<string, object>)kvp.Value;
				string title = (string)subValues["title"];
				int value = int.Parse((string)subValues["value"]);
				string description = (string)subValues["description"];
				int max_amount = int.Parse((string)subValues["max_amount"]);
				int project_id = int.Parse((string)subValues["project_id"]);
				int add_tier_status = new SiteDB().addNewTier(value, description, project_id, max_amount, title);
				if (add_tier_status != 1)
				{
					return_id = 0;
				}
			}
			return return_id;
		}
	}

	
}