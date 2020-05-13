using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class User
    {
        public int id { get; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone_number { get; set; }
        public string email { get; set; }
        public string country { get; set; }
        public int status { get; set; }
        public bool is_admin { get; set; }
        public string username { get; set; }
        public string password { get; set; }

        public User(int id, string name, string address, string phone_number, string email, string country, int status, bool is_admin, string username, string password)
        {
            this.id = id;
            this.name = name;
            this.address = address;
            this.phone_number = phone_number;
            this.email = email;
            this.country = country;
            this.status = status;
            this.is_admin = is_admin;
            this.username = username;
            this.password = password;
        }
        public User(int id, string name, string address, string phone_number, string email, string country, int status, int is_admin_int, string username, string password, int mode):
            this(id, name, address, phone_number, email, country, status, User.is_admin_bool(is_admin_int), username, password)
        {
            // constructor overloading
        }

        public int is_admin_int()
        {
            if (this.is_admin == true)
            {
                return 1;
            } 
            else
            {
                return 0;
            }
        }
        private static bool is_admin_bool(int is_admin_int)
        {
            if (is_admin_int == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public int update()
        {
            return new SiteDB().updateUser(this);
        }

        public List<Project> getBacked()
        {
            List<Project> project_list = new List<Project>();
            foreach(Transaction transaction in new SiteDB().getTransactionByUserId(this.id))
            {
                project_list.Add(transaction.project);
            }
            return project_list;
        }

        public List<Comment> getComments()
        {
            return new SiteDB().getCommentByAuthorId(this.id);
        }

        public List<Transaction> getTransactions()
        {
            return new SiteDB().getTransactionByUserId(this.id);
        }

    }
}