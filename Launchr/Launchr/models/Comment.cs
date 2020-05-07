using System;
using System.Collections.Generic;
using System.Linq;

namespace Launchr.models
{
    public class Comment
    {
        public int id { get; }
        public User user { get; }
        public Project project { get; }
        public Comment parent_comment { get; }
        public string content { get; }
        public int status { get; set; }

        public Comment(int id, User user, Project project, Comment parent_comment, string content, int status)
        {
            this.id = id;
            this.user = user;
            this.project = project;
            this.parent_comment = parent_comment;
            this.content = content;
            this.status = status;
        }

        public Comment(int id, int user_id, int project_id, int comment_id, string content, int status) : this(id, getUserById(user_id), getProjectById(project_id), getCommentById(comment_id), content, status)
        {
            // the get functions may return null functions
        }

        public Comment(int id, int user_id, int project_id, string content, int status)
        {
            this.id = id;
            this.user = getUserById(user_id);
            this.project = getProjectById(project_id);
            this.parent_comment = null;
            this.content = content;
            this.status = status;
        }


        private static User getUserById(int user_id)
        {
            return new SiteDB().getUserById(user_id);
        }

        private static Project getProjectById(int project_id)
        {
            return new SiteDB().getProjectById(project_id);
        }

        private static Comment getCommentById(int comment_id)
        {
            List<Comment> comment_list = new SiteDB().getCommentById(comment_id);
            if (comment_list.Count() == 1)
            {
                return comment_list[0];
            }
            else
            {
                return null;
            }
        }



        public int addReply(User user, string content)
        {
            return new SiteDB().addNewReply(this.user.id, this.project.id, this.id, content, DateTime.Now, 1);
        }

    }
}