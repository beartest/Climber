<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page2_1.aspx.cs" Inherits="Climber.Page2_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>������Ѷ/�����</title>
    <meta content="text/html; charset=gb2312" http-equiv="Content-Type"/>
<meta content="IE"="EmulateIE7" http-equiv="X-UA-Compatible"/><link rel="stylesheet" 
type="text/css" href="DDDS/reset-min.css"/><link rel="stylesheet" 
type="text/css" href="DDDS/fonts-min.css"/><link rel="stylesheet" 
type="text/css" href="DDDS/grids-min.css"/><link rel="stylesheet" 
type="text/css" href="DDDS/Common.css"/><link rel="stylesheet" 
type="text/css" href="DDDS/Index.css"/>
<script type="text/javascript" src="DDDS/jquery-1.7.2.min.js"></script>
<!--[if lt IE 7]>
        <script src="/Sites/CQUmain/Themes/Default/Scripts/IEJS/IE7.js">
        </script>
        <![endif]-->
<script type="text/javascript" src="DDDS/iepngfix_tilebg.js"></script>

<meta name="GENERATOR" content="MSHTML 9.00.8112.16450"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <!--frame top-->
    <div id="frame-top">
      <div id="frame-top-warpper">
        <link rel="stylesheet" type="text/css" href="DDDS/frame-top-link.css"/>
        <!--logo-->
      <div id="frame-top-logo">
        <table>
          <tbody><tr>
            <td style="VERTICAL-ALIGN: top">&nbsp;<br />
                <img alt="�й����ʴ�ѧ����������ɽ���Ҿ��ֲ�" src="images/top.jpg"/></h1>
              </td>
          </tr></tbody>
        </table>
      </div>
      <!--navbar-->
      <div id="frame-top-navbar">
          <link rel="stylesheet" type="text/css" href="DDDS/MainMenu.css"/>
          <link rel="stylesheet" type="text/css" href="DDDS/jqueryslidemenu.css">
          <script type="text/javascript" src="DDDS/jquery.slidemenu.js"></script>

          <script type="text/javascript">
              $(document).ready(function () {
                  mlddminit(375);
              });
  </script>
      <!--������-->
<div  id="navbar-left"></div>
<div id="navbar-middle">
  <ul class="mlddm" params="1,-1,500,slide,200,h">
  <li><a target="_self" href="Page1.aspx">��ҳ��</a></li>
  <li><a target="_self" href="Page2_3.aspx?i=���ֲ����">���ֲ����</a>
    <ul>
    <li><a target="_self" href="Page2_3.aspx?i=���ֲ����">���ֲ�����</a></li> 
    <li><a target="_self" href="Page2_2.aspx?i=���Ž���">���Ž���</a></li>
    </ul>
  </li>
  <li><a target="_self" href="Page2_3.aspx?i=���¼�">���¼�</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=�ճ��">�ճ��</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">��Ʒ�</a>
    <ul>
      <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">��ѵ</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">��ɽ�Ļ���</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">�������ʵ��</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">ʮһ��ɽ�</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=��Ʒ�">�����</a></li>
    </ul>
  </li>
  <li><a target="_self" href="#">ɽ�˷��</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=����ٿ�">����ٿ�</a></li>
  <li><a target="_self" href="#">ý������</a></li>
  <li><a target="_self" href="Page2_3.aspx?i=��ϵ����">��ϵ����</a></li>
</ul>
</div>
<div id="navbar-right"></div>
       </div>
      <div id="frame-top-slider-detail"></div>
<!--��ͬ����-->
<div>
<table id="Table1" runat="server" align="center" width="990">
    <tr align="center">
      <td width="220" align="center" valign="top"><img alt="�й����ʴ�ѧ����������ɽ���Ҿ��ֲ�" src="images/left.jpg"/></td> 
      <td width="770" align="left" valign="top">
        <table>
          <tr>
            <td style="height:15px">��ǰλ�ã�<a href="Page1.aspx">��ҳ</a>&gt;&gt;<asp:Label ID="Label2"
                runat="server" Text="Label"></asp:Label></td>
            <!--<td>�����ؼ�,����ʱ��������</td> -->
          </tr> 
          <tr>
           <td width="760" align="left" style="height:65px">
           <!--repater��-->
             <table>
            <asp:repeater ID="repeater1" runat="server" 
                     onitemdatabound="repeater1_ItemDataBound">
                <headertemplate>
                <table style="table-layout:fixed">
                </headertemplate>
                <itemtemplate>
                  <tr>
                   <font color="black">
                      <td style="width:15px"></td>
                      <td align="center" style="width: 45px"><img border="0" src="Images/index_002.gif" width="9" height="10" alt=""></td> 
                      <td style="width: 520px"><a href="Page3_1.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ID")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem,"���ű���") %></a></td>   
                      <!-- <%#DataBinder.Eval(Container.DataItem,"����ʱ��","yy-MM-dd") %>-->
                      <td style="width: 80px"><%#DateTime.ParseExact(Eval("����ʱ��").ToString(),"yyyy/M/d H:mm:ss",null).ToString("yy-MM-dd") %></td> 
                   </font>
                 </tr> 
                </itemtemplate>
                <FooterTemplate>
                <tr>
                 <td style="width:15px"></td>
                 <td align="center" style="width: 45px"></td>
                 <td style="width: 520px">��<asp:Label ID="labCurrentPage" runat="server" Text="Label"></asp:Label>ҳ
                  ��<asp:Label ID="labPageCount" runat="server" Text="Label"></asp:Label>ҳ
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:HyperLink ID="hlFirst" runat="server">��ҳ</asp:HyperLink>
                  <asp:HyperLink ID="hlPrevious" runat="server">��һҳ</asp:HyperLink>
                  <asp:HyperLink ID="hlNext" runat="server">��һҳ</asp:HyperLink>
                  </td>
                 <td style="width: 80px"><asp:HyperLink ID="hlLast" runat="server">ĩҳ</asp:HyperLink></td>
                </tr>
                </table>
                </FooterTemplate>
                </asp:repeater>
              </table>
           </td> 
          </tr> 
          </table> 
      </td> 
    </tr> 
  </table> 
  </div> 
<!--���ݽ���-->
<div id="frame-bottom"><link rel="stylesheet" type="text/css" href="DDDS/Footer.css">
<div id="frame-bottom-wrapper">
<div id="frame-bottom-logo"></div>
<div id="frame-bottom-copyright">
   <h1>��Ȩ����@�й����ʴ�ѧ����������ɽ���Ҿ��ֲ�  ��ַ�������к�����ѧԺ·29���й����ʴ�ѧ�������� �ʱࣺ100083</h1> 
</div>
</div>
</div>
    </div>
    </form>
</body>
</html>
