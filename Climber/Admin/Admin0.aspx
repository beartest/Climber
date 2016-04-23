<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin0.aspx.cs" Inherits="Climber.Admin0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>十四峰信息管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Your name" />
    <script type="text/javascript">
        function submitbutton() {
            var old = document.getElementById("old").value;
            var new1 = document.getElementById("new1").value;
            var new2 = document.getElementById("new2").value;
            var check = document.getElementById("check").checked;
            var name = document.getElementById("name").value;
            if (old == '') {
                alert('请输入原密码');
            }
            else if (new1 == '') {
                alert('请输入新密码');
            }
            else if (new2 == '') {
                alert('请输入重复密码');
            }
            else if (check == true && name == "") {
                alert('请输入昵称');
            }
            else if (new1 != new2) {
                alert('新密码与重复密码不一致');
            }
            else if (check == true) {
                document.getElementById("form").action = "Admin0.aspx?s=withname";
                document.getElementById("form").submit();
            }
            else if (check == false) {
                document.getElementById("form").action = "Admin0.aspx?s=withoutname";
                document.getElementById("form").submit();
            }
        }
    </script>
    <link rel="stylesheet" type="text/css" href="demo.css" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <link href='http://fonts.googleapis.com/css?family=Electrolize' rel='stylesheet'
        type='text/css' />
</head>
<body>
    <div class="codrops-top">
        <a href="../Page1.aspx"><strong>&laquo; 返回主页 </strong></a><span class="right"><a href="../Page3_2.aspx">
            <asp:Label ID="Label1" runat="server" Text="您好，欢迎登录"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>重新登录</strong> </a></span>
        <div class="clr">
        </div>
    </div>
    <div id="个人信息" class="content">
        <h2>
            个人信息</h2>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table align="center">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <p style="font-weight: bold">
                            姓名：</p>
                        <p>
                            <%#Eval("姓名")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            学号：</p>
                        <p>
                            <%#Eval("学号")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            性别：</p>
                        <p>
                            <%#Eval("性别")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            联系电话：</p>
                        <p>
                            <%#Eval("联系电话")%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="font-weight: bold">
                            出生日期：</p>
                        <p>
                            <%#Convert.ToDateTime(Eval("出生日期")).ToString("yyyy/mm/dd")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            籍贯：</p>
                        <p>
                            <%#Eval("籍贯")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            所在院系：</p>
                        <p>
                            <%#Eval("所在院系")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            入学年份：</p>
                        <p>
                            <%#Eval("入学年份")%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p style="font-weight: bold">
                            学历：</p>
                        <p>
                            <%#Eval("学历")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            所属文职部门：</p>
                        <p>
                            <%#Eval("部门名称")%></p>
                    </td>
                    <td>
                        <p style="font-weight: bold">
                            职位：</p>
                        <p>
                            <%#Eval("职位")%></p>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <div id="部门信息" class="panel">
        <div class="content">
            <h2>
                部门信息</h2>
            <table align="center">
                <tr>
                    <td style="background-color: #000000">
                        <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                            部门名称</p>
                    </td>
                    <asp:Repeater ID="Repeater2_1" runat="server">
                        <ItemTemplate>
                            <td>
                                <p>
                                    <%#Eval("部门名称")%></p>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
                <tr>
                    <td style="background-color: #000000">
                        <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                            部长</p>
                    </td>
                    <asp:Repeater ID="Repeater2_2" runat="server">
                        <ItemTemplate>
                            <td>
                                <p>
                                    <%#Eval("部长")%></p>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
                <tr>
                    <td style="background-color: #000000">
                        <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                            副部长</p>
                    </td>
                    <asp:Repeater ID="Repeater2_3" runat="server">
                        <ItemTemplate>
                            <td>
                                <p>
                                    <%#Eval("副部长")%></p>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
        </div>
    </div>
    <div id="活动信息" class="panel">
        <div class="content">
            <h2>
                活动信息</h2>
            <asp:Repeater ID="Repeater3" runat="server">
                <HeaderTemplate>
                    <table align="center">
                        <tr>
                            <td style="background-color: #000000">
                                <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                                    活动名称</p>
                            </td>
                            <td style="background-color: #000000">
                                <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                                    主办部门</p>
                            </td>
                            <td style="background-color: #000000">
                                <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                                    活动类型</p>
                            </td>
                            <td style="background-color: #000000">
                                <p style="background-color: #000000; color: #FFFFFF; font-weight: bold">
                                    备注</p>
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <p>
                                <%#Eval("活动名称")%></p>
                        </td>
                        <td>
                            <p>
                                <%#Eval("部门名称")%></p>
                        </td>
                        <td>
                            <p>
                                <%#Eval("活动类型")%></p>
                        </td>
                        <td>
                            <p>
                                <%#Eval("备注")%></p>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div id="更改密码" class="panel">
        <div class="content">
            <h2>
                更改密码</h2>
            <form id="form" runat="server">
            <table align="center">
                <tr>
                    <td>
                        <p>
                            <label>
                                原密码</label></p>
                    </td>
                    <td>
                        <p>
                            <input id="old" name="old" type="password" style="width: 190px" /></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <label>
                                新密码</label></p>
                    </td>
                    <td>
                        <p>
                            <input id="new1" name="new1" type="password" style="width: 190px" /></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <label>
                                确认新密码</label></p>
                    </td>
                    <td>
                        <p>
                            <input id="new2" name="new2" type="password" style="width: 190px" /></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <input id="check" name="check" type="checkbox" style="float: left; margin-top: 0px;
                                margin-right: 10px;" />
                            <label>
                                昵称</label></p>
                    </td>
                    <td>
                        <p>
                            <input id="name" name="name" type="text" style="width: 190px" /></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="提交" onclick="submitbutton()"/>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
    <div id="header">
        <h1>
            十四峰信息管理系统</h1>
        <ul id="navigation">
            <li><a id="link-home" href="#个人信息" style="font-family: 幼圆">个人信息</a></li>
            <li><a id="link-portfolio" href="#部门信息" style="font-family: 幼圆">部门信息</a></li>
            <li><a id="link-about" href="#活动信息" style="font-family: 幼圆">活动信息</a></li>
            <li><a id="link-contact" href="#更改密码" style="font-family: 幼圆">更改密码</a></li>
        </ul>
    </div>
</body>
</html>
