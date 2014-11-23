using System;
namespace IM.Model
{
    /// <summary>
    /// 单聊记录
    /// </summary>
    [Serializable]
    public partial class IM_TalkInfo
    {
        public IM_TalkInfo()
        { }
        #region Model

        public static string IM_Talk_Table = "IM_Talk";
        public static string ID_Field = "ID";
        public static string SendUserID_Field = "SendUserID";
        public static string ReceiveUserID_Field = "ReceiveUserID";
        public static string Note_Field = "Note";
        public static string Type_Field = "Type";
        public static string State_Field = "State";
        public static string CreateDate_Field = "CreateDate";

        private Guid _id;
        private Guid _senduserid;
        private Guid _receiveuserid;
        private string _note;
        private int? _type;
        private int? _state;
        private DateTime? _createdate = DateTime.Now;

        /// <summary>
        /// 
        /// </summary>
        public Guid ID
        {
            set { _id = value; }
            get { return _id; }
        }

        /// <summary>
        /// 发送用户
        /// </summary>
        public Guid SendUserID
        {
            set { _senduserid = value; }
            get { return _senduserid; }
        }

        /// <summary>
        /// 接收用户
        /// </summary>
        public Guid ReceiveUserID
        {
            set { _receiveuserid = value; }
            get { return _receiveuserid; }
        }

        /// <summary>
        /// 内容
        /// </summary>
        public string Note
        {
            set { _note = value; }
            get { return _note; }
        }

        /// <summary>
        /// 0聊天，1文件
        /// </summary>
        public int? Type
        {
            set { _type = value; }
            get { return _type; }
        }

        /// <summary>
        /// 0未查看，1查看，2拒绝，3通过
        /// </summary>
        public int? State
        {
            set { _state = value; }
            get { return _state; }
        }

        /// <summary>
        /// 
        /// </summary>
        public DateTime? CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }

        #endregion Model

    }
}

