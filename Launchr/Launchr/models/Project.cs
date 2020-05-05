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
        public List<string> image_path_list;
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
            this.image_path_list = image_path;

        }

        public Project(int id, int creator_id, string title, DateTime time_created, DateTime time_end, string description, int target, string topic, string content, string image_path_str):this(id, parseCreatorId(creator_id), title, time_created, time_end, description, target, topic, content, parseImagePathFromString(image_path_str))
        {

        }


        private static List<string> parseImagePathFromString(string connected_image_path)
        {
            return new List<string>(connected_image_path.Split(';'));
        }

        public string parseStringFromImagePath()
        {
            return string.Join(";", this.image_path_list.ToArray());
        }

        private static Creator parseCreatorId(int creator_id)
        {
            Creator creator = new SiteDB().getCreatorById(creator_id);
            return creator;
        }
    }
}