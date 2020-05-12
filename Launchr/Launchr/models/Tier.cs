using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class Tier
    {
        public int id { get; }
        public int value { get; }
        public string description { get; }
        public Project project { get; }
        public int max_amount { get; }
        public string title { get; }

        public Tier(int id, int value, string description, Project project, int max_amount, string title)
        {
            this.id = id;
            this.value = value;
            this.description = description;
            this.project = project;
            this.max_amount = max_amount;
            this.title = title;
        }

        public Tier(int id, int value, string description, int project_id, int max_amount, string title):this(id, value, description, getProjectById(project_id), max_amount, title)
        {

        }

        private static Project getProjectById(int project_id)
        {
            return new SiteDB().getProjectById(project_id);
        }

        public List<Transaction> getTransactions()
        {
            return new SiteDB().getTransactionByTierId(this.id);
        }

        public bool isReachTarget()
        {
            return max_amount - this.getTransactions().Count() <= 0;
        }

        public int calcProgress()
        {
            return (int)Math.Ceiling((double)this.getTransactions().Count() / this.max_amount * 100);
        }
    }
}