using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Launchr.models
{
    public class Creator
    {
        private string id {get;}
        private string name {get;set;}
        private string address {get;set;}
        private string phone_number {get;set;}
        private string email {get;set;}
        private string country {get;set;}
        private int status {get;set;}
        private string document {get;set;}
        private string type {get;set;}
        private string username { get; set; }
        private string password { get; set; }
        public Creator(string id, string name, string address, string phone_number, string email, string country, int status, string document, string type, string username, string password)
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
    }
}