<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupMemberView.aspx.cs" Inherits="InstantMessagingApp.GroupMemberView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            font-size: 12px;
            font-family: 'Microsoft YaHei';
        }

        .div_row {
            margin-left: 5px;
            margin-top: 4px;
        }

        #lbError {
            color: #ff0000;
        }

        .div_gv {
            margin-top: 2px;
            margin-left: 5px;
            margin-right: 5px;
        }

        #gv a {
            text-decoration: none;
            color: #0094ff;
        }

            #gv a:hover {
                color: #00ffff;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="div_gv">
            <asp:GridView ID="gv" runat="server" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="25px" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="22px" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="成员" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>


