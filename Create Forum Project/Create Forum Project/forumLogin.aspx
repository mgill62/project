<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forumLogin.aspx.cs" Inherits="Create_Forum_Project.forumLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/logincss.css" rel="stylesheet" type="text/css" />
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="divlogo">Forum</div>
    <div class="div_login">
     <table class="table">
     <tr>
      <th colspan="2"> Login </th>
     </tr>
     <tr>
     <td> Username </td>
     <td> 
         <asp:TextBox ID="txtusername" CssClass="textbox" runat="server"></asp:TextBox></td>
     </tr>
     <tr>
      <td> Password </td>
      <td><asp:TextBox ID="txtpassword" CssClass="textbox" runat="server" 
              TextMode="Password"></asp:TextBox></td>
     </tr>
     <tr>
     <td colspan="2" align="center">
         <asp:Button ID="Btn_Login" runat="server" Text="Login" 
             onclick="Btn_Login_Click" />
     </td>
     </tr>
     </table>
     <div style="width:auto;">
     <p>Create new Account : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forumRegistration.aspx"><b>Sign up</b></a></p>
    </div>
    </div>
    
    </form>
</body>
</html>
