﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page3_2.aspx.cs" Inherits="Climber.Page3_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登陆界面</title>
    <style type="text/css">
        #ibanner
        {
            position: relative;
            width: 450px;
            height: 450px;
            overflow: hidden;
            margin: 20px 0 20px 300px;
        }
        #ibanner_pic
        {
        }
        #ibanner_pic a
        {
            position: absolute;
            top: 0;
            display: block;
            width: 450px;
            height: 450px;
            overflow: hidden;
        }
        #ibanner_btn
        {
            position: absolute;
            z-index: 9999;
            right: 5px;
            bottom: 5px;
            font-weight: 700;
            font-family: Arial;
        }
        #ibanner_btn span
        {
            display: block;
            float: left;
            margin-left: 4px;
            padding: 0 5px;
            background: #000;
            cursor: pointer;
        }
        #ibanner_btn .normal
        {
            height: 20px;
            margin-top: 8px;
            border: 1px solid #999;
            color: #999;
            font-size: 16px;
            line-height: 20px;
        }
        #ibanner_btn .current
        {
            height: 28px;
            border: 1px solid #FF5300;
            color: #FF5300;
            font-size: 28px;
            line-height: 28px;
        }
    </style>
    <script type="text/javascript">
        function $(id) { return document.getElementById(id); }
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function () {
                    oldonload();
                    func();
                }
            }
        }
        function addBtn() {
            if (!$('ibanner') || !$('ibanner_pic')) return;
            var picList = $('ibanner_pic').getElementsByTagName('a');
            if (picList.length == 0) return;
            var btnBox = document.createElement('div');
            btnBox.setAttribute('id', 'ibanner_btn');
            var SpanBox = '';
            for (var i = 1; i <= picList.length; i++) {
                var spanList = '<span class="normal">' + i + '</span>';
                SpanBox += spanList;
            }
            btnBox.innerHTML = SpanBox;
            $('ibanner').appendChild(btnBox);
            $('ibanner_btn').getElementsByTagName('span')[0].className = 'current';
            for (var m = 0; m < picList.length; m++) {
                var attributeValue = 'picLi_' + m
                picList[m].setAttribute('id', attributeValue);
            }
        }
        function moveElement(elementID, final_x, final_y, interval) {
            if (!document.getElementById) return false;
            if (!document.getElementById(elementID)) return false;
            var elem = document.getElementById(elementID);
            if (elem.movement) {
                clearTimeout(elem.movement);
            }
            if (!elem.style.left) {
                elem.style.left = "0px";
            }
            if (!elem.style.top) {
                elem.style.top = "0px";
            }
            var xpos = parseInt(elem.style.left);
            var ypos = parseInt(elem.style.top);
            if (xpos == final_x && ypos == final_y) {
                moveing = false;
                return true;
            }
            if (xpos < final_x) {
                var dist = Math.ceil((final_x - xpos) / 10);
                xpos = xpos + dist;
            }
            if (xpos > final_x) {
                var dist = Math.ceil((xpos - final_x) / 10);
                xpos = xpos - dist;
            }
            if (ypos < final_y) {
                var dist = Math.ceil((final_y - ypos) / 10);
                ypos = ypos + dist;
            }
            if (ypos > final_y) {
                var dist = Math.ceil((ypos - final_y) / 10);
                ypos = ypos - dist;
            }
            elem.style.left = xpos + "px";
            elem.style.top = ypos + "px";
            var repeat = "moveElement('" + elementID + "'," + final_x + "," + final_y + "," + interval + ")";
            elem.movement = setTimeout(repeat, interval);
        }
        function classNormal() {
            var btnList = $('ibanner_btn').getElementsByTagName('span');
            for (var i = 0; i < btnList.length; i++) {
                btnList[i].className = 'normal';
            }
        }
        function picZ() {
            var picList = $('ibanner_pic').getElementsByTagName('a');
            for (var i = 0; i < picList.length; i++) {
                picList[i].style.zIndex = '1';
            }
        }
        var autoKey = false;
        function iBanner() {
            if (!$('ibanner') || !$('ibanner_pic') || !$('ibanner_btn')) return;
            $('ibanner').onmouseover = function () { autoKey = true };
            $('ibanner').onmouseout = function () { autoKey = false };

            var btnList = $('ibanner_btn').getElementsByTagName('span');
            var picList = $('ibanner_pic').getElementsByTagName('a');
            if (picList.length == 1) return;
            picList[0].style.zIndex = '2';
            for (var m = 0; m < btnList.length; m++) {
                btnList[m].onmouseover = function () {
                    for (var n = 0; n < btnList.length; n++) {
                        if (btnList[n].className == 'current') {
                            var currentNum = n;
                        }
                    }
                    classNormal();
                    picZ();
                    this.className = 'current';
                    picList[currentNum].style.zIndex = '2';
                    var z = this.childNodes[0].nodeValue - 1;
                    picList[z].style.zIndex = '3';
                    if (currentNum != z) {
                        picList[z].style.left = '650px';
                        moveElement('picLi_' + z, 0, 0, 10);
                    }
                }
            }
        }
        setInterval('autoBanner()', 5000);
        function autoBanner() {
            if (!$('ibanner') || !$('ibanner_pic') || !$('ibanner_btn') || autoKey) return;
            var btnList = $('ibanner_btn').getElementsByTagName('span');
            var picList = $('ibanner_pic').getElementsByTagName('a');
            if (picList.length == 1) return;
            for (var i = 0; i < btnList.length; i++) {
                if (btnList[i].className == 'current') {
                    var currentNum = i;
                }
            }
            if (currentNum == (picList.length - 1)) {
                classNormal();
                picZ();
                btnList[0].className = 'current';
                picList[currentNum].style.zIndex = '2';
                picList[0].style.zIndex = '3';
                picList[0].style.left = '650px';
                moveElement('picLi_0', 0, 0, 10);
            } else {
                classNormal();
                picZ();
                var nextNum = currentNum + 1;
                btnList[nextNum].className = 'current';
                picList[currentNum].style.zIndex = '2';
                picList[nextNum].style.zIndex = '3';
                picList[nextNum].style.left = '650px';
                moveElement('picLi_' + nextNum, 0, 0, 10);
            }
        }
        addLoadEvent(addBtn);
        addLoadEvent(iBanner);
    </script>
    <script type="text/javascript">
        //全登陆不允许iframe嵌入 
        if (window.top !== window.self) { window.top.location = window.location; }
    </script>
    <script type="text/javascript">
        function buttonclick() {
            var name = document.getElementById("Text1").value;
            var password = document.getElementById("Password1").value;
            if (name == '' && password == '') {
                alert('请输入登录号和密码');
            }
            else if (name == '') {
                alert('请输入登录号');
            }
            else if (password == '') {
                alert('请输入密码');
            }
            else {
                document.getElementById("form1").action = "Page3_2.aspx?s=registration";
                document.getElementById("form1").submit();
            }
        }	
    </script>
    <link rel="stylesheet" type="text/css" href="css/page.css" />
    <link rel="stylesheet" type="text/css" href="buttons/buttons.css" />
</head>
<body>
    <table>
        <tr>
            <div style="margin: 20px 0px 0px 120px;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/title.jpg" />
                <hr style="width: 1030px" />
            </div>
        </tr>
        <tr>
            <td>
                <div id="ibanner" style="margin: 20px 0px 0px 200px;">
                    <div id="ibanner_pic">
                        <a>
                            <img src="/img/a1.jpg" /></a> <a>
                                <img src="/img/a2.jpg" /></a> <a>
                                    <img src="/img/a3.jpg" /></a> <a>
                                        <img src="/img/a4.jpg" /></a>
                    </div>
                </div>
            </td>
            <td>
                <div id="buttonContainer" style="margin: 0px 100px 0px 100px;">
                    <form id="form1" runat="server">
                    &nbsp;&nbsp;&nbsp;&nbsp; 登录名&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="Text1" name="name" type="text" style="height: 25px; width: 150px; margin: 15px 15px 0px 0px" />
                    <br>
                    &nbsp;&nbsp;&nbsp;&nbsp; 密&nbsp;&nbsp;&nbsp;&nbsp; 码&nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="Password1" name="password" type="password" style="height: 25px; width: 150px; margin: 15px 15px 0px 0px;" />
                    <br>
                    <a href="#">忘记密码</a><a href="#">注册</a> <a href="#" class="button blue small" onclick="buttonclick() ">
                        登录</a>
                    </form>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>

