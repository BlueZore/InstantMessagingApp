using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using IM.BLL;
using IM.Model;
using XSAT.Lib2014.System.Data;
using Newtonsoft.Json;

namespace InstantMessagingApp
{
    /// <summary>
    /// Ajax 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Ajax : System.Web.Services.WebService
    {
        /// <summary>
        /// 获取提示信息
        /// {NewsList:[{"ID":1,"Name":"23"},{"ID":1,"Name":"23"}]}
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        [WebMethod]
        public string getUserAboutNews(string UserID)
        {
            QueryBuilder queryBuilder = new QueryBuilder();
            string json = "";

            //添加好友提示
            queryBuilder.AddFilter("ReceiveUserID", "=", UserID);
            queryBuilder.AddFilter("BusinessType", "=", "1");
            queryBuilder.AddFilter("State", "=", "0");
            queryBuilder.AddOrderASC("CreateDate");
            IM_NewsBLL newsBLL = new IM_NewsBLL();
            List<IM_NewsInfo> newsList = newsBLL.GetList(queryBuilder);
            string jsonItem = "";
            foreach (IM_NewsInfo newsModel in newsList)
            {
                newsBLL.UpdateForState(newsModel.ID, 1);
                jsonItem += ",{";
                jsonItem += "ID:'" + newsModel.ID + "'";
                jsonItem += ",SendUserID:'" + newsModel.SendUserID + "'";
                jsonItem += ",ReceiveUserID:'" + newsModel.ReceiveUserID + "'";
                jsonItem += ",Note:'" + newsModel.Note + "'";
                jsonItem += "}";
            }
            jsonItem = "NewsList:[" + (jsonItem.Length == 0 ? "" : jsonItem.Substring(1)) + "]";
            json = "[{" + jsonItem + "}]";

            return json;
        }
    }
}
