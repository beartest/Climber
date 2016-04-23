using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Climber
{
    public partial class Admin3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DateLabel.Text = DateTime.Now.ToString("D");
                this.WeekLabel.Text = DateTime.Now.ToString("dddd");
                submit.Attributes.Add("onclick", "return confirm('确定删除？')");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button b1 = (Button)sender;
            switch (b1.ID)
            {
                case "Button1":
                    Response.Redirect("Admin9.aspx?&id=0");
                    break;
                case "Button2":
                    Response.Redirect("Admin8.aspx?&id=0");
                    break;
                case "Button3":
                    Response.Redirect("Admin7.aspx?&id=0");
                    break;
                case "Button4":
                    Response.Redirect("Admin6.aspx?&id=0");
                    break;
                case "Button5":
                    Response.Redirect("Admin5.aspx?&id=0");
                    break;
                case "Button6":
                    Response.Redirect("Admin4.aspx?&id=0");
                    break;
                case "Button7":
                    Response.Redirect("Admin3.aspx?&id=0");
                    break;
                case "Button8":
                    Response.Redirect("Admin2.aspx?&id=0");
                    break;
                case "Button9":
                    Response.Redirect("Admin1.aspx?&id=0");
                    break;
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string sqlStr1 = "if exists ( select * from 注册表 where 登录号 = '" + this.xuehao.Text + "' )select '1' else select '0'";
            int number1 = LinkDB.executeSql(sqlStr1);
            if (number1 == 1)
            {
                string sql = "update 注册表 set 密码='" + this.xuehao.Text + "'where 登录号='" + this.xuehao.Text + "'";
                LinkDB.ExecuteSql(sql);
                if (LinkDB.error == "")
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码重置成功');</script>");
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码重置失败(" + LinkDB.error + ")');</script>");
                    LinkDB.error = "";
                }
            }
            else 
            {
                string sqlStr2 = "if exists ( select * from 人员表 where 学号 = '" + this.xuehao.Text + "' )select '1' else select '0'";
                int number2 = LinkDB.executeSql(sqlStr2);
                if (number2 == 1)
                {
                    LinkDB.ExecuteSql("insert into 注册表 (登录号,密码) values ('" + this.xuehao.Text + "','" + this.xuehao.Text + "')");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('学号错误');</script>");
                }
                
            }
        }
    }
}