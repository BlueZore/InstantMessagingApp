using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IM.BLL;
using XSAT.Lib2014.System.Data;

namespace InstantMessagingApp
{
    public partial class GroupMemberView : BasePager
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gv.DataSource = new IM_GroupMemberBLL().GetListForMenber(userInfo.UserID, new Guid(Request["GroupID"]));
                gv.DataBind();
            }
        }
    }
}