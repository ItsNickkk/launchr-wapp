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
        private creatorTableAdapter creatorAdapter;

        public SiteDB()
        {
            userAdapter = new userTableAdapter();
            creatorAdapter = new creatorTableAdapter();
        }
        // <------------------ User functions ------------------>
        private User translateRowToUser(launchr_DataSet.userRow user_row)
        {
            User user = new User(int.Parse(user_row.id), user_row.name, user_row.address, user_row.phone_number, user_row.email, user_row.country, user_row.status, user_row.is_admin, user_row.username, user_row.password, 1);
            return user;
        }

        private List<User> translateUserTableToList(launchr_DataSet.userDataTable user_data_table)
        {
            List<User> user_list = new List<User>();
            foreach(launchr_DataSet.userRow user_row in user_data_table)
            {
                user_list.Add(this.translateRowToUser(user_row));
            }
            return user_list;
        }


        public int addNewUser(string name, string address, string phone_number, string email, string country, string username, string password)
        {
            try
            {
                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(email));
                if (user_list_same_email.Count() > 0)
                {
                    return 2; // 2 is returned if same email
                } else
                {
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(username));
                    if (user_list_same_username.Count() > 0)
                    {
                        return 3; // 3 is returned if same username
                    }
                    else
                    {
                        userAdapter.AddUser(name, address, phone_number, email, country, 1, 0, username, password);
                        return 1; // 1 is returned if no errors, no same email, or same username
                    }
                }
            } catch (Exception e)
            {
                return 0; // 0 is returned if sql error
            }
        }

        public int updateUser(User user)
        {
            try
            {

                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(user.email));
                if (user_list_same_email.Count() > 0)
                {
                    return 2; // 2 is returned if same email
                }
                else
                {
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(user.username));
                    if (user_list_same_username.Count() > 0)
                    {
                        return 3; // 3 is returned if same username
                    }
                    else
                    {
                        userAdapter.UpdateUser(user.name, user.address, user.phone_number, user.email, user.country, user.status, user.is_admin_int(), user.username, user.password, user.id);
                        return 1; // 1 is returned if no errors, no same email, or same username
                    }
                }
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        public List<User> getUserByUsernameAndPassword(string username, string password)
        {
            List<User> user_list = translateUserTableToList(userAdapter.GetUserByUsernamePassword(username, password));
            return user_list;
        }

        // <------------------ creator functions ------------------>

        private Creator translateRowToCreator(launchr_DataSet.creatorRow creator_row)
        {
            Creator creator = new Creator(creator_row.id, creator_row.name, creator_row.address, creator_row.phone_number, creator_row.email, creator_row.country, creator_row.status, creator_row.document, creator_row.type, creator_row.username, creator_row.password);
            return creator;
        }

        private List<Creator> translateCreatorTableToList(launchr_DataSet.creatorDataTable creator_data_table)
        {
            List<Creator> creator_list = new List<Creator>();
            foreach(launchr_DataSet.creatorRow creator_row in creator_data_table)
            {
                creator_list.Add(this.translateRowToCreator(creator_row));
            }
            return creator_list;
        }

        public Creator getCreatorById(int creator_id)
        {
            List<Creator> creator_list = translateCreatorTableToList(creatorAdapter.GetCreatorById(creator_id));
            if (creator_list.Count() == 1)
            {
                return creator_list[0];
            } else
            {
                return null;
            }
        }
    }
}