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
        public int status;
        public int target;
        public string topic;
        public string content;
        public List<string> image_path_list;
        public Project(int id, Creator creator, string title, DateTime time_created, DateTime time_end, string description, int status, int target, string topic, string content, List<string> image_path)
        {
            this.id = id;
            this.creator = creator;
            this.title = title;
            this.time_created = time_created;
            this.time_end = time_end;
            this.description = description;
            this.target = target;
            this.status = status;
            this.topic = topic;
            this.content = content;
            this.image_path_list = image_path;

        }

        public Project(int id, int creator_id, string title, DateTime time_created, DateTime time_end, string description, int status, int target, string topic, string content, string image_path_str):this(id, parseCreatorId(creator_id), title, time_created, time_end, description, status, target, topic, content, parseImagePathFromString(image_path_str))
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

        public int getTransactionTotal()
        {
            return new SiteDB().getTransactionTotalAmountByProjectId(this.id);
        }

        public int countBackers()
        {
            return new SiteDB().countUniqueBackersByProjectId(this.id);
        }

        public List<Comment> getComments()
        {
            List<Comment> comment_list = new SiteDB().getCommentByProjectId(this.id);
            return comment_list;
        }

        public int getTierNumber(Tier tier)
        {
            if (tier.project.id == this.id)
            {
                return new SiteDB().countTierNumber(tier.id);
            } else
            {
                return 0;
            }
        }

        public List<Tier> getTiers()
        {
            return new SiteDB().getTierByProjectId(this.id);
        }

        public int addComment(int author_id, string content)
        {
            int add_comment_status = new SiteDB().addNewComment(author_id, this.id, content, DateTime.Now, 1);
            return add_comment_status;
        }

        public int calcProgress()
        {
            return (int)Math.Ceiling((double)this.getTransactionTotal() / this.target * 100);
        }

        public int calcRemainingTime()
        {
            return (int)(this.time_end - DateTime.Now).TotalDays;
        }

        public bool reachedGoal()
        {
            return this.getTransactionTotal() >= this.target;
        }

        public bool isAlive()
        {
            return DateTime.Now < this.time_end;
        }

        public int addTransaction(Tier tier, int user_id)
        {
            return new SiteDB().addTransactionWithTier(tier.id, tier.value, user_id, this.id);
        }

        public int addTransactionWithoutTier(int amount, int user_id)
        {
            return new SiteDB().addTransactionWithoutTier(amount, user_id, this.id);
        }

        public List<Transaction> getTransactions()
        {
            return new SiteDB().getTransactionByProjectId(this.id);
        }

        public List<Transaction> getTransactionsByUserId(int user_id)
        {
            return new SiteDB().getTransactionWithProjectIdAndUserId(this.id, user_id);
        }

        public int countNoTierTransaction()
        {
            return new SiteDB().countTransactionNoTierByProjectId(this.id);
        }

        public int update()
        {
            return new SiteDB().updateProject(this);
        }
    }
}