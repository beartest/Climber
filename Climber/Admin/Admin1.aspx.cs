using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace Climber
{
    public partial class Admin11 : System.Web.UI.Page
    {
        static int startIndex;//保存当前页的起始索引(分页)
        protected static int EditedPage;//保存当前页索引(删除时的特殊情况)
        public static string B;//用于“二级按钮”的参数
        public int D;//用于“添加、查看”的参数

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            this.DateLabel.Text = DateTime.Now.ToString("D");
            this.WeekLabel.Text = DateTime.Now.ToString("dddd");
            if (!IsPostBack)
            {
                startIndex = 0;
                B = "where 栏目名称='新闻资讯'";
                DataBind(B);
               
            }
        }
        #endregion

        #region 数据绑定，自定义分页
        public void DataBind(string b)
        {
            startIndex = news.PageSize * news.CurrentPageIndex;//计算第三页startInde=10*2=20
            string connsql = @"data source=WIN-TEQBPUNT5PE\SQLEXPRESS;database=14峰网站数据库;uid=sa;password=708615";
            string sql = "select ID,新闻标题 from 新闻表 " + b + "order by 发布时间 desc";
            SqlConnection conn = new SqlConnection(connsql);
            SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
            try
            {
                DataSet data = new DataSet();
                // DataTable table1 = data.Tables();//想存在table1中
                adapter.Fill(data, startIndex, news.PageSize, "CurDataTable");//填充类型，起始索引，datagrid中页容量，“起始页名”
                adapter.Fill(data, "AllDataTable");
                news.VirtualItemCount = data.Tables["AllDataTable"].Rows.Count;//datagrid中“行”数
                news.DataSource = data.Tables["CurDataTable"];
                news.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
            }
            // finally//可能用不到 
        }
        #endregion

        #region 改变行颜色
        protected void news_ItemDataBound(object sender, DataGridItemEventArgs e)//在项被数据绑定后激发
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//项
            {
                e.Item.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#6699ff'");//;this.style.ForeColor='#5544',没有相应的记录原蓝色的，而且貌似不对
                e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
                //e.Item.Attributes.Add("onclick","window.open('z2-1?ID="+e.Item.Cells[0].Text +"')");//链接[框]使用,仍是带下划线的，故不用了
            }
        }
        #endregion

        #region 自定义分页
        protected void news_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            news.CurrentPageIndex = e.NewPageIndex;//设置当前页索引，分页，删除
            //startIndex = news.PageSize * news.CurrentPageIndex;//计算第三页startInde=10*2=20
            DataBind(B);//重新绑定数据
        }
        #endregion

        #region 删除
        protected void news_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            Response.Write("删除");
            int empID = int.Parse(e.Item.Cells[0].Text);
            //int empID = (int)news.DataKeys[e.Item.index];//获得编辑行的关键字段的值
            string connsql = @"data source=HONG-PC\SA;database=14峰网站数据库;uid=sa;password=sa1010";
            string sqlDel = "delete dbo.新闻表 where ID=" + empID.ToString();
            SqlConnection conn = new SqlConnection(connsql);
            SqlCommand Del = new SqlCommand(sqlDel, conn);
            conn.Open();
            try
            {
                Del.ExecuteNonQuery();
                EditedPage = news.CurrentPageIndex;//获取当前页面都索引
                if ((news.PageCount - news.CurrentPageIndex) == 1 && news.Items.Count == 1)//如果存在页并且当前页中仅有一项时
                {
                    if (news.PageCount > 1)//DataGrid是2页及2页以上
                    {
                        EditedPage = EditedPage - 1;
                    }
                    else
                    {
                        EditedPage = 0;
                    }
                }
                //else//当前页不是仅有一项的情况 EditedPage = EditedPage;因此不用再加了
                news.CurrentPageIndex = EditedPage;

                DataBind(B);//重新绑定数据
            }
            catch (SqlException ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion

        #region 删除弹出窗口
        protected void news_ItemCreated(object sender, DataGridItemEventArgs e)//在datagrid行创建时发生
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.EditItem)
            {
                TableCell cell;
                cell = e.Item.Cells[3];
                LinkButton btnDel = (LinkButton)cell.Controls[0];
                btnDel.Attributes.Add("onclick", "return confirm('确定删除此行吗？');");
                btnDel.Text = "删除";
            }
        }
        #endregion

        #region 崔靖一级按钮
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
        #endregion

        #region 崔靖二级按钮
        protected void Button2_Click(object sender, EventArgs e)
        {
            //点击后按钮颜色及字体颜色变化
            Button b2 = (Button)sender;
            b2.ForeColor = Color.FromArgb(220, 100, 35);

            switch (b2.ID)
            {
                case "Button1_1":
                    Button1_2.ForeColor = Color.FromArgb(18, 56, 98);
                    //MultiView1.ActiveViewIndex = 0;
                    B = "where 栏目名称='新闻资讯'";
                    news.CurrentPageIndex = 0;
                    DataBind(B);
                    break;
                case "Button1_2":
                    Button1_1.ForeColor = Color.FromArgb(18, 56, 98);
                    //MultiView1.ActiveViewIndex = 1;
                    B = "where 栏目名称='活动公告'";
                    news.CurrentPageIndex = 0;
                    DataBind(B);
                    break;
            }
        }
        #endregion

        #region “添加”按钮
        protected void Btnadd_Click(object sender, EventArgs e)
        {
            D = 0;
            Response.Redirect("Admin1_1.aspx?&id=" + D);
        }
        #endregion

        #region “查看”按钮列
        protected void news_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.CommandName != "Delete")
            {
                D = int.Parse(e.Item.Cells[0].Text);
                Response.Redirect("Admin1_1.aspx?&id=" + D);
            }
        }
        #endregion
    }
}