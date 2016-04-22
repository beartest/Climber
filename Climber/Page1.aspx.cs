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
    public partial class Page1 : System.Web.UI.Page
    {
        string sql1 = "select top 10 ID,新闻标题,发布时间 from 新闻表 where 栏目名称='新闻资讯' order by 发布时间 desc";
        string sql2 = "select top 10 ID,新闻标题,发布时间 from 新闻表 where 栏目名称='活动公告' order by 发布时间 desc";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBind(sql1);
            DataBind(sql2);
        }

        #region 数据绑定
        public void DataBind(string s)
        {
            string sql = s;
            try
            {
                DataSet ds = LinkDB.dataSet(sql);
                if (sql == sql1)
                {
                    repeater1.DataSource = ds.Tables["tables"].DefaultView;
                    repeater1.DataBind();
                }
                else
                {
                    repeater2.DataSource = ds.Tables["tables"].DefaultView;
                    repeater2.DataBind();
                }
                ds.Clear();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
            }
            // finally//可能用不到 
        }
        #endregion

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LB = (LinkButton)sender;
            if (LB.ID == "LinkButton1")
                Session["kind"] = LinkButton1.Text;
            else
                Session["kind"] = LinkButton2.Text;
            Response.Redirect("Page2_1.aspx");

        }
    }
}