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
        private creatorTableAdapter creatorAdapter;
        private projectTableAdapter projectAdapter;

        public SiteDB()
        {
            userAdapter = new userTableAdapter();
            creatorAdapter = new creatorTableAdapter();
            projectAdapter = new projectTableAdapter();
        }
        // <------------------ User functions ------------------>
        private User translateRowToUser(launchr_DataSet.userRow user_row)
        {
            User user = new User(user_row.id, user_row.name, user_row.address, user_row.phone_number, user_row.email, user_row.country, user_row.status, user_row.is_admin, user_row.username, user_row.password, 1);
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
                List<Creator> creator_list_same_email = this.translateCreatorTableToList(creatorAdapter.GetCreatorByEmail(email));
                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(email));
                if (creator_list_same_email.Count() > 0 | user_list_same_email.Count() > 0)
                {
                    return 2; // 2 is returned if same email
                }
                else
                {
                    List<Creator> creator_list_same_username = this.translateCreatorTableToList(creatorAdapter.GetCreatorByUsername(username));
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(username));
                    if (creator_list_same_username.Count() > 0 | user_list_same_username.Count() > 0)
                    {
                        return 3; // 3 is returned if same username
                    }
                    else
                    {

                        userAdapter.AddNewUser(name, address, phone_number, email, country, 1, 0, username, password);
                        return 1; // 1 is returned if no errors, no same email, or same username

                    }
                }
            }
            catch (Exception e)
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
            List<User> user_list = this.translateUserTableToList(this.userAdapter.GetUserByUsernamePassword(username, password));
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

        public int addNewCreator(string name, string address, string phone_number, string email, string country, string document, string type, string username, string password)
        {
            try
            {
                List<Creator> creator_list_same_email = this.translateCreatorTableToList(creatorAdapter.GetCreatorByEmail(email));
                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(email));
                if (creator_list_same_email.Count() > 0 | user_list_same_email.Count() > 0)
                {
                    return 2; // 2 is returned if same email
                }
                else
                {
                    List<Creator> creator_list_same_username = this.translateCreatorTableToList(creatorAdapter.GetCreatorByUsername(username));
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(username));
                    if (creator_list_same_username.Count() > 0 | user_list_same_username.Count() > 0)
                    {
                        return 3; // 3 is returned if same username
                    }
                    else
                    {
                        
                        creatorAdapter.AddCreator(name, address, phone_number, email, country, 1, document, type, username, password);
                        return 1; // 1 is returned if no errors, no same email, or same username
                            
                    }
                }
            }
            catch (Exception e)
            {
                return 0; // 0 is returned if sql error
            }
        }

        public List<Creator> getCreatorByUsernameAndPassword(string username, string password)
        {
            List<Creator> creator_list = translateCreatorTableToList(creatorAdapter.GetCreatorByUsernamePassword(username, password));
            return creator_list;
        }

        public int updateCreator(Creator creator)
        {
            try
            {
                List<Creator> creator_list_same_email = this.translateCreatorTableToList(creatorAdapter.GetCreatorByEmail(creator.email));
                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(creator.email));
                if (creator_list_same_email.Count() > 1 | user_list_same_email.Count() > 0)
                {
                    return 2; // 2 is returned if same email
                }
                else
                {
                    List<Creator> creator_list_same_username = this.translateCreatorTableToList(creatorAdapter.GetCreatorByUsername(creator.username));
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(creator.username));
                    if (creator_list_same_username.Count() > 1 | user_list_same_username.Count() > 0)
                    {
                        return 3; // 3 is returned if same username
                    }
                    else
                    {

                        this.creatorAdapter.UpdateCreator(creator.name, creator.address, creator.phone_number, creator.email, creator.country, creator.status, creator.document, creator.type, creator.username, creator.password, creator.id);
                        return 1; // 1 is returned if no errors, no same email, or same username

                    }
                }
            }
            catch (Exception e)
            {
                return 0; // 0 is returned if sql error
            }
            
            
        }

        // <--------------------------- Project functions --------------------------->


        private Project translateRowToProject(launchr_DataSet.projectRow project_row) {
            Project project = new Project(project_row.id, project_row.creator_id, project_row.title, project_row.time_created, project_row.time_end, project_row.description, project_row.target, project_row.topic, project_row.content, project_row.imagePath);
            return project;
        }

        private List<Project> translateProjectTableToList(launchr_DataSet.projectDataTable project_data_table)
        {
            List<Project> project_list = new List<Project>(); 
            foreach (launchr_DataSet.projectRow project_row in project_data_table)
            {
                project_list.Add(this.translateRowToProject(project_row));
            }
            return project_list;
        }

        public List<Project> getAllProjects()
        {
            return this.translateProjectTableToList(projectAdapter.GetAllProjects());
        }

        public List<Project> getProjectById(int id)
        {
            List<Project> project_list = this.translateProjectTableToList(projectAdapter.GetProjectById(id));
            return project_list;
        }

        public int addNewProject(int creator_id, string title, DateTime time_created, DateTime time_end, string description, int target, string topic, string content, string imagePath)
        {
            try
            {
                projectAdapter.AddNewProject(creator_id, title, time_created, time_end, description, target, topic, content, imagePath);
                return 1; // INSERT successful
            } catch (Exception e)
            {
                return 0; // INSERT failed
            }
        }

        public int updateProject(Project project)
        {
            try
            {
                projectAdapter.UpdateProject(project.creator.id, project.title, project.time_created, project.time_end, project.description, project.target, project.topic, project.content, project.parseStringFromImagePath(), project.id);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }
    }
}