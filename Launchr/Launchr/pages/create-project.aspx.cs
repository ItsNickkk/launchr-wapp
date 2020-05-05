using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Launchr.models;
using System.IO;
using System.Text;

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
			string image_path_temp = "";

			if (this.Session["creator"] != null) // this.Session["creator"] != null
			{
				Creator creator = (Creator) this.Session["creator"];
				int creator_id = creator.id;
				int add_project_status = this.siteDB.addNewProject(creator_id, title, date_start, date_end, description, target, topic, content, image_path_temp);
				if (add_project_status == 1)
				{
					// get the last entry in the project table
					Project project = siteDB.getAllProjects().Last();

					// make a list out of all selected files
					List<HttpPostedFile> image_files = new List<HttpPostedFile>(this.filPhoto.PostedFiles);

					// make a list out of all selected file names
					List<string> image_file_names = new List<string>();
					
					foreach(HttpPostedFile file in image_files)
					{
						// make a FileInfo instance
						FileInfo fi = new FileInfo(file.FileName);
						// determine the file extension
						string file_ext = fi.Extension;
						// rename the file to "project_{project_id}_{file_index}.{extension}"
						string file_name = "project_" + project.id.ToString() + "_" + (image_files.IndexOf(file) + 1).ToString() + file_ext;
						// set the save location of the file
						string file_path = System.IO.Path.Combine(Server.MapPath("~/Content/documents/"), file_name);
						// add the file path into the list
						image_file_names.Add(file_path);
						// save the file
						file.SaveAs(file_path);
					}

					// edit the image_path_list attribute of the last project entered into database
					project.image_path_list = image_file_names;

					// update the project into the database
					int update_project_status = siteDB.updateProject(project);

					if (update_project_status == 1)
					{
						// add project successful, do something...
					}
					else
					{
						// project added but images are not uploaded...
					}
					
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