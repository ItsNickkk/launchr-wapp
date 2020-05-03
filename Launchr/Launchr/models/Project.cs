using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class Project
    {
        public int id;
        public Creator creator;
        public string title;
        public DateTime time_created;
        public DateTime time_end;
        public string description;
        public int target;
        public string topic;
        public string content;
        public List<string> image_path;
        public Project(int id, Creator creator, string title, DateTime time_created, DateTime time_end, string description, int target, string topic, string content, List<string> image_path)
        {
            this.id = id;
            this.creator = creator;
            this.title = title;
            this.time_created = time_created;
            this.time_end = time_end;
            this.description = description;
            this.target = target;
            this.topic = topic;
            this.content = content;
            this.image_path = image_path;

        }

        private List<string> parseImagePathList(string image_path_string)
        {
            string[] image_path_array = image_path_string.Split(';');
            List<string> image_path_list = new List<string>(image_path_array);
            return image_path_list;
        }

        private Creator getCreatorById(int creator_id)
        {
            SiteDB siteDB = new SiteDB();
            Creator creator = siteDB.getCreatorById(creator_id);
            return creator;
        }
    }
}