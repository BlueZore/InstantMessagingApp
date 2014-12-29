using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using IM.BLL;
using IM.Model;
using Sashulin;
using Sashulin.Core;
using Sashulin.common;
using XSAT.Lib2014.System.Data;
using System.IO;
using System.Net;
using System.Web.UI.HtmlControls;

namespace Client
{
    public partial class Form1 : Form
    {
        BackgroundWorker bw;
        List<FileCtr> fileList;
        string webAddress = "http://kally32.w222.mc-test.com/";
        //string webAddress = "http://localhost:8891/";

        public Form1()
        {
            InitializeComponent();
            System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = false;

            QueryBuilder queryBuilder = new QueryBuilder();
            queryBuilder.AddOrderASC("UserName");
            comboBox1.DataSource = new IM_UserBLL().GetList(queryBuilder);
            comboBox1.DisplayMember = "UserName";
            comboBox1.ValueMember = "ID";
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            CSharpBrowserSettings settings = new CSharpBrowserSettings();
            //settings.DefaultUrl = System.IO.Directory.GetCurrentDirectory() + "\\cachedbTest.html";
            //settings.UserAgent = "Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19";
            settings.CachePath = @"C:\temp\caches";
            chromeWebBrowser1.Initialize(settings);

            bw = new BackgroundWorker();
            bw.DoWork += bw_DoWork;
            fileList = new List<FileCtr>();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            chromeWebBrowser1.OpenUrl(webAddress + "Load.aspx?UserID=" + comboBox1.SelectedValue);
        }

        public string ShowMessage(string data)
        {
            return "aaaa";
        }

        public string UploadFile(string data)
        {
            try
            {
                //初始化一个OpenFileDialog类
                OpenFileDialog fileDialog = new OpenFileDialog();
                fileDialog.Filter = "(*.xls;*.xlsx;*.rar;*.doc;*.docx;*.jpg;*.png;*.txt;)|*.xls;*.xlsx;*.rar*;*.doc;*.docx;*.jpg;*.png;*.txt;";
                //判断用户是否正确的选择了文件
                if (fileDialog.ShowDialog() == DialogResult.OK)
                {
                    //获取用户选择的文件，并判断文件大小不能超过20K，fileInfo.Length是以字节为单位的
                    FileInfo fileInfo = new FileInfo(fileDialog.FileName);
                    if (fileInfo.Length > 204800)
                    {
                        return "上传的图片不能大于200K";
                    }
                    else
                    {
                        //在这里就可以写获取到正确文件后的代码了
                        string[] arr = data.Split('|');
                        FileCtr item = new FileCtr();
                        item.ReceiveID = arr[0];
                        item.FileName = fileDialog.FileName;
                        item.UserName = arr[1];
                        item.UserID = arr[2];
                        item.TalkType = arr[3];
                        item.FileID = Guid.NewGuid().ToString();
                        fileList.Add(item);
                        if (!bw.IsBusy)
                        {
                            bw.RunWorkerAsync();
                        }
                    }
                }
                fileDialog.Dispose();
                return "";
            }
            catch
            {
                return "上传文件存在问题";
            }
        }

        private void bw_DoWork(object sender, DoWorkEventArgs e)
        {
            while (fileList.Count() > 0)
            {
                panel.Invoke(new Action(() => panel.Visible = true));
                FileCtr item = fileList[0];
                lbUpdateState.Invoke(new Action(() => lbUpdateState.Text = item.FileName + "[上传文件]"));
                WebClient webClient = new WebClient();

                byte[] RemoteByte = webClient.UploadFile(webAddress + "Common/ReceiveFile.aspx", "POST", item.FileName);//提交
                string html = Encoding.Default.GetString(RemoteByte, 0, RemoteByte.Length);

                lbUpdateState.Invoke(new Action(() => lbUpdateState.Text = item.FileName + "[同步数据]"));

                System.Collections.Specialized.NameValueCollection VarPost = new System.Collections.Specialized.NameValueCollection();//用于存放post数据

                byte[] arrByteFile = Encoding.UTF8.GetBytes(item.FileName);

                item.FileID = html.Substring(html.IndexOf("[guid='") + 7).Substring(0, html.Substring(html.IndexOf("[guid='") + 7).IndexOf("']"));

                VarPost.Add("FileName", item.FileName.Substring(item.FileName.LastIndexOf("\\") + 1));
                VarPost.Add("ReceiveID", item.ReceiveID);
                VarPost.Add("UserID", item.UserID);
                VarPost.Add("Type", item.TalkType);
                VarPost.Add("FileID", item.FileID);//截取FileID

                RemoteByte = webClient.UploadValues(webAddress + "Common/ReceiveFile.aspx", "POST", VarPost);//提交

                lbUpdateState.Invoke(new Action(() => lbUpdateState.Text = item.FileName + "[完成]"));
                fileList.RemoveAt(0);

                chromeWebBrowser1.ExecuteScript("addTalkRec('" + (item.ReceiveID + "|" + item.FileName.Substring(item.FileName.LastIndexOf("\\") + 1) + "|" + item.FileID + item.FileName.Substring(item.FileName.LastIndexOf(".")) + "|" + DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")) + "');");

                webClient.Dispose();

            }

            panel.Invoke(new Action(() => panel.Visible = false));
        }
    }


    public class FileCtr
    {
        public string ReceiveID { get; set; }
        public string UserName { get; set; }
        public string UserID { get; set; }
        public string FileName { get; set; }
        public string Download { get; set; }
        public string TalkType { get; set; }
        public string FileID { get; set; }
    }
}
