<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Google.aspx.cs" Inherits="Climber.Google" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Google Earth Show Mountain</title>
    <script type="text/javascript" src="http://www.google.com/jsapi?key=AIzaSyAWlnvBrVPbilPFnJ5Qep1xQGbSxnTHEQ4"></script>
    <style type="text/css">
<!--
body{margin:0; padding:0; border:0; background-color:#414b52; font-family:Arial, Helvetica, sans-serif,"宋体" text-align:center;}
h1{color: #fff;}
.rolinList{width:302px; height:auto; margin:0px auto 0 auto; text-align:left; padding: 10px;}
.rolinList li{padding:0; border:0;list-style:none;margin-bottom:1px; border:0px solid #DADADA; margin: 0 0 5px; background-color:#20282d;}
.rolinList li h5{ margin:0; border:0;padding-left:20px;width:245px; height:30px; line-height:30px;  cursor:pointer; font-weight: bold; text-shadow: 1px 1px 

#1f272b; color: #9fa8b0; border: 1px solid #1c252b; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; background: #515B62;background: 

-moz-linear-gradient(top, #515B62 3%, #444E55 5%, #394147 100%); background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#515B62), color-

stop(5%,#444E55), color-stop(100%,#394147)); box-shadow: 1px 1px 1px rgba(0,0,0,0.2); -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.2); -webkit-box-shadow: 1px 

1px 1px rgba(0,0,0,0.2); float:left; }
.rolinList li h4{margin: 0px 1px 0px 1px; width:30px; height:30px; padding-left:0px; line-height:30px; cursor:pointer; font-weight: bold; text-shadow: 1px 

1px #1f272b; color:#9fa8b0; border: 1px solid #1c252b; border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px; background: #515B62; 

background: -moz-linear-gradient(top, #515B62 3%, #444E55 5%, #394147 100%); background: -webkit-gradient(linear, left top, left bottom, color-stop

(3%,#515B62), color-stop(5%,#444E55), color-stop(100%,#394147)); box-shadow: 1px 1px 1px rgba(0,0,0,0.2); -moz-box-shadow: 1px 1px 1px rgba(0,0,0,0.2); -

webkit-box-shadow: 1px 1px 1px rgba(0,0,0,0.2); float:left; text-align:center;}
.rolinList li:last-child { margin: 0; }
.content{ height:150px; width:300px;color: #fff; background: #848E97; background: -moz-linear-gradient(top, #848E97 3%, #77848C 4%, #636F76 100%); 

background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#848E97), color-stop(4%,#77848C), color-stop(100%,#636F76)); border: 1px solid 

#1c252b; border-radius: 3px; -moz-border-radius: 3px; -webkit-border-radius: 3px;}
.content p{ margin:12px; padding:0; border:0; font-family:Arial, Helvetica, sans-serif,"宋体"; font-size:12px}
-->
</style>
    <script type="text/javascript">
        window.onload = function () {
            rolinTab("rolin");
            init();
        }

        //菜单部分
        function rolinTab(obj) {
            var list = $(obj).getElementsByTagName("LI");
            var state = { show: false, hidden: false, showObj: false };
            for (var i = 0; i < list.length; i++) {
                var tmp = new rolinItem(list[i], state);
                //if (i == 0) tmp.pShow();
            }
        }
        function rolinItem(obj, state) {
            var speed = 0.0999;
            var range = 1;
            var interval;
            var tarH;
            var tar = this;
            var head = getFirstChild(obj);
            var button = getNextChild(head);
            var content = getNextChild(button);
            var isOpen = false;
            this.pHidden = function () {
                if (isOpen) hidden();
            }
            this.pShow = show;
            var baseH = content.offsetHeight;
            content.style.display = "none";
            var isOpen = false;
            head.onmouseover = mouseover;
            head.onmouseout = mouseout;
            head.onclick = function () {
                this.style.color = "#fff";
                this.style.background = "#5F6B72";
                this.style.background = "-moz-linear-gradient(top, #5F6B72 3%, #56646C 4%, #4D5A62 50%, #434D54 100%)";
                this.style.background = " -webkit-gradient(linear, left top, left bottom, color-stop(3%,#5F6B72), color-stop(4%,#56646C), color-stop(50%,#4D5A62), color-stop(100%,#434D54))";
                //此处添加KML读取
                TrunIntoMountain(head);
            }
            button.onmouseover = mouseover;
            button.onmouseout = mouseout;
            button.onclick = function () {
                this.style.color = "#fff";
                this.style.background = "#5F6B72";
                this.style.background = "-moz-linear-gradient(top, #5F6B72 3%, #56646C 4%, #4D5A62 50%, #434D54 100%)";
                this.style.background = " -webkit-gradient(linear, left top, left bottom, color-stop(3%,#5F6B72), color-stop(4%,#56646C), color-stop(50%,#4D5A62), color-stop(100%,#434D54))";
                if (!state.show && !state.hidden) {
                    if (!isOpen) {
                        head.onmouseout = null;
                        show();
                    } else {
                        hidden();
                    }
                }
            }
            function mouseover() {
                this.style.color = "#fff";
                this.style.background = "#5F6B72";
                this.style.background = "-moz-linear-gradient(top, #5F6B72 3%, #56646C 4%, #4D5A62 50%, #434D54 100%)";
                this.style.background = " -webkit-gradient(linear, left top, left bottom, color-stop(3%,#5F6B72), color-stop(4%,#56646C), color-stop(50%,#4D5A62), color-stop(100%,#434D54))";
            }
            function mouseout() {
                this.style.color = "#9fa8b0";
                this.style.background = "#515B62";
                this.style.background = "-moz-linear-gradient(top, #515B62 3%, #444E55 5%, #394147 100%)";
                this.style.background = "-webkit-gradient(linear, left top, left bottom, color-stop(3%,#515B62), color-stop(5%,#444E55), color-stop(100%,#394147))";
            }
            function show() {
                state.show = true;
                if (state.openObj && state.openObj != tar) {
                    state.openObj.pHidden();
                }
                content.style.height = "0px";
                content.style.display = "block";
                content.style.overflow = "hidden";
                state.openObj = tar;
                tarH = baseH;
                interval = setInterval(move, 10);
            }
            function showS() {
                isOpen = true;
                state.show = false;
            }
            function hidden() {
                state.hidden = true;
                tarH = 0;
                interval = setInterval(move, 10);
            }
            function hiddenS() {
                head.style.borderBottom = "none";
                head.onmouseout = mouseout;
                head.onmouseout();
                content.style.display = "none";
                isOpen = false;
                state.hidden = false;
            }
            function move() {
                var dist = (tarH - content.style.height.pxToNum()) * speed;
                if (Math.abs(dist) < 1) dist = dist > 0 ? 1 : -1;
                content.style.height = (content.style.height.pxToNum() + dist) + "px";
                if (Math.abs(content.style.height.pxToNum() - tarH) <= range) {
                    clearInterval(interval);
                    content.style.height = tarH + "px";
                    if (tarH != 0) {
                        showS()
                    } else {
                        hiddenS();
                    }
                }
            }
        }
        var $ = function ($) { return document.getElementById($) };
        String.prototype.pxToNum = function () { return Number(this.replace("px", "")) }
        function getFirstChild(obj) {
            var result = obj.firstChild;
            while (!result.tagName) {
                result = result.nextSibling;
            }
            return result;
        }
        function getNextChild(obj) {
            var result = obj.nextSibling;
            while (!result.tagName) {
                result = result.nextSibling;
            }
            return result;
        }

        //google部分
        google.load("earth", "1");
        var ge = null;
        var mountainLink = null;
        var regionLink = null;
        function init() {
            google.earth.setLanguage('zh_CN');
            google.earth.createInstance("map3d", initCallback, failureCallback);
        }
        function initCallback(object) {
            ge = object;
            ge.getLayerRoot().enableLayerById(ge.LAYER_BORDERS, false); /*边界*/
            ge.getLayerRoot().enableLayerById(ge.LAYER_BUILDINGS, true); /*建筑*/
            ge.getLayerRoot().enableLayerById(ge.LAYER_BUILDINGS_LOW_RESOLUTION, true); /*低分辨路下显示的建筑*/
            ge.getLayerRoot().enableLayerById(ge.LAYER_ROADS, true); /*道路*/
            ge.getLayerRoot().enableLayerById(ge.LAYER_TERRAIN, true); /*地形*/
            ge.getLayerRoot().enableLayerById(ge.LAYER_TREES, true); /*树林*/
            ge.getNavigationControl().setVisibility(ge.VISIBILITY_AUTO); /*导航条*/
            ge.getWindow().setVisibility(true);

            /*初始显示：定位到中国*/
            var la = ge.createLookAt('');
            la.set(33, 105, 46, 0, ge.ALTITUDE_RELATIVE_TO_GROUND, 0, 4000000);
            ge.getView().setAbstractView(la);

            // var kmlName = '中国省界.kmz'
            var link = ge.createLink('');
            var href = 'http://WIN-TEQBPUNT5PE/Climber/'+'中国各区KMZ/中国省界.kmz';
            link.setHref(href);
            var networkLink = ge.createNetworkLink('');
            networkLink.set(link, false, false);
            ge.getFeatures().appendChild(networkLink);

            link = ge.createLink('');
            href = 'http://WIN-TEQBPUNT5PE/Climber/' + '中国各区KMZ/中国.kmz';
            link.setHref(href);
            regionLink = ge.createNetworkLink('');
            regionLink.set(link, false, false);
            ge.getFeatures().appendChild(regionLink);
        }

        function failureCallback(object) {
            alert('load failed');
        }

        function TrunIntoMountain(object) {
            if (mountainLink != null) {
                ge.getFeatures().removeChild(mountainLink);
            }
            var link = ge.createLink('');
            var href = 'http://WIN-TEQBPUNT5PE/Climber/'+'山峰KML/' + object.innerText + '.kml';
            link.setHref(href);
            mountainLink = ge.createNetworkLink('');
            mountainLink.set(link, true, true); /*networkLink.setLink(link);*/
            ge.getFeatures().appendChild(mountainLink);
        }

        function TrunIntoRegion() {
            ge.getFeatures().removeChild(regionLink);
            var selText = document.getElementById("DropDownList2").options[document.getElementById("DropDownList2").selectedIndex].text;
            var link = ge.createLink('');
            var href = 'http://WIN-TEQBPUNT5PE/Climber/' +'中国各区KMZ/'+ selText + '.kmz';
            link.setHref(href);
            regionLink = ge.createNetworkLink('');
            regionLink.set(link, true, true); /*networkLink.setLink(link);*/
            ge.getFeatures().appendChild(regionLink);
            rolinTab("rolin");
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    <h1 align="center">
        Google Earth Show Mountain
    </h1>
    <table align="center">
        <tr>
            <td valign="top">
                <div id='map3d' style='border: 1px solid silver; height: 480px; width: 640px'>
                </div>
            </td>
            <td valign="top" style="margin: 0px; border: 0; background-color: #20282d; background: -moz-linear-gradient(top, #20282D 3%, #252E34 51%, #222A30 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(3%,#20282D), color-stop(51%,#252E34), color-stop(100%,#222A30));
                border-radius: 5px;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ul style="border: thin outset #515B62; font-size: 13px; font-weight: bold; color: #C0C0C0;
                            font-family: 幼圆; width: 280px; text-align: center; height: auto; margin: 10px auto 0 auto;
                            padding: 0px 5px 0px 5px; border-radius: 5px; text-align: center">
                            <p>
                                山峰名称：
                                <asp:TextBox ID="TextBox1" runat="server" Height="15px" Width="125px"></asp:TextBox>
                            </p>
                            <p>
                                海拔高度：
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="130px">
                                    <asp:ListItem Value="全部">全部</asp:ListItem>
                                    <asp:ListItem Value="<2km">小于2km</asp:ListItem>
                                    <asp:ListItem Value="2km-4km">2km-4km</asp:ListItem>
                                    <asp:ListItem Value="4km-6km">4km-6km</asp:ListItem>
                                    <asp:ListItem Value=">6km">大于6km</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <p>
                                所在地区：
                                <asp:DropDownList ID="DropDownList2" runat="server" Height="20px" Width="130px">
                                    <asp:ListItem Value="中国">中国</asp:ListItem>
                                    <asp:ListItem Value="华东地区">华东地区</asp:ListItem>
                                    <asp:ListItem Value="华南地区">华南地区</asp:ListItem>
                                    <asp:ListItem Value="华北地区">华北地区</asp:ListItem>
                                    <asp:ListItem Value="西北地区">西北地区</asp:ListItem>
                                    <asp:ListItem Value="西南地区">西南地区</asp:ListItem>
                                    <asp:ListItem Value="东北地区">东北地区</asp:ListItem>
                                    <asp:ListItem Value="港澳台地区">港澳台地区</asp:ListItem>
                                </asp:DropDownList>
                            </p>
                            <p>
                                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                            </p>
                        </ul>
                        <ul class="rolinList" id="rolin">
                            <asp:Repeater ID="RepeaterBind" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <h5>
                                            <%#DataBinder.Eval(Container.DataItem,"山峰名称") %>
                                        </h5>
                                        <h4>
                                            ▼
                                        </h4>
                                        <div class="content">
                                            <p>
                                                <%#DataBinder.Eval(Container.DataItem,"山峰简介") %>
                                            </p>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
