<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Page2_2.aspx.cs" Inherits="Climber.Page2_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>内容简介</title>
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
       <table border="1" style="border-color: #336699; width:974px; height:270x">
          <tr>
             <td align="center">
               <table style="height:210px; width:365px"> 
                 <tr>
                   <td style="width:350px"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/one.jpg"/></td>
                 </tr>
               </table>  
             </td>
          </tr> 
       </table>
       <table style="width:974px; height:270x">
          <tr>
             <td style="width:970px">
               <table align="center">
                  <tr>
                    <td>
                       <table>
                         <tr>
                             <td align ="left" style="width:250px" ><br/><asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Larger"></asp:HyperLink></td>
                         </tr> 
                         <tr>
                           <td align ="center" style="width:250px" valign="top" >
                               <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/暂时.jpg" Width="103px" Height="103px"/>
                             </td>
                           <td>
                             <table>
                               <tr>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Label" width="720px" ></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                 <td>
                                   <table>
                                     <tr>
                                       <td width="360px">
                                     <asp:repeater ID="repeater1" runat="server" 
                                         onitemcommand="repeater1_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                       </headertemplate>
                                       <itemtemplate>
                                         <tr>
                                            <font color="black">
                                               <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                               <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
                                            </font>
                                         </tr> 
                                        </itemtemplate>
                                       <FooterTemplate>
                                        </table>
                                      </FooterTemplate>
                                    </asp:repeater>
                                 </td> 
                                 <td width="360px">
                                   <asp:repeater ID="repeater2" runat="server" onitemcommand="repeater2_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                   <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
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
                                 </td>
                               </tr>
                             </table>
                           </td>
                         </tr>
                       </table>
                        <br/>
                        <br/>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <table>
                         <tr>
                             <td align ="left" style="width:250px" ><asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Larger"></asp:HyperLink></td>
                         </tr> 
                         <tr>
                           <td align ="center" style="width:250px" valign="top" >
                               <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/报告会.jpg" Height="100px" 
                                   Width="100px" />
                             </td>
                           <td>
                             <table>
                               <tr>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Label" width="690px" ></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                 <td>
                                 <table>
                                  <tr>
                                   <td width="360px">
                                     <asp:repeater ID="repeater3" runat="server" 
                                         onitemcommand="repeater1_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
                                                 </font>
                                               </tr> 
                                            </itemtemplate>
                                          <FooterTemplate>
                                        </table>
                                      </FooterTemplate>
                                    </asp:repeater>
                                 </td> 
                                     
                                 <td width="360px">
                                 <asp:repeater ID="repeater4" runat="server" onitemcommand="repeater2_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
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
                                 </td>
                               </tr>
                             </table>
                           </td>
                         </tr>
                       </table>
                        <br />
                        <br />
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <table>
                         <tr>
                             <td align ="left" style="width:250px" ><asp:HyperLink ID="HyperLink3" runat="server" Font-Size="Larger"></asp:HyperLink></td>
                         </tr> 
                         <tr>
                           <td align ="center" style="width:250px" valign="top" >
                               <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/宣传部.jpg" Height="103px" 
                                   Width="103px" />
                             </td>
                           <td>
                             <table>
                               <tr>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"  width="690px" ></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                 <td>
                                   <table>
                                     <tr>
                                       <td width="360px">
                                     <asp:repeater ID="repeater5" runat="server" 
                                         onitemcommand="repeater1_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 23 ? Eval("内容").ToString().Substring(0, 23) : Eval("内容").ToString()%></a></td>   
                                                 </font>
                                               </tr> 
                                            </itemtemplate>
                                          <FooterTemplate>
                                        </table>
                                      </FooterTemplate>
                                    </asp:repeater>
                                 </td> 
                                     
                                 <td width="360px">
                                 <asp:repeater ID="repeater6" runat="server" onitemcommand="repeater2_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 23 ? Eval("内容").ToString().Substring(0, 23) : Eval("内容").ToString()%></a></td>   
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
                                 </td>
                               </tr>
                             </table>
                           </td>
                         </tr>
                       </table>
                       <br />
                       <br />
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <table>
                         <tr>
                             <td align ="left" style="width:250px" ><asp:HyperLink ID="HyperLink4" runat="server" Font-Size="Larger"></asp:HyperLink></td>
                         </tr> 
                         <tr>
                           <td align ="center" valign="top" style="width:250px" >
                               <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/训练部.jpg" Height="103px" 
                                   Width="103px"  />
                             </td>
                           <td>
                             <table>
                               <tr>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Label" width="690px" ></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                 <td>
                                  <table>
                                    <tr>
                                     <td>
                                     <table>
                                       <tr>
                                        <td width="360px">
                                     <asp:repeater ID="repeater7" runat="server" 
                                         onitemcommand="repeater1_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 23) : Eval("内容").ToString()%></a></td>   
                                                 </font>
                                               </tr> 
                                            </itemtemplate>
                                          <FooterTemplate>
                                        </table>
                                      </FooterTemplate>
                                    </asp:repeater>
                                 </td> 
                                     
                                 <td width="360px">
                                 <asp:repeater ID="repeater8" runat="server" onitemcommand="repeater2_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
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
                                   </td>
                                   </tr>
                                  </table>
                                 </td>
                               </tr>
                             </table>
                           </td>
                         </tr>
                       </table>
                       <br />
                       <br />
                    </td>
                  </tr>

                  <tr>
                    <td>
                      <table>
                         <tr>
                             <td align ="left" style="width:250px" ><asp:HyperLink ID="HyperLink5" runat="server" Font-Size="Larger"></asp:HyperLink></td>
                         </tr> 
                         <tr>
                           <td align ="center" valign="top" style="width:250px" >
                               <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/岩场管理部.jpg" Height="103px" 
                                   Width="103px"  />
                             </td>
                           <td>
                             <table>
                               <tr>
                                 <td>
                                     &nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Label" width="690px" ></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                 <td>
                                 <table>
                                   <tr>
                                    <td width="360px">
                                     <asp:repeater ID="repeater9" runat="server" 
                                         onitemcommand="repeater1_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
                                                 </font>
                                               </tr> 
                                            </itemtemplate>
                                          <FooterTemplate>
                                        </table>
                                      </FooterTemplate>
                                    </asp:repeater>
                                 </td> 
                                     
                                 <td width="360px">
                                 <asp:repeater ID="repeater10" runat="server" onitemcommand="repeater2_ItemCommand">
                                       <headertemplate>
                                         <table style="table-layout:auto">
                                           </headertemplate>
                                             <itemtemplate>
                                               <tr>
                                                 <font color="black">
                                                   <td align="right" style="width: 35px"><img border="0" src="Images/index_001.gif" width="5" height="7" alt=""></td> 
                                                     <td style="width: 325px"><%#DataBinder.Eval(Container.DataItem, "内容").ToString().Length > 28 ? Eval("内容").ToString().Substring(0, 28) : Eval("内容").ToString()%></a></td>   
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
