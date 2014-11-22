﻿using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using XSAT.Lib2014.System.Data;
using IM.Model;

namespace IM.DAL
{
    /// <summary>
    /// 数据访问类:IM_UserDAL
    /// </summary>
    public partial class IM_UserDAL
    {
        public IM_UserDAL()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// <param name="model">实体</param>
        /// </summary>
        public bool Add(IM_UserInfo model)
        {
            StringBuilder strSql = new StringBuilder();
            int n = 0;
            strSql.Append("insert into IM_User(");
            strSql.Append("ID,Sys_UserID,UserName,Pic,LoginDate,LastDate,IsDelete)");
            strSql.Append(" values (");
            strSql.Append("@ID,@Sys_UserID,@UserName,@Pic,@LoginDate,@LastDate,@IsDelete)");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@Sys_UserID", SqlDbType.VarChar,50),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@Pic", SqlDbType.VarChar,50),
					new SqlParameter("@LoginDate", SqlDbType.DateTime),
					new SqlParameter("@LastDate", SqlDbType.DateTime),
					new SqlParameter("@IsDelete", SqlDbType.Int,4)};
            parameters[n++].Value = model.ID;
            parameters[n++].Value = model.Sys_UserID;
            parameters[n++].Value = model.UserName;
            parameters[n++].Value = model.Pic;
            parameters[n++].Value = model.LoginDate;
            parameters[n++].Value = model.LastDate;
            parameters[n++].Value = model.IsDelete;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 更新一条数据
        /// <param name="model">实体</param>
        /// </summary>
        public bool Update(IM_UserInfo model)
        {
            StringBuilder strSql = new StringBuilder();
            int n = 0;
            strSql.Append("update IM_User set ");
            strSql.Append("Sys_UserID=@Sys_UserID,");
            strSql.Append("UserName=@UserName,");
            strSql.Append("Pic=@Pic,");
            strSql.Append("LoginDate=@LoginDate,");
            strSql.Append("LastDate=@LastDate,");
            strSql.Append("IsDelete=@IsDelete");
            strSql.Append(" where ID=@ID ");
            SqlParameter[] parameters = {
					new SqlParameter("@Sys_UserID", SqlDbType.VarChar,50),
					new SqlParameter("@UserName", SqlDbType.NVarChar,50),
					new SqlParameter("@Pic", SqlDbType.VarChar,50),
					new SqlParameter("@LoginDate", SqlDbType.DateTime),
					new SqlParameter("@LastDate", SqlDbType.DateTime),
					new SqlParameter("@IsDelete", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16)};
            parameters[n++].Value = model.Sys_UserID;
            parameters[n++].Value = model.UserName;
            parameters[n++].Value = model.Pic;
            parameters[n++].Value = model.LoginDate;
            parameters[n++].Value = model.LastDate;
            parameters[n++].Value = model.IsDelete;
            parameters[n++].Value = model.ID;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// <param name="ID">ID</param>
        /// </summary>
        public bool Delete(Guid ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("update IM_User set IsDelete=1 ");
            strSql.Append(" where ID=@ID ");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16)			};
            parameters[0].Value = ID;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// <param name="ID">ID</param>
        /// </summary>
        public IM_UserInfo GetModel(Guid ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ID,Sys_UserID,UserName,Pic,LoginDate,LastDate,IsDelete from IM_User ");
            strSql.Append(" where ID=@ID ");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16)			};
            parameters[0].Value = ID;

            IM_UserInfo model = new IM_UserInfo();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// <param name="ID">ID</param>
        /// </summary>
        public IM_UserInfo GetModel(string Sys_UserID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ID,Sys_UserID,UserName,Pic,LoginDate,LastDate,IsDelete from IM_User ");
            strSql.Append(" where Sys_UserID=@Sys_UserID ");
            SqlParameter[] parameters = {
					new SqlParameter("@Sys_UserID", SqlDbType.VarChar,50)			};
            parameters[0].Value = Sys_UserID;

            IM_UserInfo model = new IM_UserInfo();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public IM_UserInfo DataRowToModel(DataRow row)
        {
            IM_UserInfo model = new IM_UserInfo();
            if (row != null)
            {
                if (row["ID"] != null && row["ID"].ToString() != "")
                {
                    model.ID = new Guid(row["ID"].ToString());
                }
                if (row["Sys_UserID"] != null)
                {
                    model.Sys_UserID = row["Sys_UserID"].ToString();
                }
                if (row["UserName"] != null)
                {
                    model.UserName = row["UserName"].ToString();
                }
                if (row["Pic"] != null)
                {
                    model.Pic = row["Pic"].ToString();
                }
                if (row["LoginDate"] != null && row["LoginDate"].ToString() != "")
                {
                    model.LoginDate = DateTime.Parse(row["LoginDate"].ToString());
                }
                if (row["LastDate"] != null && row["LastDate"].ToString() != "")
                {
                    model.LastDate = DateTime.Parse(row["LastDate"].ToString());
                }
                if (row["IsDelete"] != null && row["IsDelete"].ToString() != "")
                {
                    model.IsDelete = int.Parse(row["IsDelete"].ToString());
                }
            }
            return model;
        }


        /// <summary>
        /// 获得前几行数据
        /// <param name="QueryBuilder"></param>
        /// </summary>
        public List<IM_UserInfo> GetList(QueryBuilder queryBuilder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (queryBuilder.Top > 0)
            {
                strSql.Append(" top " + queryBuilder.Top);
            }
            strSql.Append(" ID,Sys_UserID,UserName,Pic,LoginDate,LastDate,IsDelete ");
            strSql.Append(" FROM IM_User ");
            strSql.Append(queryBuilder.Where);
            strSql.Append(queryBuilder.Order);
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            List<IM_UserInfo> list = new List<IM_UserInfo>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(DataRowToModel(dr));
            }
            return list;
        }

        /// <summary>
        /// 分页获取数据列表
        /// <param name="queryBuilder"></param>
        /// <param name="iRecordCount"></param>
        /// </summary>
        public DataTable GetListByPage(QueryBuilder queryBuilder, ref int iRecordCount)
        {
            StringBuilder sbSql = new StringBuilder();
            sbSql.Append("SELECT * FROM IM_User" + queryBuilder.Where);
            IDataParameter[] para = new IDataParameter[] 
			{
				new SqlParameter("@PageIndex",SqlDbType.Int),
				new SqlParameter("@PageSize",SqlDbType.Int),
				new SqlParameter("@strSql",SqlDbType.VarChar),
				new SqlParameter("@Field",SqlDbType.VarChar),
				new SqlParameter("@OrderField",SqlDbType.VarChar)
			};
            para[0].Value = queryBuilder.PageIndex;
            para[1].Value = queryBuilder.PageSize;
            para[2].Value = sbSql.ToString();
            para[3].Value = queryBuilder.OrderField;
            para[4].Value = queryBuilder.OrderType;
            DataSet ds = DbHelperSQL.RunProcedure("ExecutePaging", para, "IM_User");
            try
            {
                iRecordCount = Convert.ToInt32(ds.Tables[1].Rows[0][0]);
                return ds.Tables[0];
            }
            catch
            {
                return null;
            }
        }

        #endregion  BasicMethod
        #region  ExtensionMethod

        /// <summary>
        /// 获取未添加用户
        /// <param name="QueryBuilder"></param>
        /// </summary>
        public List<IM_UserInfo> GetNoAddUserList(Guid ID, string UserName)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(@"
select * from [dbo].[IM_User] where ID not in (
select [IM_TeamMember].UserID from [dbo].[IM_Team]
inner join [dbo].[IM_TeamMember]
on [IM_Team].ID=[IM_TeamMember].[TeamID] where [IM_Team].UserID=@ID)
and ID<>@ID and UserName like '%" + UserName + @"%' order by UserName
");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier)			};
            parameters[0].Value = ID;
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            List<IM_UserInfo> list = new List<IM_UserInfo>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                list.Add(DataRowToModel(dr));
            }
            return list;
        }
        #endregion  ExtensionMethod
    }
}

