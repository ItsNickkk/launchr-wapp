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
        private projectTableAdapter projectAdapter;
        private tierTableAdapter tierAdapter;
        private transactionTableAdapter transactionAdapter;
        private commentTableAdapter commentAdapter;

        public SiteDB()
        {
            userAdapter = new userTableAdapter();
            creatorAdapter = new creatorTableAdapter();
            projectAdapter = new projectTableAdapter();
            tierAdapter = new tierTableAdapter();
            transactionAdapter = new transactionTableAdapter();
            commentAdapter = new commentTableAdapter();
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

        public List<User> getAllUsers()
        {
            return this.translateUserTableToList(this.userAdapter.GetAllUsers());
        }


        /*public List<User> getUserById(int id)
        {
            return this.translateUserTableToList(this.userAdapter.GetUserById(id));
        }*/

        public User getUserById(int id)
        {
            List<User> user_list = this.translateUserTableToList(this.userAdapter.GetUserById(id));
            if(user_list.Count() == 1)
            {
                return user_list[0];
            } else
            {
                return null;
            }
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

        public List<User> getUnbannedUsers()
        {
            return this.translateUserTableToList(this.userAdapter.GetUserUnban());
        }

        public int updateUser(User user)
        {

            try
            {
                List<Creator> creator_list_same_email = this.translateCreatorTableToList(creatorAdapter.GetCreatorByEmail(user.email));
                List<User> user_list_same_email = this.translateUserTableToList(userAdapter.GetUserByEmail(user.email));
                if (creator_list_same_email.Count() > 0 | user_list_same_email.Count() > 1)
                {
                    return 2; // 2 is returned if same email
                }
                else
                {
                    List<Creator> creator_list_same_username = this.translateCreatorTableToList(creatorAdapter.GetCreatorByUsername(user.username));
                    List<User> user_list_same_username = this.translateUserTableToList(userAdapter.GetUserByUsername(user.username));
                    if (creator_list_same_username.Count() > 0 | user_list_same_username.Count() > 1)
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

        public List<Creator> getUnbannedCreators()
        {
            return this.translateCreatorTableToList(this.creatorAdapter.GetCreatorUnban());
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

        public List<Creator> getAllCreators()
        {
            return this.translateCreatorTableToList(creatorAdapter.GetAllCreators());
        }

        public int deleteCreator(Creator creator)
        {
            try
            {
                this.creatorAdapter.DeleteCreator(creator.id);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }

        public int countProjectGoalReached()
        {
            List<Project> project_goal_reached = new List<Project>();
            foreach(Project project in this.getAllProjects())
            {
                if (project.reachedGoal())
                {
                    project_goal_reached.Add(project);
                }
            }
            return project_goal_reached.Count();
        }

        public int countProjectActive()
        {
            List<Project> project_goal_reached = new List<Project>();
            foreach (Project project in this.getAllProjects())
            {
                if (project.isAlive())
                {
                    project_goal_reached.Add(project);
                }
            }
            return project_goal_reached.Count();
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
                        
                        creatorAdapter.AddCreator(name, address, phone_number, email, country, 2, document, type, username, password);
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

        public List<Creator> getWaitingCreator()
        {
            return this.translateCreatorTableToList(creatorAdapter.GetWaitingCreator());
        }

        // <--------------------------- Project functions --------------------------->


        private Project translateRowToProject(launchr_DataSet.projectRow project_row) {
            Project project = new Project(project_row.id, project_row.creator_id, project_row.title, project_row.time_created, project_row.time_end, project_row.description, project_row.status, project_row.target, project_row.topic, project_row.content, project_row.imagePath);
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

        public Project getProjectById(int id)
        {
            List<Project> project_list = this.translateProjectTableToList(projectAdapter.GetProjectById(id));
            if(project_list.Count() == 1)
            {
                return project_list[0];
            } else
            {
                return null;
            }
        }

        public List<Project> getProjectAlive()
        {
            List<Project> all_projects = this.getAllProjects();
            foreach(Project project in all_projects)
            {
                if(DateTime.Now > project.time_end)
                {
                    all_projects.Remove(project);
                }
            }
            return all_projects;
        }


        public int addNewProject(int creator_id, string title, DateTime time_created, DateTime time_end, string description, int status, int target, string topic, string content, string imagePath)
        {
            try
            {
                projectAdapter.AddNewProject(creator_id, title, time_created, time_end, description, status, target, topic, content, imagePath);
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
                projectAdapter.UpdateProject(project.creator.id, project.title, project.time_created, project.time_end, project.description, project.status, project.target, project.topic, project.content, project.parseStringFromImagePath(), project.id);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }

        public List<Project> getProjectByCreatorId(int creator_id)
        {
            return this.translateProjectTableToList(this.projectAdapter.GetProjectByCreatorId(creator_id));
        }

        public List<Project> findProjectByTitle(string query)
        {
            return this.translateProjectTableToList(projectAdapter.GetProjectBySimilarTitle("%" + query + "%"));
        }

        public List<Project> findProjectByTopic(string query)
        {
            return this.translateProjectTableToList(projectAdapter.GetProjectByTopic(query));
        }

        // <--------------------------- Tier functions --------------------------->

        private Tier translateRowToTier(launchr_DataSet.tierRow tier_row)
        {
            Tier tier = new Tier(tier_row.id, tier_row.value, tier_row.description, tier_row.project_id, tier_row.max_amount, tier_row.title);
            return tier;
        }

        private List<Tier> translateTierTableToList(launchr_DataSet.tierDataTable tier_data_table)
        {
            List<Tier> tier_list = new List<Tier>();
            foreach (launchr_DataSet.tierRow tier_row in tier_data_table)
            {
                tier_list.Add(this.translateRowToTier(tier_row));
            }
            return tier_list;
        }

        public int addNewTier(int value, string description, int project_id, int max_amount, string title)
        {
            try
            {
                tierAdapter.AddNewTier(value, description, project_id, max_amount, title);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }

        public Tier getTierById(int id)
        {
            List<Tier> tier_list = this.translateTierTableToList(this.tierAdapter.GetTierById(id));
            if(tier_list.Count == 1)
            {
                return tier_list[0];
            } else
            {
                return null;
            }
        }

        public List<Tier> getTierByProjectId(int project_id)
        {
            List<Tier> tier_list = this.translateTierTableToList(this.tierAdapter.GetTierByProjectId(project_id));
            return tier_list;
        }

        public int countTierNumber(int tier_id)
        {
            return (int) this.transactionAdapter.CountTierNumber(tier_id);
        }

        // <--------------------------- Transaction functions --------------------------->



        private Transaction translateRowToTransaction(launchr_DataSet.transactionRow transaction_row)
        {
            Transaction transaction;
            try
            {
                transaction = new Transaction(transaction_row.id, transaction_row.tier_id, transaction_row.amount, transaction_row.user_id, transaction_row.project_id, transaction_row.datetime);
            } catch(System.Data.StrongTypingException e)
            {
                transaction = new Transaction(transaction_row.id, transaction_row.amount, transaction_row.user_id, transaction_row.project_id, transaction_row.datetime);
            }
            
            return transaction;
        }

        private List<Transaction> translateTransactionTableToList(launchr_DataSet.transactionDataTable transaction_data_table)
        {
            List<Transaction> transaction_list = new List<Transaction>();
            foreach(launchr_DataSet.transactionRow transaction_row in transaction_data_table)
            {
                transaction_list.Add(this.translateRowToTransaction(transaction_row));
            }
            return transaction_list;
        }

        public List<Transaction> getTransactionByProjectId(int id)
        {
            return this.translateTransactionTableToList(this.transactionAdapter.GetTransactionByProjectId(id));
        }

        public int getTransactionTotalAmountByProjectId(int id)
        {
            int total = 0;
            foreach(Transaction transaction in this.getTransactionByProjectId(id))
            {
                total = total + transaction.amount;
            }
            return total;
        }

        public int countUniqueBackersByProjectId(int id)
        {
            return (int) this.transactionAdapter.CountUniqueBackersByProjectId(id);
        }

        public List<Transaction> getUniqueTransactionByUserId(int user_id)
        {
            Launchr.launchr_DataSet.transactionDataTable transaction_table = transactionAdapter.GetUniqueTransactionByUserId(user_id);
            return this.translateTransactionTableToList(transaction_table);
        }

        public List<Transaction> getTransactionByUserId(int user_id)
        {
            return this.translateTransactionTableToList(this.transactionAdapter.GetTransactionByUserId(user_id));
        }

        public int addTransactionWithTier(int tier_id, int amount, int user_id, int project_id)
        {
            try
            {
                this.transactionAdapter.AddTransactionWithTier(tier_id, amount, user_id, project_id, DateTime.Now);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }

        public List<Transaction> getTransactionWithProjectIdAndUserId(int project_id, int user_id)
        {
            return this.translateTransactionTableToList(this.transactionAdapter.GetTransactionByProjectIdAndUserId(project_id, user_id));
        }

        public int addTransactionWithoutTier(int amount, int user_id, int project_id)
        {
            try
            {
                this.transactionAdapter.AddTransactionWithoutTier(amount, user_id, project_id, DateTime.Now);
                return 1;
            } catch(Exception e)
            {
                return 0;
            }
        }


        // <--------------------------- Comment functions --------------------------->

        private Comment translateRowToComment(launchr_DataSet.commentRow comment_row)
        {
            try
            {
                Comment comment = new Comment(comment_row.id, comment_row.author_id, comment_row.project_id, comment_row.parent_id, comment_row.content, comment_row.status);
                return comment;
            } catch(System.Data.StrongTypingException e)
            {
                Comment comment = new Comment(comment_row.id, comment_row.author_id, comment_row.project_id, comment_row.content, comment_row.status);
                return comment;
            }
            
        }

        private List<Comment> translateCommentTableToList(launchr_DataSet.commentDataTable comment_table)
        {
            List<Comment> comment_list = new List<Comment>();
            foreach(launchr_DataSet.commentRow comment_row in comment_table)
            {
                comment_list.Add(this.translateRowToComment(comment_row));
            }
            return comment_list;
        }

        public List<Comment> getCommentByProjectId(int project_id)
        {
            List<Comment> comment_list = this.translateCommentTableToList(commentAdapter.GetCommentByProjectId(project_id));

            return comment_list;
        }

        public Comment getCommentById(int comment_id)
        {
            List<Comment> comment_list = this.translateCommentTableToList(commentAdapter.GetCommentById(comment_id));
            if(comment_list.Count() == 1)
            {
                return comment_list[0];
            } else
            {
                return null;
            }
        }

        public int addNewComment(int author_id, int project_id, string content, DateTime datetime, int status)
        {
            try
            {
                commentAdapter.AddNewComment(author_id, project_id, content, datetime, status);
                return 1;
            } catch (Exception e)
            {
                return 0;
            }
        }

        public int addNewReply(int author_id, int project_id, int parent_id, string content, DateTime datetime, int status)
        {
            try
            {
                commentAdapter.AddNewReply(author_id, project_id, parent_id, content, datetime, status);
                return 1;
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        public List<Comment> getCommentByAuthorId(int author_id)
        {
            return this.translateCommentTableToList(this.commentAdapter.GetCommentByAuthorId(author_id));
        }



    }
}