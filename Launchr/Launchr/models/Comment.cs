using System;
using System.Collections.Generic;
using System.Linq;

namespace Launchr.models
{
    public class Comment
    {
        public int id { get; }
        public User user { get; }
        public Creator creator { get; }
        public Project project { get; }
        public Comment parent_comment { get; }
        public string content { get; }
        public int status { get; set; }

        public Comment(int id, User user, Creator creator, Project project, Comment parent_comment, string content, int status)
        {
            this.id = id;
            this.user = user;
            this.creator = creator;
            this.project = project;
            this.parent_comment = parent_comment;
            this.content = content;
            this.status = status;
        }     

        public Comment(int id, int author_id, int project_id, int comment_id, string content, int status)
        {
            this.id = id;
            if(getUserById(author_id) != null)
            {
                this.user = getUserById(author_id);
                this.creator = null;
            } else if (getCreatorById(author_id) != null)
            {
                this.user = null;
                this.creator = getCreatorById(author_id);
            }
            this.project = getProjectById(project_id);
            this.parent_comment = getCommentById(comment_id);
            this.content = content;
            this.status = status;
        }

        public Comment(int id, int author_id, int project_id, string content, int status):this(id, author_id, project_id, 600000, content, status)
        {
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

        private static Creator getCreatorById(int creator_id)
        {
            return new SiteDB().getCreatorById(creator_id);
        }



        public int addReply(int author_id, string content)
        {
            return new SiteDB().addNewReply(author_id, this.project.id, this.id, content, DateTime.Now, 1);
        }

    }
}