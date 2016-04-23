<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin6.aspx.cs" Inherits="Climber.Admin6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>信息管理系统</title>
    <script language="javascript" type="text/javascript">
        function CheckAll() {
            var cked = false;
            cked = document.getElementById("selectall").checked;
            for (var i = 0; i < document.all.length; i++) {
                var e = document.all(i);
                try {
                    if (e.name.substring(e.name.length - 6, e.name.length) == "select") {
                        e.checked = cked;
                    }
                }
                catch (exception) {
                }
            }
        }
    </script>
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
                            Height="40px" BackColor="#ABCFE2" Font-Names="黑体" Font-Size="Medium" ForeColor="White"
                            CausesValidation="False" OnClick="Button1_Click" Font-Bold="True" TabIndex="14" />
                        <asp:Panel ID="Panel1_1" BorderStyle="Inset" BorderWidth="1.5px" BorderColor="White"
                            runat="server">
                            <asp:Button ID="Button1_1" Text="■ 攀登记录查询" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#DC6423" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="12" />
                            <asp:Button ID="Button1_2" Text="■ 攀登记录输入" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#123862" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="13" />
                        </asp:Panel>
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
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="19" />
                    </asp:Panel>
                </td>
                <td align="left" valign="top">
                    <table align="center" width="700px">
                        <%--攀登记录窗口--%>
                        <tr>
                            <td>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Label ID="TitleName" Font-Size="X-Large" runat="server" Text="攀登记录" ForeColor="#07519A"
                                    Font-Bold="True" Font-Names="宋体" EnableTheming="False"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                    <%--攀登记录查询窗口--%>
                                    <asp:View ID="View1" runat="server">
                                        <table align="center" width="650px" style="border: 0.1px dashed #C49760; font-size: small;
                                            text-indent: 15px; line-height: 0px;" cellspacing="1">
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    学号
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:TextBox ID="xuehao1" runat="server" Height="12px" Width="100px" TabIndex="1"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVxuehao1" runat="server" ErrorMessage="只能输入数字"
                                                        ControlToValidate="xuehao1" ValidationExpression="^[0-9]*$" Font-Size="X-Small"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    山峰名称
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:TextBox ID="shanfeng1" runat="server" Height="12px" Width="100px" TabIndex="1"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    时间
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:TextBox ID="shijian1" runat="server" Height="12px" Width="100px" TabIndex="1"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVshijian1" runat="server" ErrorMessage="例如2012/1/1"
                                                        Font-Size="X-Small" ForeColor="Red" ControlToValidate="shijian1" ValidationExpression="^[1-9][\d]{3}[/]([1-9]|1[0-2])[/]([1-9]|((1|2)[0-9]|30|31))$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    是否登顶
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:DropDownList ID="dengding1" runat="server" AutoPostBack="false" Width="80px"
                                                        TabIndex="3">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="是">是</asp:ListItem>
                                                        <asp:ListItem Value="否">否</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" colspan="4" style="text-align: center" height="24px">
                                                    <asp:Button ID="chaxun" Text="查询" runat="server" OnClick="chaxun_Click" TabIndex="6" />
                                                    <asp:Button ID="chongzhi1" Text="重置" runat="server" OnClick="chongzhi_Click" TabIndex="7" />
                                                    <asp:Button ID="shanchu1" Text="删除" runat="server" CausesValidation="False" OnClick="shanchu_Click"
                                                        TabIndex="8" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <%--攀登记录输入窗口--%>
                                    <asp:View ID="View2" runat="server">
                                        <table align="center" width="650px" style="border: 0.1px dashed #C49760; font-size: small;
                                            text-indent: 15px; line-height: 0px;" cellspacing="1">
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    学号
                                                </td>
                                                <td bgcolor="#EEEEEE" style="height: 24px" height="24px" width="120px">
                                                    <asp:TextBox ID="xuehao2" runat="server" Height="12px" Width="100px" TabIndex="1"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVxuehao2" runat="server" ControlToValidate="xuehao2"
                                                        ErrorMessage="不能为空" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    山峰名称
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:TextBox ID="shanfeng2" runat="server" Height="12px" Width="100px" 
                                                        TabIndex="1"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVshanfeng2" runat="server" ControlToValidate="shanfeng2"
                                                        ErrorMessage="不能为空" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    时间
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:TextBox ID="shijian2" runat="server" Width="100px" Height="12px" 
                                                        TabIndex="6"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVshijian2" runat="server" ErrorMessage="例如2012/1/1"
                                                        Font-Size="X-Small" ForeColor="Red" ControlToValidate="shijian2" ValidationExpression="^[1-9][\d]{3}[/]([1-9]|1[0-2])[/]([1-9]|((1|2)[0-9]|30|31))$"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RFVshijian2" runat="server" ControlToValidate="shijian2"
                                                        ErrorMessage="不能为空" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="75px">
                                                    是否登顶
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="120px">
                                                    <asp:DropDownList ID="dengding2" runat="server" AutoPostBack="false" Width="80px"
                                                        TabIndex="3">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="是">是</asp:ListItem>
                                                        <asp:ListItem Value="否">否</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" colspan="4" style="text-align: center" height="24px">
                                                    <asp:Button ID="charu" Text="插入" runat="server" OnClick="charu_Click" TabIndex="6" />
                                                    <asp:Button ID="chongzhi2" Text="重置" runat="server" OnClick="chongzhi_Click" TabIndex="7" />
                                                    <asp:Button ID="shanchu2" Text="删除" runat="server" CausesValidation="False" OnClick="shanchu_Click"
                                                        TabIndex="8" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                </asp:MultiView>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Panel ID="panel2" runat="server" Width="650px" ScrollBars="Auto" HorizontalAlign="Center">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                        BackColor="#3366CC" BorderStyle="Dotted" BorderWidth="1px" CellPadding="4" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                        OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing"
                                        BorderColor="#3366CC" Height="214px" Font-Size="Small" OnRowCommand="GridView1_RowCommand"
                                        OnRowDataBound="GridView1_RowDataBound" ForeColor="#123862" AllowPaging="False"
                                        CellSpacing="1" GridLines="None" Width="650px">
                                        <AlternatingRowStyle Wrap="False"></AlternatingRowStyle>
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    全选<input id="selectall" name="selectall" onclick="javascript:CheckAll();" type="checkbox">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="select" runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="6%" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="编号" ReadOnly="True" />
                                            <asp:BoundField DataField="学号" HeaderText="学号"></asp:BoundField>
                                            <asp:BoundField DataField="山峰名称" HeaderText="山峰名称"></asp:BoundField>
                                            <asp:BoundField DataField="时间" HeaderText="时间" DataFormatString="{0:d}"></asp:BoundField>
                                            <asp:BoundField DataField="是否登顶" HeaderText="是否登顶"></asp:BoundField>
                                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" CausesValidation="false">
                                                <ItemStyle ForeColor="Blue" Wrap="False" />
                                            </asp:CommandField>
                                            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                        OnClientClick="return confirm('确定要删除这条记录吗?')" Text="删除"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle ForeColor="Blue" Wrap="False" />
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
