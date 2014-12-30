using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IM.BLL;
using IM.Model;
using XSAT.Lib2014.System.Data;

namespace InstantMessagingApp
{
    public partial class ReceiveFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Flush();
            try
            {
                string FileID;
                if (string.IsNullOrEmpty(Request["FileID"]))
                {
                    string uploadPath = Server.MapPath("~/UpLoadFiles/Files/");
                    HttpPostedFile file = Request.Files[0];
                    FileID = Guid.NewGuid().ToString();
                    file.SaveAs(uploadPath + FileID + file.FileName.Substring(file.FileName.LastIndexOf('.')));
                    Response.Write(" Resule->OK[guid='" + FileID + "']");
                }
                else
                {

                    string ReceiveID = Request["ReceiveID"].Replace("'", "");
                    string UserID = Request["UserID"].Replace("'", "");
                    string Type = Request["Type"].Replace("'", "");
                    FileID = Request["FileID"].Replace("'", "");
                    string FileName = Request["FileName"].Replace("'", "");


                    IM_FileInfo fileModel = new IM_FileInfo();
                    fileModel.ID = Guid.NewGuid();
                    fileModel.FileName = FileName;
                    fileModel.FilePath = "/UpLoadFiles/Files/" + FileID + FileName.Substring(FileName.LastIndexOf('.'));
                    fileModel.UserID = new Guid(UserID);
                    fileModel.ReceiveID = new Guid(ReceiveID);
                    fileModel.Type = 1;
                    fileModel.CreateDate = DateTime.Now;
                    new IM_FileBLL().Add(fileModel);

                    string Note = "<a href=\"" + fileModel.FilePath + "\" target=\"_blank\">" + fileModel.FileName + "</a>";
                    switch (Type)
                    {
                        case "1":
                            IM_TalkInfo talkModel = new IM_TalkInfo();
                            talkModel.SendUserID = fileModel.UserID;
                            talkModel.ReceiveUserID = fileModel.ReceiveID;
                            talkModel.Note = Note;
                            talkModel.Type = 1;
                            talkModel.State = 0;
                            new IM_TalkBLL().Add(talkModel);
                            break;
                        case "2":
                            IM_TalkGroupInfo talkGroupModel = new IM_TalkGroupInfo();
                            talkGroupModel.ID = Guid.NewGuid();
                            talkGroupModel.SendUserID = fileModel.UserID;
                            talkGroupModel.GroupID = fileModel.ReceiveID;
                            talkGroupModel.Note = Note;
                            talkGroupModel.Type = 1;
                            new IM_TalkGroupBLL().Add(talkGroupModel);

                            QueryBuilder queryBuilder = new QueryBuilder();
                            queryBuilder.AddFilter(IM_GroupMemberInfo.GroupID_Field, "=", fileModel.ReceiveID.ToString());
                            List<IM_GroupMemberInfo> groupMemberList = new IM_GroupMemberBLL().GetList(queryBuilder);
                            IM_TalkGroupHintBLL talkGroupHintBLL = new IM_TalkGroupHintBLL();
                            foreach (IM_GroupMemberInfo tmpModel in groupMemberList)
                            {
                                IM_TalkGroupHintInfo talkGroupHintModel = new IM_TalkGroupHintInfo();
                                talkGroupHintModel.ID = Guid.NewGuid();
                                talkGroupHintModel.TalkGroupID = talkGroupModel.ID;
                                talkGroupHintModel.GroupID = talkGroupModel.GroupID;
                                talkGroupHintModel.UserID = tmpModel.UserID;
                                talkGroupHintModel.State = 0;
                                talkGroupHintBLL.Add(talkGroupHintModel);
                            }
                            break;
                    }
                    Response.Write(" Resule->OK");
                }
            }
            catch
            {
                Response.Write(" Resule->ERROR");
            }
        }
    }
}