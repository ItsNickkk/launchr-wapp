using System;
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

        public launchr_DataSet.userDataTable getAllUsers()
        {
            launchr_DataSet.userDataTable users_table = userAdapter.GetAllUsers();
            return users_table;
        }

        public int addNewUser(User user)
        {
            return 1;
        }
    }
}