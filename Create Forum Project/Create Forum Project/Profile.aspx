<%@ Page Title="Your Profile - Forum" Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Create_Forum_Project.Profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style3 {
            width: 136px;
        }
        .auto-style4 {
            height: 47px;
        }
        .auto-style5 {
            border-collapse: collapse;
            border-style: none;
            border-color: inherit;
            border-width: 0;
            margin-top: 0.75em;
        }
        .auto-style6 {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            padding-left: 0em;
            padding-right: 2em;
            padding-top: 0.25em;
            padding-bottom: 0.25em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divlogo">Ask</div>
    <div class="div_header">
     Welcome : <label id="lblwelcom" runat="server"/>&nbsp;&nbsp;&nbsp;  <asp:Button ID ="btnProfile" runat="server" OnClick="btnProfile_Click" Text="Your Profile"  /> 
    </div>
    <div class="div_logout"><a href="forumLogin.aspx">Logout</a></div>
      <div id="div_dashboard_box" class="div_dashboard" runat="server" visible="false">
     <table>
      <tr>
       <th>Dashboard</th>
      </tr>
      <tr>
       <td><a href="Default.aspx">Home Page</a></td>
      </tr>
      <tr>
       <td><a href="Dashboard.aspx">Post Articles</a></td>
      </tr>
      <tr>
       <td><a href="Home.aspx">Your Articles</a></td>
      </tr>
     </table>
    </div>
    <div id="div_table">
        <table class="auto-style5" style="border-spacing: 0;">
            <tr>
                <td class="auto-style6">&nbsp;
                    <asp:Label ID="lblPic" runat="server" Text="Profile Picture"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Image ID="imgProfile" runat="server" Height="150" Width="150" />
                </td>
                <td class="auto-style6">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    &nbsp;
                    <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" placeholder="First Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" placeholder="Last Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="50" placeholder="Middle Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtContactNo" runat="server" MaxLength="15" placeholder="Contact Number" ToolTip="With country code"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtCollege" runat="server" MaxLength="50" placeholder="College"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtProfession" runat="server" MaxLength="50" placeholder="Profession"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtLocation" runat="server" MaxLength="50" placeholder="Location"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:TextBox ID="txtDescription" runat="server" Height="30px" MaxLength="500" placeholder="Description about you" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">&nbsp;
                    <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
