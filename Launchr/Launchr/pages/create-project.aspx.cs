using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;

namespace Launchr.pages
{
	public partial class WebForm6 : System.Web.UI.Page
	{
		private SiteDB siteDB;
		protected void Page_Load(object sender, EventArgs e)
		{
			siteDB = new SiteDB();
		}

		protected void btnCreateProject_Click(object sender, EventArgs e)
		{
			string title = this.txtTitle.Text;
			DateTime date_start = DateTime.Now;
			string date = this.txtDate.Text;
			DateTime date_end = DateTime.ParseExact(date, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
			string topic = this.cobTopic.SelectedValue;
			string content = this.txtContent.Text;
			string description = this.txtDescription.Text;
			int target = int.Parse(this.txtTarget.Text);
			string image_path = "";
			if (this.Session["creator"] != null)
			{
				Creator creator = (Creator) this.Session["creator"];
				int creator_id = creator.id;
				int add_project_status = this.siteDB.AddNewProject(creator_id, title, date_start, date_end, description, target, topic, content, image_path);
				if (add_project_status == 1)
				{
					// add project successful, do something...
				} else
				{
					if (add_project_status == 0)
					{
						// failed to add project, do something here...
					}
				}
				
			}
		}

	}
}