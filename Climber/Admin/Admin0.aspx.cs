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
    public partial class Admin0 : System.Web.UI.Page
    {
        static string xuehao = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //上页传参学号
                //string SN = Request.QueryString["id"];
                string SN = "1004105200";
                //个人信息数据绑定
                string sql1 = "select * from 人员表 where 学号='" + SN + "'";
                DataSet dataset1 = LinkDB.dataSet(sql1);
                Repeater1.DataSource = dataset1.Tables[0].DefaultView;
                Repeater1.DataBind();
                //部门信息数据绑定
                string sql2 = "select * from 部门表";
                DataSet dataset2 = LinkDB.dataSet(sql2);
                Repeater2_1.DataSource = dataset2.Tables[0].DefaultView;
                Repeater2_1.DataBind();
                Repeater2_2.DataSource = dataset2.Tables[0].DefaultView;
                Repeater2_2.DataBind();
                Repeater2_3.DataSource = dataset2.Tables[0].DefaultView;
                Repeater2_3.DataBind();
                //活动信息数据绑定
                string sql3 = "select * from 活动表";
                DataSet dataset3 = LinkDB.dataSet(sql3);
                Repeater3.DataSource = dataset3.Tables[0].DefaultView;
                Repeater3.DataBind();
                //欢迎字样数据绑定
                SqlDataReader dr = LinkDB.Reader("select 昵称 from 注册表 where 登录号='" + SN + "'");
                dr.Read();
                string DR = (string)dr["昵称"];
                dr.Close();
                Label1.Text = "您好," + DR + "(" + SN + "),欢迎登录";
            }
            else
            {
                string[] s1=Label1.Text.Split('(');
                string[] s2 = s1[1].Split(')');
                xuehao = s2[0];
                //表单提交
                string postType = Request.QueryString["s"];
                if (postType != null)
                {
                    string old = Request.Form["old"];
                    string new1 = Request.Form["new1"];
                    string new2 = Request.Form["new2"];
                    if (postType == "withname")
                    {
                        string name = Request.Form["name"];
                        LinkDB.ExecuteSql("update 注册表 set 密码='" + new1 + "' , 昵称='" + name + "' where 登录号='" + xuehao + "'");
                        Label1.Text = "您好," + name +"(" + s1[1];
                    }
                    if (postType == "withoutname")
                    {
                        LinkDB.ExecuteSql("update 注册表 set 密码='" + new1 + "'where 登录号='" + xuehao + "'");
                    }                    
                    if (LinkDB.error != "")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码更新失败(" + LinkDB.error + ")');</script>");
                        LinkDB.error = "";
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码更改成功');</script>");
                    }
                }
            }
        }
    }
}