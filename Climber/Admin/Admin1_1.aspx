<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin1_1.aspx.cs" Inherits="Climber.Admin1_11" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>
    <title>信息管理系统</title>
    <style type="text/css">
        #Table1
        {
            width: 929px;
        }
        .style1
        {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            background-color:#CCFFCC;
            
        }
        #Reset
        {
            width: 57px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div >
        <table id="Table1" runat="server" align="center">
          <tr>
            <td>图片</td>
          </tr>
          <tr>
            <td align="center">           
                <table class="style1">
                    <tr>
                        <td width="216px" height="30px">
                         新闻标题</td>
                         <td align="left">
                             <asp:TextBox ID="Ttitle" runat="server" BackColor="#CCFFCC" BorderWidth="0px" 
                                 Height="22px" Width="428px" Font-Bold="True" Font-Size="Medium"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                     runat="server" ErrorMessage="*不能为空" ForeColor="Red" 
                                 ControlToValidate="Ttitle" Font-Size="Small"></asp:RequiredFieldValidator>
                             </td>
                    </tr>
                    <tr>
                        <td width="216px" height="30px" >
                        栏目名称</td>
                        <td align="left">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="新闻资讯" Text="新闻资讯"></asp:ListItem>
                                <asp:ListItem Value="活动公告" Text="活动公告"> </asp:ListItem>
                            </asp:RadioButtonList>
                     
                        </td>
                    </tr>
                    <tr>
                        <td width="216px" height="30px" >
                            新闻内容</td>
                        <td align="left">
                            <FTB:FreeTextBox id="FreeTextBox1" runat="server" Width="690px" Height="400px" 
                                ButtonPath="\images\ftb\office2003\" Language="zh-CN" 
                                supportfolder="~/News/Images/"                    
                                ImageGalleryPath = "Admin/Images/upload"   
                                ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print,InsertImageFromGallery" 
                                onload="FreeTextBox1_Load"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td width="216px" height="30px" >
                            图片描述</td>
                        <td align="left">
                            
                            <asp:TextBox ID="TPath" runat="server" BackColor="#CCFFCC" BorderWidth="0px" 
                                 Height="22px" Width="664px" Font-Size="Medium"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td width="216px" height="30px" >
                            存储路径</td>
                        <td align="left">
                            <asp:FileUpload ID="FUL1" runat="server" />（上传文件格式要求为word）<font color="red">&nbsp;（备份作用）</font></td>
                    </tr>
                    <tr>
                        <td width="216px" height="30px" >
                            新闻作者</td>
                        <td>
                            <asp:TextBox ID="Tauthor" runat="server" BackColor="#CCFFCC" BorderWidth="0px" 
                                 Height="22px" Width="674px" Font-Size="Medium"></asp:TextBox>
                        </td>
                    </tr>
                </table>           
            </td> 
          </tr> 
          <tr align="right">
            <td align="right">
              &nbsp;
              <asp:Button ID="save" runat="server" Text="保存" Width="57px" Height="27px" 
                     onclick="save_Click" />
                &nbsp;&nbsp;
              <asp:Button ID="back" runat="server" Text="返回" Width="57px" Height="27px" 
                    onclick="back_Click" CausesValidation="False" 
                      />
                &nbsp;
              </td>                           
          </tr> 
        </table>
    </div>
    </form>
</body>
</html>
