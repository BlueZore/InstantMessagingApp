﻿namespace Client
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.chromeWebBrowser1 = new Sashulin.ChromeWebBrowser();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.lbUpdateState = new System.Windows.Forms.Label();
            this.panel = new System.Windows.Forms.Panel();
            this.panel.SuspendLayout();
            this.SuspendLayout();
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(13, 4);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 20);
            this.comboBox1.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(140, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "登录";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // chromeWebBrowser1
            // 
            this.chromeWebBrowser1.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.chromeWebBrowser1.Location = new System.Drawing.Point(2, 33);
            this.chromeWebBrowser1.Name = "chromeWebBrowser1";
            this.chromeWebBrowser1.Size = new System.Drawing.Size(612, 427);
            this.chromeWebBrowser1.TabIndex = 2;
            this.chromeWebBrowser1.Load += new System.EventHandler(this.Form1_Load);
            // 
            // openFileDialog
            // 
            this.openFileDialog.FileName = "openFileDialog";
            // 
            // lbUpdateState
            // 
            this.lbUpdateState.AutoSize = true;
            this.lbUpdateState.BackColor = System.Drawing.Color.Transparent;
            this.lbUpdateState.ForeColor = System.Drawing.Color.White;
            this.lbUpdateState.Location = new System.Drawing.Point(4, 4);
            this.lbUpdateState.Name = "lbUpdateState";
            this.lbUpdateState.Size = new System.Drawing.Size(53, 12);
            this.lbUpdateState.TabIndex = 3;
            this.lbUpdateState.Text = "上传状态";
            // 
            // panel
            // 
            this.panel.Controls.Add(this.lbUpdateState);
            this.panel.Location = new System.Drawing.Point(2, 439);
            this.panel.Name = "panel";
            this.panel.Size = new System.Drawing.Size(612, 20);
            this.panel.TabIndex = 4;
            this.panel.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(614, 460);
            this.Controls.Add(this.panel);
            this.Controls.Add(this.chromeWebBrowser1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.comboBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.panel.ResumeLayout(false);
            this.panel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button button1;
        private Sashulin.ChromeWebBrowser chromeWebBrowser1;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.Label lbUpdateState;
        private System.Windows.Forms.Panel panel;
    }
}

