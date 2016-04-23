using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using FreeTextBoxControls;
using FreeTextBoxControls.Design;

namespace Climber
{
    public partial class Admin1_11 : System.Web.UI.Page
    {
        static int decide;

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                decide = int.Parse(Request.QueryString["id"]);//id非D
                if (decide != 0)
                {
                    NewsDataBind(decide);
                }
            }
        }
        #endregion

        #region “查看”显示功能
        public void NewsDataBind(int i)
        {
            string sql1 = "select 新闻标题,栏目名称,新闻内容,图片描述,新闻作者 from 新闻表 where ID=" + i;
            SqlDataReader reader = LinkDB.Reader(sql1);
            while (reader.Read())
            {
                Ttitle.Text = (string)reader["新闻标题"];
                RadioButtonList1.ClearSelection();
                //RadioButtonList1.SelectedValue=dr["栏目名称"].ToString();//两者都可以实现Radiobuttonlist的数据库显示
                RadioButtonList1.Text = reader["栏目名称"].ToString();
                FreeTextBox1.Text += reader["新闻内容"].ToString();
                TPath.Text = (string)reader["图片描述"];
                Tauthor.Text = (string)reader["新闻作者"];
            }
            reader.Close();
            LinkDB.closeConnection();

        }
        #endregion

        #region 保存按钮
        protected void save_Click(object sender, EventArgs e)
        {
            //Boolean fileOK = false;
            string path = Server.MapPath("~/content/");//设置为服务器网站接收文件目录
            string FileExtension = System.IO.Path.GetExtension(FUL1.FileName).ToLower();//获得文件类型

            if (FUL1.HasFile && FileExtension != ".doc" && FileExtension != ".docx")
            {
                Response.Write("<script>window.alert('您上传的文件类型不符合要求！');</script>");
            }
            else
            {
                string connsql = @"data source=HONG-PC\SA;database=14峰网站数据库;uid=sa;password=sa1010";
                //btnS.Attributes.Add("onclick", "return confirm('确定要保存吗？');");//弹出提示框，有问题？？？？？？？？？
                string sql;
                if (decide == 0)
                {
                    string L =  "select count(*) from dbo.新闻表";
                    int l = LinkDB.executeSql(L);
                    sql = "insert into dbo.新闻表(ID,新闻标题,栏目名称,存储路径,新闻作者,新闻内容,图片描述) values('"+l+"',@新闻标题,@栏目名称,@存储路径,@新闻作者,@新闻内容,@图片)";
                }
                else
                {
                    sql = "update dbo.新闻表 set 新闻标题=@新闻标题,栏目名称=@栏目名称,存储路径=@存储路径,新闻作者=@新闻作者,新闻内容=@新闻内容,图片描述=@图片 where ID=" + decide;
                }
                SqlConnection conn = new SqlConnection(connsql);
                SqlCommand insertnews = new SqlCommand(sql, conn);
                //为每个DB字段设置参数
                insertnews.Parameters.Add("@新闻标题", SqlDbType.NVarChar, 50);
                insertnews.Parameters.Add("@栏目名称", SqlDbType.NVarChar, 50);
                insertnews.Parameters.Add("@存储路径", SqlDbType.NVarChar, 50);
                insertnews.Parameters.Add("@新闻作者", SqlDbType.NChar, 10);
                insertnews.Parameters.Add("@新闻内容", SqlDbType.NVarChar, 4000);
                insertnews.Parameters.Add("@图片", SqlDbType.NVarChar, 50);
                //为每个参数赋值
                insertnews.Parameters["@新闻标题"].Value = Ttitle.Text;
                insertnews.Parameters["@栏目名称"].Value = RadioButtonList1.Text.ToString();//有点问题？？？？？？？？？？
                insertnews.Parameters["@存储路径"].Value = path + FUL1.FileName;
                insertnews.Parameters["@新闻作者"].Value = Tauthor.Text;
                insertnews.Parameters["@新闻内容"].Value = this.FreeTextBox1.Text.Trim().ToString();
                insertnews.Parameters["@图片"].Value = TPath.Text;
                try
                {
                    if (decide != 0)
                    {
                        //提示是否保存？是、否
                    }
                    conn.Open();
                    int flag = insertnews.ExecuteNonQuery();
                    if (flag > 0)
                    {
                        if (FUL1.HasFile && (FileExtension != ".doc" || FileExtension != ".docx"))
                            FUL1.PostedFile.SaveAs(path + FUL1.FileName);
                        Response.Write("<script>window.alert('保存成功！');</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>window.alert('保存失败！');</script>");
                }
                finally
                {
                    conn.Close();
                }
            }
        }
        #endregion

        #region “返回”按钮
        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin1.aspx");
        }
        #endregion

        protected void FreeTextBox1_Load(object sender, EventArgs e)
        {

        }
    }
}