<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page1.aspx.cs" Inherits="Climber.Page1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>登山攀岩俱乐部首页</title>
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
            <td style="VERTICAL-ALIGN: top" class="style1">&nbsp;<br />
                <img alt="中国地质大学（北京）登山攀岩俱乐部" src="images/top.jpg"/></td>
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
           <!--导航栏-->
<div id="navbar-left"></div>
<div id="navbar-middle">
  <ul class="mlddm" params="1,-1,500,slide,200,h">
  <li><a target="_self" href="Page1.aspx">首页面</a></li>
  <li><a target="_self" href="Page2_3.aspx?i=俱乐部简介">俱乐部简介</a>
    <ul>
    <li><a target="_self" href="Page2_3.aspx?i=俱乐部简介">俱乐部介绍</a></li> 
    <li><a target="_self" href="Page2_2.aspx?i=部门介绍">部门介绍</a></li>
    </ul>
  </li>
  <li><a target="_self" href="Page2_3.aspx?i=大事记">大事记</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=日常活动">日常活动</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=精品活动">精品活动</a>
    <ul>
      <li><a target="_self" href="Page2_2.aspx?i=精品活动">冬训</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=精品活动">登山文化节</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=精品活动">暑期社会实践</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=精品活动">十一登山活动</a></li> 
      <li><a target="_self" href="Page2_2.aspx?i=精品活动">报告会</a></li>
    </ul>
  </li>
  <li><a target="_self" href="#">山人风光</a></li>
  <li><a target="_self" href="Page2_2.aspx?i=户外百科">户外百科</a></li>
  <li><a target="_self" href="#">媒体形象</a></li>
  <li><a target="_self" href="Page2_3.aspx?i=联系我们">联系我们</a></li>
</ul>
</div>
<div id="navbar-right"></div>
       </div>
      <div id="frame-top-slider-detail"></div>
      <!-- 大图轮播slider-->
      <div id="frame-top-slider" class="smallslider">
        <script type="text/javascript"  src="DDDS/XMosaic.js"></script>
          <script type="text/javascript">
            $(document).ready(function () {var mosaic = XMosaic('bigpic', { pager: 'pager', delay: 10000, countX: 10, countY: 5, how: 9, order: 0 });});
          </script>
          <link rel="stylesheet" type="text/css"  href="DDDS/BigPic.css">
          <div id="bigpic">
            <a style="POSITION: absolute; TOP: 0px; LEFT: 0px" href="#" target="_blank" >
            <img src="DDDS/head1.jpg" alt="中国地质大学（北京）登山攀岩俱乐部"/></a>
            <a style="POSITION: absolute; TOP: 0px; LEFT: 0px" href="#" target="_blank" >
            <img src="DDDS/head2.jpg" alt="中国地质大学（北京）登山攀岩俱乐部"/></a> 
            <a style="POSITION: absolute; TOP: 0px; LEFT: 0px" href="#" target="_blank" >
            <img src="DDDS/head3.jpg" alt="中国地质大学（北京）登山攀岩俱乐部"/></a> 
            <a style="POSITION: absolute; TOP: 0px; LEFT: 0px" href="#" target="_blank" >
            <img src="DDDS/head4.jpg" alt="中国地质大学（北京）登山攀岩俱乐部"/></a> 
            <a style="POSITION: absolute; TOP: 0px; LEFT: 0px" href="#" target="_blank" >
            <img src="DDDS/head5.jpg" alt="中国地质大学（北京）登山攀岩俱乐部"/></a> 
          </div>
       </div>
       </div>
      <div id="frame-top-slider-mask"></div>
    </div>
    <!--frame main-->
    <div id="frame-main-body">
    <div id="frame-main-wrapper" class="yui3-g">
    <div id="frame-main" class="yui3-u">
    <div id="frame-main-left" class="yui3-u-1-2"><!--<module1 modulecode='F088D8DC-A70C-4A0B-978E-8098B65D9B89' pagesize='7'></module>-->
      <link rel="stylesheet" type="text/css"  href="DDDS/ModuleList.css">
      <link rel="stylesheet" type="text/css"  href="DDDS/Pager.css">
    <div class="module module_left">
    <div class="module-name">
      <br/>
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">新闻资讯</asp:LinkButton>
    </div>
    <div class="module-spliter"></div>
<!---->
      <div>
         <table id="table1">
            <tr>
               <td style="ailgn:right;width: 365px">
                <asp:repeater ID="repeater1" runat="server">
                <headertemplate>
                <table style="table-layout:fixed">
                </headertemplate>
                <itemtemplate>
                  <tr>
                   <font color="black">
                      <td align="center" style="width: 40px"><img border="0" src="Images/index_001.gif" width="7" height="9" alt=""></td> 
                      <td style="width: 245px"><a href="Page3_1.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ID")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "新闻标题").ToString().Length > 15 ? Eval("新闻标题").ToString().Substring(0, 15) : Eval("新闻标题").ToString()%></a></td>   
                      <!-- <%#DataBinder.Eval(Container.DataItem,"发布时间","yy-MM-dd") %>-->
                      <td style="width: 80px"><%#DateTime.ParseExact(Eval("发布时间").ToString(),"yyyy/M/d H:mm:ss",null).ToString("yy-MM-dd") %></td> <!--还是不行啊！-->
                   </font>
                 </tr> 
                </itemtemplate>
                <FooterTemplate>
                </table>
                </FooterTemplate>
                </asp:repeater>
               </td>
            </tr>   
          </table>
      </div> 
    </div>
    </div>


<div id="frame-main-right" class="yui3-u-1-2">
  <link rel="stylesheet" type="text/css" href="DDDS/ModuleList.css">
  <link rel="stylesheet" type="text/css" href="DDDS/Pager.css">
  <div class="module">
    <div class="module-name">
      <br/>
        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton1_Click">活动公告</asp:LinkButton>  
    </div>
   
    <div class="module-spliter"></div>
<!---->
       <div>
          <table id="table2">
            <tr>
               <td style="ailgn:right;width: 365px">
                <asp:repeater ID="repeater2" runat="server">
                <headertemplate>
                <table style="table-layout:fixed">
                </headertemplate>
                <itemtemplate>
                  <tr>
                   <font color="black">
                      <td align="center" style="width: 40px"><img border="0" src="Images/index_001.gif" width="7" height="9" alt=""></td> 
                      <td style="width: 245px"><a href="Page3_1.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ID")%>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "新闻标题").ToString().Length > 15 ? Eval("新闻标题").ToString().Substring(0, 15) : Eval("新闻标题").ToString()%></a></td>   
                      <!-- <%#DataBinder.Eval(Container.DataItem,"发布时间","yy-MM-dd") %>-->
                      <td style="width: 80px"><%#DateTime.ParseExact(Eval("发布时间").ToString(),"yyyy/M/d H:mm:ss",null).ToString("yy-MM-dd") %></td> <!--还是不行啊！-->
                   </font>
                 </tr> 
                </itemtemplate>
                <FooterTemplate>
                </table>
                </FooterTemplate>
                </asp:repeater>
               </td>
            </tr>   
          </table>
        </div> 
<!--22222--></div>
   <link rel="stylesheet" type="text/css" href="DDDS/ModuleList.css">

   <script type="text/javascript" src="DDDS/jquery.js"></script>
   <script type="text/javascript" src="DDDS/kandytabs.pack.js"></script>
   <script type="text/javascript" src="DDDS/custom.js"></script>

   <style type="text/css">#AcadeInfoList {POSITION: relative; TOP: -20px}
                          #AcadeInfo_spliter {POSITION: relative; TOP: 10px}
                          UNKNOWN {POSITION: relative; TOP: 0px}
                          UNKNOWN {POSITION: relative; TOP: 30px}
       .style1
       {
           width: 362px;
       }
   </style>

   <script type="text/javascript">
    //$(document).ready(function () {
    //    $('#slider').nivoSlider();
    //});
    $(document).ready(function () {
        $("#AcadeInfoList").KandyTabs();
    });
    </script>
<!--模块开始--></div></div>
<div id="frame-side" class="yui3-u">
<div id="placehoder"></div>
  &nbsp;
  <ul>
  <li><a href="#" target="_self">我与登山</a></li> 
  <li><a target="_blank"  href="Page3_2.aspx">登陆</a>|<a target="_blank"  href="Page3_2.aspx">注册</a></li> 
  <li><a href="Google.aspx" target="_blank">google路线</a></li> 
  <li><a href="#" target="_self">前辈传承</a></li> 
  <li><a href="#" target="_self">山队论坛</a></li> 
  </ul>
</div>
</div>
</div>
<div id="frame-bottom"><link rel="stylesheet" type="text/css" href="DDDS/Footer.css">
<div id="frame-bottom-wrapper">
<div id="frame-bottom-logo"></div>
<div id="frame-bottom-copyright">
   <h1>版权所有@中国地质大学（北京）登山攀岩俱乐部  地址：北京市海淀区学院路29号中国地质大学（北京） 邮编：100083</h1> 
</div>
</div>
</div>
    </div>
    </form>
</body>
</html>
