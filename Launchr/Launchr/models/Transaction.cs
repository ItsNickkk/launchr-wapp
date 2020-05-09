using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class Transaction
    {
        public int id { get; }
        public Tier tier { get; }
        public int amount { get; set; }
        public User user { get; }
        public Project project { get; }
        public DateTime datetime { get; }

        public Transaction(int id, Tier tier, int amount, User user, Project project, DateTime datetime)
        {
            this.id = id;
            this.tier = tier;
            this.amount = amount;
            this.user = user;
            this.project = project;
            this.datetime = datetime;

        }

        public Transaction(int id, int tier_id, int amount, int user_id, int project_id, DateTime datetime):this(id, getTierById(tier_id), amount, getUserById(user_id), getProjectById(project_id), datetime)
        {

        }
        public Transaction(int id, int amount, int user_id, int project_id, DateTime datetime)
        {
            this.id = id;
            this.amount = amount;
            this.user = getUserById(user_id);
            this.tier = null;
            this.project = getProjectById(project_id);
            this.datetime = datetime;
        }

        private static Tier getTierById(int tier_id)
        {
            return new SiteDB().getTierById(tier_id);
        }

        private static User getUserById(int user_id)
        {
            return new SiteDB().getUserById(user_id);
            
        }

        private static Project getProjectById(int project_id)
        {
            return new SiteDB().getProjectById(project_id);
            
        }


    }
}