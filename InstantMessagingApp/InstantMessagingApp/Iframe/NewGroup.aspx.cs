using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IM.BLL;
using IM.Model;

namespace InstantMessagingApp
{
    public partial class NewGroup : BasePager
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            IM_GroupInfo groupModel = new IM_GroupInfo();
            groupModel.GroupName = txtGroupName.Text;
            groupModel.UserID = userInfo.UserID;
            new IM_GroupBLL().Add(groupModel);
            txtGroupName.Text = string.Empty;
            lbError.Text = "完成添加";
        }
    }
}