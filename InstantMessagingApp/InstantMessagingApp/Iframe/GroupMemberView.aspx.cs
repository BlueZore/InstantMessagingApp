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
    public partial class GroupMemberView : BasePager
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hidAdmin.Value = new IM_GroupBLL().GetModel(new Guid(Request["GroupID"])).UserID.ToString();
                Bind();
            }
        }

        void Bind()
        {
            gv.DataSource = new IM_GroupMemberBLL().GetListForMenber(userInfo.UserID, new Guid(Request["GroupID"]));
            gv.DataBind();
        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            new IM_GroupMemberBLL().Delete(new Guid(e.CommandArgument.ToString()), new Guid(Request["GroupID"]));
            IM_GroupInfo groupModel = new IM_GroupBLL().GetModel(new Guid(Request["GroupID"]));
            //对方通过信息添加群
            IM_NewsInfo newModel = new IM_NewsInfo();
            newModel.SendUserID = groupModel.ID;
            newModel.ReceiveUserID = new Guid(e.CommandArgument.ToString());
            newModel.BusinessType = 7;
            newModel.BusinessID = "";
            newModel.Note = "从\"" + groupModel.GroupName + "\"群剔除";
            newModel.State = 0;
            new IM_NewsBLL().Add(newModel);
            lbError.Text = "删除成功";
            Bind();
        }
    }
}