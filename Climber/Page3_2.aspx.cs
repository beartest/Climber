using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Climber
{
    public partial class Page3_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string postType = Request.QueryString["s"];
            if (postType != null && postType == "registration")
            {
                string name = Request.Form["name"];
                string password = Request.Form["password"];
                string sqlStr1 = "if exists ( select * from 注册表 where 登录号 = '" + name + "' )select '1' else select '0'";
                int number1 = LinkDB.executeSql(sqlStr1);
                string sqlStr2 = "if exists ( select * from 注册表 where 登录号 = '" + name + "' and 密码 = '" + password + "' )select '1' else select '0'";
                int number2 = LinkDB.executeSql(sqlStr2);
                if (number1 == 1)
                {
                    if (number2 == 1)
                    {
                        if (name == "admin")
                        {
                            Response.Redirect("Admin/Admin9.aspx?&id=0");
                        }
                        else
                        {
                            Response.Redirect("Admin/Admin0.aspx?&id=" + name);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码错误');</script>");
                    }
                }
                else
                {
                    int number3 = LinkDB.executeSql("if exists ( select * from 人员表 where 学号 = '" + name + "' )select '1' else select '0'");
                    if (number3 == 1)
                    {
                        LinkDB.ExecuteSql("insert into 注册表 (登录号,密码) values ('" + name + "','" + name + "')");
                        if (name == password)
                        {
                            Response.Redirect("Admin/Admin0.aspx?&id=" + name);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('初次登录时密码同用户名');</script>");
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('用户名错误');</script>");
                    }
                }
            }
        }
    }
}