<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin2.aspx.cs" Inherits="Climber.Admin2" %>

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
                            Height="40px" BackColor="#ABCFE2" Font-Names="黑体" Font-Size="Medium" ForeColor="White"
                            CausesValidation="False" OnClick="Button1_Click" Font-Bold="True" TabIndex="18" />
                        <asp:Button ID="Button9" Text="新闻管理" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="19" />
                    </asp:Panel>
                </td>
                <td align="left" valign="top">
                    <table align="center" width="700px">
                        <%--物资管理窗口--%>
                        <tr>
                            <td>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Label ID="TitleName" Font-Size="X-Large" runat="server" Text="物资管理" ForeColor="#07519A"
                                    Font-Bold="True" Font-Names="宋体" EnableTheming="False"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" HorizontalAlign="Center">
                                    <asp:GridView ID="ParentGridView" OnRowDataBound="ParentGridView_RowDataBound" OnRowEditing="ParentGridView_RowEditing"
                                        OnRowCancelingEdit="ParentGridView_RowCancelingEdit" runat="server" AutoGenerateColumns="False"
                                        HorizontalAlign="Center" BackColor="#3366CC" BorderStyle="Dotted" BorderWidth="1px"
                                        CellPadding="4" BorderColor="#3366CC" Height="214px" Font-Size="Small" ForeColor="#123862"
                                        AllowPaging="False" CellSpacing="1" GridLines="None">
                                        <AlternatingRowStyle Wrap="False"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="装备编号" ReadOnly="True" />
                                            <asp:BoundField DataField="类别" HeaderText="类别" ReadOnly="True" />
                                            <asp:BoundField DataField="装备名称" HeaderText="装备名称" ReadOnly="True" />
                                            <asp:TemplateField HeaderText="查看详情">
                                                <ItemTemplate>
                                                    <asp:Button ID="ViewChild_Button" runat="server" Text="详细内容" CommandName="Edit" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Button ID="CancelChild_Button" runat="server" Text="关闭" CommandName="Cancel" />
                                                    <asp:GridView ID="ChildGridView" runat="server" AllowPaging="False" PageSize="3"
                                                        AutoGenerateColumns="False" BorderColor="Black" OnRowDataBound="ChildGridView_RowDataBound"
                                                        Width="241px">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="编号" ReadOnly="True" />
                                                            <asp:BoundField DataField="颜色" HeaderText="颜色" ReadOnly="True" />
                                                            <asp:BoundField DataField="长度" HeaderText="长度" ReadOnly="True" />
                                                        </Columns>
                                                        <HeaderStyle BackColor="Azure" Font-Size="12px" HorizontalAlign="Center" />
                                                        <RowStyle HorizontalAlign="Center" />
                                                        <PagerStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle Wrap="false" />
                                        <HeaderStyle BackColor="#068ADB" Font-Bold="True" ForeColor="White" Font-Size="Small"
                                            HorizontalAlign="Center" Wrap="False" />
                                        <RowStyle BackColor="White" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <PagerStyle ForeColor="White" HorizontalAlign="Left" Font-Bold="True" Font-Underline="True"
                                            Font-Size="Small" Wrap="false" BackColor="#068ADB" />
                                        <SelectedRowStyle Wrap="False" />
                                    </asp:GridView>
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
