using Launchr.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Launchr.pages
{
	public partial class summary_admin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Title = "Admin Panel | Launch:r";
			this.makePage();
		}
		private void makePage()
		{
			SiteDB siteDB = new SiteDB();
			this.plcUser.Controls.Add(new Literal
			{
				Text = siteDB.getUnbannedUsers().Count.ToString()
			});
			this.plcCreator.Controls.Add(new Literal
			{
				Text = siteDB.getUnbannedCreators().Count.ToString()
			});
			this.plcCreatorApproval.Controls.Add(new Literal
			{
				Text = siteDB.getWaitingCreator().Count.ToString()
			});
			this.plcGoalReached.Controls.Add(new Literal
			{
				Text = siteDB.countProjectGoalReached().ToString()
			});
			this.plcProjectTotal.Controls.Add(new Literal
			{
				Text = siteDB.getAllProjects().Count().ToString()
			});
			this.plcProjectRunning.Controls.Add(new Literal
			{
				Text = siteDB.countProjectActive().ToString()
			});
		}
	}
}