using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IM.BLL;
using IM.Model;
using XSAT.Lib2014.System.Data;

namespace InstantMessagingApp
{
    public partial class TalkRecDetail : BasePager
    {
        int iRecordCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["ReceiveUserID"]))
                {
                    hidReceiveUserID.Value = Request["ReceiveUserID"];
                    hidReceiveUserName.Value = new IM_UserBLL().GetModel(new Guid(hidReceiveUserID.Value)).UserName;
                    bind();
                }
            }
        }

        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            bind();
        }

        void bind()
        {
            QueryBuilder queryBuilder = new QueryBuilder();
            queryBuilder.Where = " where (SendUserID='" + userInfo.UserID + "' and ReceiveUserID='" + hidReceiveUserID.Value + "') or (ReceiveUserID='" + userInfo.UserID + "' and SendUserID='" + hidReceiveUserID.Value + "')";
            queryBuilder.AddOrderDESC(IM_TalkInfo.CreateDate_Field);
            queryBuilder.PageIndex = Pager.CurrentPageIndex;
            rp.DataSource = new IM_TalkBLL().GetListByPage(queryBuilder, ref iRecordCount);
            rp.DataBind();
            Pager.RecordCount = iRecordCount;
        }
    }
}