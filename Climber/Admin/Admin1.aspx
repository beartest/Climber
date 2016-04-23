<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin1.aspx.cs" Inherits="Climber.Admin11" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>信息管理系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table id="Table1" runat="server" align="center">
            <%--第一行显示标题图片--%>
            <tr>
                <td colspan="2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/AdminTitle.jpg" Width="900px" />
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                    <asp:Panel ID="Panel1" BackColor="#EAF1FB" BorderColor="#07519A" runat="server" BorderWidth="1px"
                        Width="200px">
                        <asp:Panel ID="Time" Width="192px" Height="90px" runat="server" BorderColor="#1C74CC"
                            BackColor="#5097D9" BorderWidth="4px" HorizontalAlign="Center">
                            <br />
                            <asp:Label ID="DateLabel" runat="server" BackColor="#5097D9" ForeColor="White">
                            </asp:Label>
                            <p>
                                <asp:Label ID="WeekLabel" runat="server" BackColor="#5097D9" ForeColor="White">
                                </asp:Label>
                            </p>
                        </asp:Panel>
                        <asp:Button ID="Button1" Text="队员信息" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="9" />
                        <asp:Button ID="Button2" Text="部门信息" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="10" />
                        <asp:Button ID="Button3" Text="活动信息" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="11" />
                        <asp:Button ID="Button4" Text="攀登记录" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="14" />
                        <asp:Button ID="Button5" Text="会议考勤" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="15" />
                        <asp:Button ID="Button6" Text="体能指标" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="16" />
                        <asp:Button ID="Button7" Text="密码重置" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="17" />
                        <asp:Button ID="Button8" Text="物资管理" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="18" />
                        <asp:Button ID="Button9" Text="新闻管理" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#ABCFE2" Font-Names="黑体" Font-Size="Medium" ForeColor="White"
                            CausesValidation="False" OnClick="Button1_Click" Font-Bold="True" TabIndex="19" />
                            <asp:Panel ID="Panel1_1" BorderStyle="Inset" BorderWidth="1.5px" BorderColor="White"
                            runat="server">
                            <asp:Button ID="Button1_1" Text="■ 新闻资讯" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#DC6423" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="12" />
                            <asp:Button ID="Button1_2" Text="■ 活动公告" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#123862" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="13" />
                        </asp:Panel>
                    </asp:Panel>
                </td>
                <td align="left" valign="top">
                    <table align="center" width="700px">
                        <%--新闻管理窗口--%>
                        <tr>
                            <td>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Label ID="TitleName" Font-Size="X-Large" runat="server" Text="新闻管理" ForeColor="#07519A"
                                    Font-Bold="True" Font-Names="宋体" EnableTheming="False"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Panel ID="panel2" runat="server" Width="650px" ScrollBars="Auto" HorizontalAlign="Center">
                                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="View1" runat="server">
                                            <table>
                                                <tr>
                                                    <td align="center">
                                                        <asp:DataGrid ID="news" runat="server" AllowCustomPaging="True" AllowPaging="True"
                                                            AutoGenerateColumns="False" BorderColor="Black" GridLines="Horizontal" OnDeleteCommand="news_DeleteCommand"
                                                            OnItemCreated="news_ItemCreated" OnItemDataBound="news_ItemDataBound" OnPageIndexChanged="news_PageIndexChanged"
                                                            PageSize="15" BackColor="#CCFFCC" ForeColor="Black" BorderWidth="1px" OnItemCommand="news_ItemCommand">
                                                            <Columns>
                                                                <asp:BoundColumn HeaderText="编号" DataField="ID">
                                                                    <HeaderStyle Width="3cm" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn HeaderText="新闻标题" DataField="新闻标题">
                                                                    <HeaderStyle Width="18cm" />
                                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                        Font-Underline="False" HorizontalAlign="Left" />
                                                                </asp:BoundColumn>
                                                                <asp:ButtonColumn HeaderText="查看" Text="查看" ButtonType="PushButton">
                                                                    <HeaderStyle Width="3cm" />
                                                                </asp:ButtonColumn>
                                                                <asp:ButtonColumn HeaderText="删除" Text="删除" CommandName="Delete">
                                                                    <HeaderStyle Width="3cm" />
                                                                </asp:ButtonColumn>
                                                            </Columns>
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Large"
                                                                Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                                            <PagerStyle Mode="NumericPages" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right">
                                                        <asp:Button ID="Btnadd" runat="server" Text="添加" Width="57px" Height="20px" OnClick="Btnadd_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:View>
                                    </asp:MultiView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
