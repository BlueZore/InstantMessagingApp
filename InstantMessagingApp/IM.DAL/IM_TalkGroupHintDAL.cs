﻿using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using XSAT.Lib2014.System.Data;//Please add references
using IM.Model;

namespace IM.DAL
{
    /// <summary>
    /// 数据访问类:IM_TalkGroupHintDAL
    /// </summary>
    public partial class IM_TalkGroupHintDAL
    {
        public IM_TalkGroupHintDAL()
        { }
        #region  BasicMethod

        /// <summary>
        /// 增加一条数据
        /// <param name="model">实体</param>
        /// </summary>
        public bool Add(IM_TalkGroupHintInfo model)
        {
            StringBuilder strSql = new StringBuilder();
            int n = 0;
            strSql.Append("insert into IM_TalkGroupHint(");
            strSql.Append("ID,GroupID,TalkGroupID,UserID,State)");
            strSql.Append(" values (");
            strSql.Append("@ID,@GroupID,@TalkGroupID,@UserID,@State)");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@GroupID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@TalkGroupID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@State", SqlDbType.Int,4)};
            parameters[n++].Value = model.ID;
            parameters[n++].Value = model.GroupID;
            parameters[n++].Value = model.TalkGroupID;
            parameters[n++].Value = model.UserID;
            parameters[n++].Value = model.State;

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
        public bool Update(IM_TalkGroupHintInfo model)
        {
            StringBuilder strSql = new StringBuilder();
            int n = 0;
            strSql.Append("update IM_TalkGroupHint set ");
            strSql.Append("GroupID=@GroupID,");
            strSql.Append("TalkGroupID=@TalkGroupID,");
            strSql.Append("UserID=@UserID,");
            strSql.Append("State=@State");
            strSql.Append(" where ID=@ID ");
            SqlParameter[] parameters = {
					new SqlParameter("@GroupID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@TalkGroupID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@UserID", SqlDbType.UniqueIdentifier,16),
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16)};
            parameters[n++].Value = model.GroupID;
            parameters[n++].Value = model.TalkGroupID;
            parameters[n++].Value = model.UserID;
            parameters[n++].Value = model.State;
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
            strSql.Append("update IM_TalkGroupHint set IsDelete=1 ");
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
        public IM_TalkGroupHintInfo GetModel(Guid ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ID,GroupID,TalkGroupID,UserID,State from IM_TalkGroupHint ");
            strSql.Append(" where ID=@ID ");
            SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.UniqueIdentifier,16)			};
            parameters[0].Value = ID;

            IM_TalkGroupHintInfo model = new IM_TalkGroupHintInfo();
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
        public IM_TalkGroupHintInfo DataRowToModel(DataRow row)
        {
            IM_TalkGroupHintInfo model = new IM_TalkGroupHintInfo();
            if (row != null)
            {
                if (row["ID"] != null && row["ID"].ToString() != "")
                {
                    model.ID = new Guid(row["ID"].ToString());
                }
                if (row["GroupID"] != null && row["GroupID"].ToString() != "")
                {
                    model.GroupID = new Guid(row["GroupID"].ToString());
                }
                if (row["TalkGroupID"] != null && row["TalkGroupID"].ToString() != "")
                {
                    model.TalkGroupID = new Guid(row["TalkGroupID"].ToString());
                }
                if (row["UserID"] != null && row["UserID"].ToString() != "")
                {
                    model.UserID = new Guid(row["UserID"].ToString());
                }
                if (row["State"] != null && row["State"].ToString() != "")
                {
                    model.State = int.Parse(row["State"].ToString());
                }
            }
            return model;
        }


        /// <summary>
        /// 获得前几行数据
        /// <param name="QueryBuilder"></param>
        /// </summary>
        public List<IM_TalkGroupHintInfo> GetList(QueryBuilder queryBuilder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (queryBuilder.Top > 0)
            {
                strSql.Append(" top " + queryBuilder.Top);
            }
            strSql.Append(" ID,GroupID,TalkGroupID,UserID,State ");
            strSql.Append(" FROM IM_TalkGroupHint ");
            strSql.Append(queryBuilder.Where);
            strSql.Append(queryBuilder.Order);
            DataSet ds = DbHelperSQL.Query(strSql.ToString());
            List<IM_TalkGroupHintInfo> list = new List<IM_TalkGroupHintInfo>();
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
            sbSql.Append("SELECT * FROM IM_TalkGroupHint" + queryBuilder.Where);
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
            DataSet ds = DbHelperSQL.RunProcedure("ExecutePaging", para, "IM_TalkGroupHint");
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
        /// 修改状态
        /// <param name="ID">实体</param>
        /// <param name="State">实体</param>
        /// </summary>
        public bool UpdateForState(Guid talkGroupID, Guid userID, int state)
        {
            StringBuilder strSql = new StringBuilder();
            int n = 0;
            strSql.Append("update IM_TalkGroupHint set ");
            strSql.Append("State=@State");
            strSql.Append(" where TalkGroupID=@TalkGroupID and UserID=@UserID");
            SqlParameter[] parameters = {
					new SqlParameter("@State", SqlDbType.Int,4),
					new SqlParameter("@TalkGroupID", SqlDbType.UniqueIdentifier,16),
                    new SqlParameter("@UserID", SqlDbType.UniqueIdentifier,16)};
            parameters[n++].Value = state;
            parameters[n++].Value = talkGroupID;
            parameters[n++].Value = userID;

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
        #endregion  ExtensionMethod
    }
}

