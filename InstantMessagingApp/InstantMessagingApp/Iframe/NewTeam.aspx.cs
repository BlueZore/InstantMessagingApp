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
    public partial class NewTeam : BasePager
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            IM_TeamInfo teamModel = new IM_TeamInfo();
            teamModel.TeamName = txtTeamName.Text;
            teamModel.UserID = userInfo.UserID;
            new IM_TeamBLL().Add(teamModel);
            txtTeamName.Text = string.Empty;
            lbError.Text = "完成添加";
        }
    }
}