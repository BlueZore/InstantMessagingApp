using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using IM.BLL;
using IM.Model;

namespace InstantMessagingApp
{
    /// <summary>
    /// UploadHandler 的摘要说明
    /// </summary>
    [System.Web.Services.WebService(Namespace = "http://tempuri.org/")]
    [System.Web.Services.WebServiceBinding(ConformsTo = System.Web.Services.WsiProfiles.BasicProfile1_1)]
    public class UploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        string FileID = "";

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";

            HttpPostedFile file = context.Request.Files["Filedata"];
            string uploadPath = context.Server.MapPath("~/UpLoadFiles/Files/");
            string ReceiveID = context.Request["ReceiveID"].Replace("'", "");
            string UserID = context.Request["UserID"].Replace("'", "");
            string FileName = "";

            if (file != null)
            {
                FileID = Guid.NewGuid().ToString();
                string FileType = file.FileName.Substring(file.FileName.LastIndexOf('.') + 1).ToLower();
                FileName = file.FileName.Substring(0, file.FileName.LastIndexOf('.'));
                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }
                uploadPath += FileID + "." + FileType;
                file.SaveAs(uploadPath);
                FileName += "." + FileType;

                IM_FileInfo fileModel = new IM_FileInfo();
                fileModel.ID = Guid.NewGuid();
                fileModel.FileName = FileName;
                fileModel.FilePath = uploadPath;
                fileModel.UserID = new Guid(UserID);
                fileModel.ReceiveID = new Guid(ReceiveID);
                fileModel.Type = 1;
                fileModel.CreateDate = DateTime.Now;
                new IM_FileBLL().Add(fileModel);

            }
            context.Response.Write(FileName + "|" + uploadPath);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


    }
}