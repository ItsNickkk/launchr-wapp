using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class Creator
    {
        public int id {get;}
        public string name {get;set;}
        public string address {get;set;}
        public string phone_number {get;set;}
        public string email {get;set;}
        public string country {get;set;}
        public int status {get;set;}
        public string document {get;set;}
        public string type {get;set;}
        public string username { get; set; }
        public string password { get; set; }
        public Creator(int id, string name, string address, string phone_number, string email, string country, int status, string document, string type, string username, string password)
        {
            this.id = id;
            this.name = name;
            this.address = address;
            this.phone_number = phone_number;
            this.email = email;
            this.country = country;
            this.status = status;
            this.document = document;
            this.type = type;
            this.username = username;
            this.password = password;

        }

        public int update()
        {
            return new SiteDB().updateCreator(this);
        }
    }
}