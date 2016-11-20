<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forumRegistration.aspx.cs" Inherits="Create_Forum_Project.forumRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/forum.css" rel="stylesheet" type="text/css" />    
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="divlogo">Forum</div>
    <div class="div_reg">
      <table class="table">
        <tr>
         <th colspan="2">Registration :</th>
        </tr>
        <tr>
        <td>
         Username
        </td>
        <td>
            <asp:TextBox ID="txtusername" CssClass="textbox" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtusername">Please Enter Username</asp:RequiredFieldValidator>
        </td>
        </tr>
          <tr>
        <td>
         Password 
        </td>
        <td>
            <asp:TextBox ID="txtpassword" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtpassword">Please Strong Password</asp:RequiredFieldValidator>
        </td>
        </tr>
          <tr>
        <td>
         Date-Of-Birth 
        </td>
        <td>
            <asp:TextBox ID="txtdob" CssClass="textbox" runat="server" 
                ToolTip="Please Enter Date-Of-Birth (DDMMYYYY) in these format"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtdob">Enter (DDMMYYYY) format</asp:RequiredFieldValidator>
        </td>
        </tr>
          <tr>
        <td>
         Email ID 
        </td>
        <td>
            <asp:TextBox ID="txtemailid" CssClass="textbox" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtemailid" ErrorMessage="(Invalid Email ID)" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">(Invalid Email ID)</asp:RegularExpressionValidator>
        </td>
        </tr>
          <tr>
        <td>
         Gender
        </td>
        <td>
            <asp:RadioButtonList ID="rbl_gender" runat="server" 
                RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="0">Male</asp:ListItem>
                <asp:ListItem Value="1">Female</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        </tr>
        <tr>
        <td colspan="2" align="center">
            <asp:Button ID="Btn_Registration" runat="server" Text="SignUp" 
                onclick="Btn_Registration_Click" />
            </td>
        </tr>
      </table>
    </div>
    </form>
</body>
</html>
