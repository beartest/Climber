<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page3_1.aspx.cs" Inherits="Climber.Page3_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>���ֲ�����</title>
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
               <br/><img alt="�й����ʴ�ѧ����������ɽ���Ҿ��ֲ�" src="images/top.jpg"/></td>
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
<table id="Table1" runat="server" align="center" 
        style="background-color:#DFFFFF; height: 186px;">
    <tr>
      <td width="220" align="center" valign="top"><img alt="�й����ʴ�ѧ����������ɽ���Ҿ��ֲ�" src="images/left.jpg"/></td> 
      <td width="770" align="center" valign="top">
        <table>
        <tr>
          <td style="height:15px" align="center"></td>
        </tr>
          <tr>
            <td style="height:15px; font-family: ����;" align="center"> 
                   <asp:TextBox ID="Ttitle" runat="server" BorderWidth="0px" BackColor="#DFFFFF" Width="704px" 
                       Font-Bold="False" Font-Size="X-Large" Height="30px" ForeColor="#000099" 
                       ReadOnly="True" Font-Names="����" style="text-align:center"></asp:TextBox>
            </td>
          </tr> 
          <tr>
           <td>
             <table align="left" style="height:123px">
          <tr>
             <td style="height:11px" align="center"></td>
          </tr>
               <tr>
                 <td style="height:15px" align="center"> 
                   <asp:TextBox ID="Ttime" runat="server" BorderWidth="0px" BackColor="#DFFFFF" 
                         Font-Size="small" ForeColor="#666666" Width="679px" Height="39px" 
                         ReadOnly="True"></asp:TextBox>
                 </td> 
               </tr> 
               <tr>
               
                 <td style="height:15px" align="center" > 
                     <asp:Image ID="Image1" runat="server" />
                 </td> 
                 <tr><td style="height:20px"></td></tr>
               </tr> 
               <tr>
                 <td align="center" style="width:70px"> 
                   <table style="width:740px">
                    <tr>
                     <td style="width:10px"></td>
                     <td align="left" >
                     <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate >
                           <%#DataBinder.Eval(Container.DataItem,"��������").ToString()%>
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
