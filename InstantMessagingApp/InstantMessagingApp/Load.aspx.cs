using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstantMessagingApp
{
    public partial class Load : BasePager
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request["UserID"]))
                {
                    _FWCookieAdd(CookieName, Request["UserID"], 0, false);
                    Session[CookieName] = null;
                    Response.Redirect("~/Index.aspx");
                }
            }
        }

        protected override void OnInit(EventArgs e) { }
    }
}