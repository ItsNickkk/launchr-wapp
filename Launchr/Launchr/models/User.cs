﻿using System;
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
        public User(int id, string name, string address, string phone_number, string email, string country, int status, int is_admin, string username, string password)
        {
            this.id = id;
            this.name = name;
            this.address = address;
            this.phone_number = phone_number;
            this.email = email;
            this.country = country;
            this.status = status;
            if (is_admin == 0)
            {
                this.is_admin = false;
            }
            else
            {
                this.is_admin = true;
            }
            this.username = username;
            this.password = password;
        }
    }
}