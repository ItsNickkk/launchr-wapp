﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Launchr.launchr_DataSetTableAdapters;

namespace Launchr.models
{
    public class SiteDB
    {
        private userTableAdapter userAdapter;

        public SiteDB()
        {
            userAdapter = new userTableAdapter();
        }

        private User translate_row_to_user(launchr_DataSet.userRow user_row)
        {
            User user = new User(int.Parse(user_row.id), user_row.name, user_row.address, user_row.phone_number, user_row.email, user_row.country, user_row.status, user_row.is_admin, user_row.username, user_row.password);
            return user;
        }

        private List<User> translate_user_table_to_list(launchr_DataSet.userDataTable userDataTable)
        {
            List<User> user_list = new List<User>();
            foreach(launchr_DataSet.userRow user_row in userDataTable)
            {
                user_list.Add(translate_row_to_user(user_row));
            }
            return user_list;
        }

        public List<User> getAllUsers()
        {
            launchr_DataSet.userDataTable users_table = userAdapter.GetAllUsers();
            return translate_user_table_to_list(users_table);
        }

        public int addNewUser(User user)
        {
            return 1;
        }

        public List<User> getUserByUsernameAndPassword(string username, string password)
        {
            List<User> user_list = translate_user_table_to_list(userAdapter.GetUserByUsernamePassword(username, password));
            return user_list;
        }
    }
}