<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page2_3.aspx.cs" Inherits="Climber.Page2_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>内容显示</title>
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
            <td style="VERTICAL-ALIGN: top">
                <br/><img alt="中国地质大学（北京）登山攀岩俱乐部" src="images/top.jpg"/></td>
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
<div  id="navbar-left"></div>
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
<!--不同内容-->
<div>
 <table id="Table1" runat="server" align="center" 
        style="background-color:#DFFFFF; height: 186px;">
    <tr>
      <td width="220" align="center" valign="top"><img alt="中国地质大学（北京）登山攀岩俱乐部" src="images/left.jpg"/></td> 
      <td width="770" align="center" valign="top">
        <table>
        <tr>
          <td style="height:15px" align="center"></td>
        </tr>
          <tr>
            <td style="height:15px; font-family: 黑体;" align="center"> 
                   <asp:TextBox ID="Ttitle" runat="server" BorderWidth="0px" BackColor="#DFFFFF" Width="708px" 
                       Font-Bold="False" Font-Size="X-Large" Height="30px" ForeColor="Black" 
                       ReadOnly="True" Font-Names="黑体"></asp:TextBox></font>
            </td>
          </tr> 
          <tr>
           <td>
             <table align="left" style="height:123px">
               <tr>
                 <td align="center" style="width:70px"> 
                   <table style="width:740px">
                    <tr>
                     <td style="width:10px"></td>
                     <td align="left" >
                     <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate >
                           <%#DataBinder.Eval(Container.DataItem,"内容").ToString()%>
                        </ItemTemplate>
                     </asp:Repeater>
                     </td>
                    </tr>
                   </table>
                   
                 </td> 
               </tr> 
             </table>  
           </td> 
          </tr> 
        </table> 
      </td> 
    </tr>  
  </table>
</div>
         
  
<!--内容结束-->
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
