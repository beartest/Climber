<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin9.aspx.cs" Inherits="Climber.Admin9" %>

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
                            Height="40px" BackColor="#ABCFE2" Font-Names="黑体" Font-Size="Medium" ForeColor="White"
                            CausesValidation="False" OnClick="Button1_Click" Font-Bold="True" TabIndex="16" />
                        <asp:Panel ID="Panel1_1" BorderStyle="Inset" BorderWidth="1.5px" BorderColor="White"
                            runat="server">
                            <asp:Button ID="Button1_1" Text="■ 队员信息查询" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#DC6423" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="17" />
                            <asp:Button ID="Button1_2" Text="■ 队员信息输入" runat="server" Width="197px" Height="30px"
                                BackColor="White" BorderStyle="None" ForeColor="#123862" OnClick="Button2_Click"
                                CausesValidation="False" TabIndex="18" />
                        </asp:Panel>
                        <asp:Button ID="Button2" Text="部门信息" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="19" />
                        <asp:Button ID="Button3" Text="活动信息" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="20" />
                        <asp:Button ID="Button4" Text="攀登记录" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="21" />
                        <asp:Button ID="Button5" Text="会议考勤" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="22" />
                        <asp:Button ID="Button6" Text="体能指标" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="23" />
                        <asp:Button ID="Button7" Text="密码重置" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="24" />
                        <asp:Button ID="Button8" Text="物资管理" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="25" />
                        <asp:Button ID="Button9" Text="新闻管理" BorderStyle="None" runat="server" Width="200px"
                            Height="40px" BackColor="#EAF1FB" Font-Names="黑体" Font-Size="Medium" ForeColor="#07519A"
                            CausesValidation="False" OnClick="Button1_Click" TabIndex="26" />
                    </asp:Panel>
                </td>
                <td align="left" valign="top">
                    <table align="center" width="700px">
                        <%--队员信息窗口--%>
                        <tr>
                            <td>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Label ID="TitleName" Font-Size="X-Large" runat="server" Text="队员信息" ForeColor="#07519A"
                                    Font-Bold="True" Font-Names="宋体" EnableTheming="False"></asp:Label>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                                    <%--队员信息查询窗口--%>
                                    <asp:View ID="View1" runat="server">
                                        <table align="center" width="650px" style="border: 0.1px dashed #C49760; font-size: small;
                                            text-indent: 15px; line-height: 0px;" cellspacing="1">
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="440px">
                                                    学号
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="568px">
                                                    <asp:TextBox ID="xuehao1" runat="server" Width="80px" Height="12px" TabIndex="1"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVxuehao1" runat="server" ErrorMessage="只能输入数字"
                                                        ControlToValidate="xuehao1" ValidationExpression="^[0-9]*$" Font-Size="X-Small"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="360px">
                                                    姓名
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="580px">
                                                    <asp:TextBox ID="xingming1" runat="server" Width="90px" Height="12px" TabIndex="2"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="440px">
                                                    性别
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="568px">
                                                    <asp:DropDownList ID="xingbie1" AutoPostBack="false" runat="server" Width="55px"
                                                        TabIndex="3">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="男">男</asp:ListItem>
                                                        <asp:ListItem Value="女">女</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="360px">
                                                    联系电话
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="580px">
                                                    <asp:TextBox ID="dianhua1" runat="server" Width="90px" Height="12px" TabIndex="4"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVdianhua1" runat="server" ErrorMessage="号码格式错误"
                                                        ControlToValidate="dianhua1" ForeColor="Red" Font-Size="X-Small" ValidationExpression="^((\d{3,4}-)\d{7,8})|\d{11}$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="440px">
                                                    出生日期
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="568px">
                                                    <asp:TextBox ID="shengri1" runat="server" Width="80px" Height="12px" TabIndex="5"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVshengri1" runat="server" ErrorMessage="例如2012/1/1"
                                                        Font-Size="X-Small" ForeColor="Red" ControlToValidate="shengri1" ValidationExpression="^[1-9][\d]{3}[/]([1-9]|1[0-2])[/]([1-9]|((1|2)[0-9]|30|31))$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="360px">
                                                    籍贯
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="580px">
                                                    <asp:DropDownList ID="jiguan1" runat="server" Width="70px" TabIndex="6">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="北京市">北京市</asp:ListItem>
                                                        <asp:ListItem Value="上海市">上海市</asp:ListItem>
                                                        <asp:ListItem Value="天津市">天津市</asp:ListItem>
                                                        <asp:ListItem Value="重庆市">重庆市</asp:ListItem>
                                                        <asp:ListItem Value="河北省">河北省</asp:ListItem>
                                                        <asp:ListItem Value="山西省">山西省</asp:ListItem>
                                                        <asp:ListItem Value="内蒙古自治区">内蒙古自治区</asp:ListItem>
                                                        <asp:ListItem Value="辽宁省">辽宁省</asp:ListItem>
                                                        <asp:ListItem Value="吉林省">吉林省</asp:ListItem>
                                                        <asp:ListItem Value="黑龙江省">黑龙江省</asp:ListItem>
                                                        <asp:ListItem Value="江西省">江西省</asp:ListItem>
                                                        <asp:ListItem Value="浙江省">浙江省</asp:ListItem>
                                                        <asp:ListItem Value="江苏省">江苏省</asp:ListItem>
                                                        <asp:ListItem Value="安徽省">安徽省</asp:ListItem>
                                                        <asp:ListItem Value="福建省">福建省</asp:ListItem>
                                                        <asp:ListItem Value="山东省">山东省</asp:ListItem>
                                                        <asp:ListItem Value="河南省">河南省</asp:ListItem>
                                                        <asp:ListItem Value="湖北省">湖北省</asp:ListItem>
                                                        <asp:ListItem Value="湖南省">湖南省</asp:ListItem>
                                                        <asp:ListItem Value="广东省">广东省</asp:ListItem>
                                                        <asp:ListItem Value="广西自治区">广西自治区</asp:ListItem>
                                                        <asp:ListItem Value="海南省">海南省</asp:ListItem>
                                                        <asp:ListItem Value="四川省">四川省</asp:ListItem>
                                                        <asp:ListItem Value="贵州省">贵州省</asp:ListItem>
                                                        <asp:ListItem Value="云南省">云南省</asp:ListItem>
                                                        <asp:ListItem Value="西藏自治区">西藏自治区</asp:ListItem>
                                                        <asp:ListItem Value="陕西省">陕西省</asp:ListItem>
                                                        <asp:ListItem Value="青海省">青海省</asp:ListItem>
                                                        <asp:ListItem Value="宁夏自治区">宁夏自治区</asp:ListItem>
                                                        <asp:ListItem Value="新疆自治区">新疆自治区</asp:ListItem>
                                                        <asp:ListItem Value="香港特别行政区">香港特别行政区</asp:ListItem>
                                                        <asp:ListItem Value="澳门特别行政区">澳门特别行政区</asp:ListItem>
                                                        <asp:ListItem Value="中国台湾">中国台湾</asp:ListItem>
                                                        <asp:ListItem Value="其他">其他</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="440px">
                                                    所在院系
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="568px">
                                                    <asp:DropDownList ID="xueyuan1" AutoPostBack="false" runat="server" Width="100px"
                                                        TabIndex="7">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="地球科学与资源学院">地球科学与资源学院</asp:ListItem>
                                                        <asp:ListItem Value="工程技术学院">工程技术学院</asp:ListItem>
                                                        <asp:ListItem Value="材料科学与工程学院">材料科学与工程学院</asp:ListItem>
                                                        <asp:ListItem Value="信息工程学院">信息工程学院</asp:ListItem>
                                                        <asp:ListItem Value="水资源与环境学院">水资源与环境学院</asp:ListItem>
                                                        <asp:ListItem Value="能源学院">能源学院</asp:ListItem>
                                                        <asp:ListItem Value="人文经管学院">人文经管学院</asp:ListItem>
                                                        <asp:ListItem Value="外语系">外语系</asp:ListItem>
                                                        <asp:ListItem Value="珠宝学院">珠宝学院</asp:ListItem>
                                                        <asp:ListItem Value="地球物理与信息技术学院">地球物理与信息技术学院</asp:ListItem>
                                                        <asp:ListItem Value="海洋学院">海洋学院</asp:ListItem>
                                                        <asp:ListItem Value="土地科学技术学院">土地科学技术学院</asp:ListItem>
                                                        <asp:ListItem Value="数理学院">数理学院</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="360px">
                                                    入学年份
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="164px">
                                                    <asp:DropDownList ID="xuenian1" AutoPostBack="false" runat="server" Width="55px"
                                                        TabIndex="8">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="2004">2004</asp:ListItem>
                                                        <asp:ListItem Value="2005">2005</asp:ListItem>
                                                        <asp:ListItem Value="2006">2006</asp:ListItem>
                                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                                        <asp:ListItem Value="2011">2011</asp:ListItem>
                                                        <asp:ListItem Value="2012">2012</asp:ListItem>
                                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                                        <asp:ListItem Value="2016">2016</asp:ListItem>
                                                        <asp:ListItem Value="2017">2017</asp:ListItem>
                                                        <asp:ListItem Value="2018">2018</asp:ListItem>
                                                        <asp:ListItem Value="2019">2019</asp:ListItem>
                                                        <asp:ListItem Value="2020">2020</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="180px">
                                                    学历
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="255px">
                                                    <asp:DropDownList ID="xueli1" AutoPostBack="false" runat="server" Width="55px" TabIndex="9">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="本科生">本科生</asp:ListItem>
                                                        <asp:ListItem Value="研究生">研究生</asp:ListItem>
                                                        <asp:ListItem Value="博士生">博士生</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" colspan="1" height="24px" width="440px">
                                                    所属文职部门
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="1" height="24px" width="568px">
                                                    <asp:DropDownList ID="bumen1" runat="server" AutoPostBack="false" Width="100px" TabIndex="10">
                                                        <asp:ListItem Value="全部">全部</asp:ListItem>
                                                        <asp:ListItem Value="办公室">办公室</asp:ListItem>
                                                        <asp:ListItem Value="公关部">公关部</asp:ListItem>
                                                        <asp:ListItem Value="活动部">活动部</asp:ListItem>
                                                        <asp:ListItem Value="秘书处">秘书处</asp:ListItem>
                                                        <asp:ListItem Value="宣传部">宣传部</asp:ListItem>
                                                        <asp:ListItem Value="岩场管理部">岩场管理部</asp:ListItem>
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="360px">
                                                    职位
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="600px">
                                                    <asp:DropDownList ID="zhiwei1" runat="server" AutoPostBack="false" Width="70px" TabIndex="11">
                                                        <asp:ListItem Text="全部"></asp:ListItem>
                                                        <asp:ListItem Text="干事"></asp:ListItem>
                                                        <asp:ListItem Text="部长"></asp:ListItem>
                                                        <asp:ListItem Text="副部长"></asp:ListItem>
                                                        <asp:ListItem Text="未知"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" rowspan="1" colspan="6" style="text-align: center" height="24px">
                                                    <asp:Button ID="chaxun" Text="查询" runat="server" OnClick="chaxun_Click" TabIndex="12" />
                                                    <asp:Button ID="chongzhi1" Text="重置" runat="server" CausesValidation="False" OnClick="chongzhi_Click"
                                                        TabIndex="13" />
                                                    <asp:Button ID="shanchu1" Text="删除" runat="server" CausesValidation="False" OnClick="shanchu_Click"
                                                        TabIndex="14" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:View>
                                    <%--队员信息输入窗口--%>
                                    <asp:View ID="View2" runat="server">
                                        <table align="center" width="650px" style="border: 0.1px dashed #C49760; font-size: small;
                                            text-indent: 15px; line-height: 0px;" cellspacing="1">
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="470px">
                                                    学号
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="780px">
                                                    <asp:TextBox ID="xuehao2" runat="server" Width="80px" Height="12px" TabIndex="1"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVxuehao2" runat="server" ErrorMessage="只能输数字"
                                                        ControlToValidate="xuehao2" ValidationExpression="^[0-9]*$" Font-Size="X-Small"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RFVxuehao2" runat="server" ControlToValidate="xuehao2"
                                                        ErrorMessage="不能为空" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="330px">
                                                    姓名
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="500px">
                                                    <asp:TextBox ID="xingming2" runat="server" Width="55px" Height="12px" TabIndex="2"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RFVxingming2" runat="server" ControlToValidate="xingming2"
                                                        ErrorMessage="不能为空" Font-Size="X-Small" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="470px">
                                                    性别
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="780px">
                                                    <asp:RadioButton ID="xingbie2a" runat="server" Text="男" GroupName="xingbie11b" TabIndex="3" />
                                                    <asp:RadioButton ID="xingbie2b" runat="server" Text="女" GroupName="xingbie11b" TabIndex="4" />
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="330px">
                                                    联系电话
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="500px">
                                                    <asp:TextBox ID="dianhua2" runat="server" Width="104px" Height="12px" TabIndex="5"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVdianhua2" runat="server" ErrorMessage="号码格式错误"
                                                        ControlToValidate="dianhua2" ForeColor="Red" Font-Size="X-Small" ValidationExpression="^((\d{3,4}-)\d{7,8})|\d{11}$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="470px">
                                                    出生日期
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="780px">
                                                    <asp:TextBox ID="shengri2" runat="server" Width="80px" Height="12px" TabIndex="6"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="REVshengri2" runat="server" ErrorMessage="例如2012/1/1"
                                                        Font-Size="X-Small" ForeColor="Red" ControlToValidate="shengri2" ValidationExpression="^[1-9][\d]{3}[/]([1-9]|1[0-2])[/]([1-9]|((1|2)[0-9]|30|31))$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="330px">
                                                    籍贯
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="480px">
                                                    <asp:DropDownList ID="jiguan2" runat="server" Width="70px" TabIndex="7">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="北京市">北京市</asp:ListItem>
                                                        <asp:ListItem Value="上海市">上海市</asp:ListItem>
                                                        <asp:ListItem Value="天津市">天津市</asp:ListItem>
                                                        <asp:ListItem Value="重庆市">重庆市</asp:ListItem>
                                                        <asp:ListItem Value="河北省">河北省</asp:ListItem>
                                                        <asp:ListItem Value="山西省">山西省</asp:ListItem>
                                                        <asp:ListItem Value="内蒙古自治区">内蒙古自治区</asp:ListItem>
                                                        <asp:ListItem Value="辽宁省">辽宁省</asp:ListItem>
                                                        <asp:ListItem Value="吉林省">吉林省</asp:ListItem>
                                                        <asp:ListItem Value="黑龙江省">黑龙江省</asp:ListItem>
                                                        <asp:ListItem Value="江西省">江西省</asp:ListItem>
                                                        <asp:ListItem Value="浙江省">浙江省</asp:ListItem>
                                                        <asp:ListItem Value="江苏省">江苏省</asp:ListItem>
                                                        <asp:ListItem Value="安徽省">安徽省</asp:ListItem>
                                                        <asp:ListItem Value="福建省">福建省</asp:ListItem>
                                                        <asp:ListItem Value="山东省">山东省</asp:ListItem>
                                                        <asp:ListItem Value="河南省">河南省</asp:ListItem>
                                                        <asp:ListItem Value="湖北省">湖北省</asp:ListItem>
                                                        <asp:ListItem Value="湖南省">湖南省</asp:ListItem>
                                                        <asp:ListItem Value="广东省">广东省</asp:ListItem>
                                                        <asp:ListItem Value="广西自治区">广西自治区</asp:ListItem>
                                                        <asp:ListItem Value="海南省">海南省</asp:ListItem>
                                                        <asp:ListItem Value="四川省">四川省</asp:ListItem>
                                                        <asp:ListItem Value="贵州省">贵州省</asp:ListItem>
                                                        <asp:ListItem Value="云南省">云南省</asp:ListItem>
                                                        <asp:ListItem Value="西藏自治区">西藏自治区</asp:ListItem>
                                                        <asp:ListItem Value="陕西省">陕西省</asp:ListItem>
                                                        <asp:ListItem Value="青海省">青海省</asp:ListItem>
                                                        <asp:ListItem Value="宁夏自治区">宁夏自治区</asp:ListItem>
                                                        <asp:ListItem Value="新疆自治区">新疆自治区</asp:ListItem>
                                                        <asp:ListItem Value="香港特别行政区">香港特别行政区</asp:ListItem>
                                                        <asp:ListItem Value="澳门特别行政区">澳门特别行政区</asp:ListItem>
                                                        <asp:ListItem Value="中国台湾">中国台湾</asp:ListItem>
                                                        <asp:ListItem Value="其他">其他</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" height="24px" width="470px">
                                                    所在院系
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="780px">
                                                    <asp:DropDownList ID="xueyuan2" AutoPostBack="false" runat="server" Width="100px"
                                                        TabIndex="8">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="地球科学与资源学院">地球科学与资源学院</asp:ListItem>
                                                        <asp:ListItem Value="工程技术学院">工程技术学院</asp:ListItem>
                                                        <asp:ListItem Value="材料科学与工程学院">材料科学与工程学院</asp:ListItem>
                                                        <asp:ListItem Value="信息工程学院">信息工程学院</asp:ListItem>
                                                        <asp:ListItem Value="水资源与环境学院">水资源与环境学院</asp:ListItem>
                                                        <asp:ListItem Value="能源学院">能源学院</asp:ListItem>
                                                        <asp:ListItem Value="人文经管学院">人文经管学院</asp:ListItem>
                                                        <asp:ListItem Value="外语系">外语系</asp:ListItem>
                                                        <asp:ListItem Value="珠宝学院">珠宝学院</asp:ListItem>
                                                        <asp:ListItem Value="地球物理与信息技术学院">地球物理与信息技术学院</asp:ListItem>
                                                        <asp:ListItem Value="海洋学院">海洋学院</asp:ListItem>
                                                        <asp:ListItem Value="土地科学技术学院">土地科学技术学院</asp:ListItem>
                                                        <asp:ListItem Value="数理学院">数理学院</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="330px">
                                                    入学年份
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="165px">
                                                    <asp:DropDownList ID="xuenian2" AutoPostBack="false" runat="server" Width="55px"
                                                        TabIndex="9">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="2004">2004</asp:ListItem>
                                                        <asp:ListItem Value="2005">2005</asp:ListItem>
                                                        <asp:ListItem Value="2006">2006</asp:ListItem>
                                                        <asp:ListItem Value="2007">2007</asp:ListItem>
                                                        <asp:ListItem Value="2008">2008</asp:ListItem>
                                                        <asp:ListItem Value="2009">2009</asp:ListItem>
                                                        <asp:ListItem Value="2010">2010</asp:ListItem>
                                                        <asp:ListItem Value="2011">2011</asp:ListItem>
                                                        <asp:ListItem Value="2012">2012</asp:ListItem>
                                                        <asp:ListItem Value="2013">2013</asp:ListItem>
                                                        <asp:ListItem Value="2014">2014</asp:ListItem>
                                                        <asp:ListItem Value="2015">2015</asp:ListItem>
                                                        <asp:ListItem Value="2016">2016</asp:ListItem>
                                                        <asp:ListItem Value="2017">2017</asp:ListItem>
                                                        <asp:ListItem Value="2018">2018</asp:ListItem>
                                                        <asp:ListItem Value="2019">2019</asp:ListItem>
                                                        <asp:ListItem Value="2020">2020</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="230px">
                                                    学历
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="165px">
                                                    <asp:DropDownList ID="xueli2" AutoPostBack="false" runat="server" Width="55px" TabIndex="10">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="本科生">本科生</asp:ListItem>
                                                        <asp:ListItem Value="研究生">研究生</asp:ListItem>
                                                        <asp:ListItem Value="博士生">博士生</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" colspan="1" height="24px" width="470px">
                                                    所属文职部门
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="1" height="24px" width="780px">
                                                    <asp:DropDownList ID="bumen2" runat="server" AutoPostBack="false" Width="100px" TabIndex="11">
                                                        <asp:ListItem Value="未知">未知</asp:ListItem>
                                                        <asp:ListItem Value="办公室">办公室</asp:ListItem>
                                                        <asp:ListItem Value="公关部">公关部</asp:ListItem>
                                                        <asp:ListItem Value="活动部">活动部</asp:ListItem>
                                                        <asp:ListItem Value="秘书处">秘书处</asp:ListItem>
                                                        <asp:ListItem Value="宣传部">宣传部</asp:ListItem>
                                                        <asp:ListItem Value="岩场管理部">岩场管理部</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td bgcolor="#EEEEEE" height="24px" width="330px">
                                                    职位
                                                </td>
                                                <td bgcolor="#EEEEEE" colspan="3" height="24px" width="480">
                                                    <asp:DropDownList ID="zhiwei2" runat="server" AutoPostBack="false" Width="70px" TabIndex="12">
                                                        <asp:ListItem Text="未知"></asp:ListItem>
                                                        <asp:ListItem Text="干事"></asp:ListItem>
                                                        <asp:ListItem Text="部长"></asp:ListItem>
                                                        <asp:ListItem Text="副部长"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#EEEEEE" colspan="6" style="text-align: center" height="24px">
                                                    <asp:Button ID="charu" Text="插入" runat="server" OnClick="charu_Click" TabIndex="13" />
                                                    <asp:Button ID="chongzhi2" Text="重置" runat="server" CausesValidation="False" OnClick="chongzhi_Click"
                                                        TabIndex="14" />
                                                    <asp:Button ID="shanchu2" Text="删除" runat="server" CausesValidation="False" OnClick="shanchu_Click"
                                                        TabIndex="15" />
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
                                        ForeColor="#123862" PageSize="40" AllowPaging="True" CellSpacing="1" GridLines="None"
                                        OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound">
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
                                            <asp:BoundField DataField="姓名" HeaderText="姓名"></asp:BoundField>
                                            <asp:BoundField DataField="性别" HeaderText="性别"></asp:BoundField>
                                            <asp:BoundField DataField="联系电话" HeaderText="联系电话"></asp:BoundField>
                                            <asp:BoundField DataField="出生日期" HeaderText="出生日期" DataFormatString="{0:d}"></asp:BoundField>
                                            <asp:BoundField DataField="籍贯" HeaderText="籍贯"></asp:BoundField>
                                            <asp:BoundField DataField="所在院系" HeaderText="所在院系" />
                                            <asp:BoundField DataField="入学年份" HeaderText="入学年份"></asp:BoundField>
                                            <asp:BoundField DataField="学历" HeaderText="学历"></asp:BoundField>
                                            <asp:BoundField DataField="部门名称" HeaderText="所属部门" />
                                            <asp:BoundField DataField="职位" HeaderText="职位"></asp:BoundField>
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
