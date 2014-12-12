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

namespace Client
{
    public partial class Form1 : Form
    {
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
        }

        private void button1_Click(object sender, EventArgs e)
        {
            chromeWebBrowser1.OpenUrl("http://localhost:8891/Login.aspx?UserID=" + comboBox1.SelectedValue);
        }
    }

}
