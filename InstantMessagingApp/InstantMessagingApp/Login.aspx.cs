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
    public partial class Login : BasePager
    {
        string Sys_UserID = "38790CE0-8524-4450-9C04-7DA5BD521435";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUser.DataTextField = "UserName";
                ddlUser.DataValueField = "ID";
                QueryBuilder queryBuilder = new QueryBuilder();
                queryBuilder.AddOrderASC("UserName");
                ddlUser.DataSource = new IM_UserBLL().GetList(queryBuilder);
                ddlUser.DataBind();
            }
        }

        protected override void OnInit(EventArgs e) { }

        protected void bntLine_Click(object sender, EventArgs e)
        {
            _FWCookieAdd(CookieName, ddlUser.SelectedValue, 0, false);
            Response.Redirect("~/Index.aspx");
        }
    }
}