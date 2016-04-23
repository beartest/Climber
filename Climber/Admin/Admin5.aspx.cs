using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;

namespace Climber
{
    public partial class Admin5 : System.Web.UI.Page
    {
        private static string sqlStr = "select * from 考勤表 order by 编号 desc";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DateLabel.Text = DateTime.Now.ToString("D");
                this.WeekLabel.Text = DateTime.Now.ToString("dddd");
                bind();
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            //点击后按钮颜色及字体颜色变化
            Button b2 = (Button)sender;
            b2.ForeColor = Color.FromArgb(220, 100, 35);

            switch (b2.ID)
            {
                case "Button1_1":
                    Button1_2.ForeColor = Color.FromArgb(18, 56, 98);
                    MultiView1.ActiveViewIndex = 0;
                    break;
                case "Button1_2":
                    Button1_1.ForeColor = Color.FromArgb(18, 56, 98);
                    MultiView1.ActiveViewIndex = 1;
                    break;
            }
        }

        protected void chaxun_Click(object sender, EventArgs e)
        {
            string k = "";//记录where或and
            string[] q = new string[4];
            string sql = "select * from 考勤表";
            q[0] = "考勤表.学号 like '%" + this.xuehao1.Text + "%'";
            q[1] = "考勤表.日期 = '" + this.riqi1.Text + "'";
            q[2] = "考勤表.出勤 = '" + this.chuqin1.Text + "'";
            q[3] = "考勤表.备注 like '%" + this.beizhu1.Text + "%'";
            if (this.xuehao1.Text == "")
                q[0] = null;
            if (this.riqi1.Text == "")
                q[1] = null;
            if (this.chuqin1.SelectedItem.Value == "全部")
                q[2] = null;
            else if (this.chuqin1.SelectedItem.Value == "未知")
                q[2] = "考勤表.出勤 is null";
            if (this.beizhu1.Text == "")
                q[3] = null;
            for (int i = 0; i < 4; i++)
            {
                if (q[i] != null)
                {
                    if (k == "")
                        k = " where ";
                    else
                        k = " and ";
                    sql += k + q[i];
                }
            }
            GridView1.PageIndex = 0;
            sqlStr = sql;
            bind();
        }

        protected void charu_Click(object sender, EventArgs e)
        {
            string c = "学号,日期";
            string v = "'" + this.xuehao2.Text + "','" + this.riqi2.Text + "'";
            string sql = "insert into 考勤表";
            if (this.kaoqin2a.Checked)
            { c += ",出勤"; v += ",'是'"; }
            if (this.kaoqin2b.Checked)
            { c += ",出勤"; v += ",'否'"; }
            if (this.beizhu2.Text != "")
            { c += ",备注"; v += ",'" + this.beizhu2.Text + "'"; }
            sql += " (" + c + ") values (" + v + ")";
            LinkDB.ExecuteSql(sql);
            if (LinkDB.error == "")
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('信息插入成功');</script>");
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('信息插入失败(" + LinkDB.error + ")');</script>");
                LinkDB.error = "";
            }
            GridView1.PageIndex = 0;
            sqlStr = "select * from 考勤表 where 学号= '" + this.xuehao2.Text + "' union " + sqlStr;
            bind();
        }

        protected void shanchu_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool ischecked = ((CheckBox)GridView1.Rows[i].FindControl("select")).Checked;
                if (ischecked)
                {
                    string sqlStr = "delete from 考勤表 where 学号='" + GridView1.DataKeys[i].Values[0].ToString() + "' and 日期='" + GridView1.DataKeys[i].Values[1].ToString() + "'";
                    LinkDB.ExecuteSql(sqlStr);
                    if (LinkDB.error != "")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败(" + LinkDB.error + ")');</script>");
                        LinkDB.error = "";
                    }
                }
            }
            bind();
        }

        protected void chongzhi_Click(object sender, EventArgs e)
        {
            Button b1 = (Button)sender;
            View v = new View();
            switch (b1.ID)
            {
                case "chongzhi1":
                    v = View1;
                    break;
                case "chongzhi2":
                    v = View2;
                    break;
            }
            ContentClear.ClearAllContent(v);
        }

        // 数据绑定
        public void bind()
        {
            DataSet myds = LinkDB.dataSet(sqlStr);
            if (LinkDB.error != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + LinkDB.error + "');</script>");
                LinkDB.error = "";
                return;
            }
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "学号", "日期" };
            GridView1.DataBind();
        }

        // 在单击 GridView 控件内某一行的 Delete 按钮时发生，但在 GridView 控件更新记录之前。此事件通常用于删除操作。
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sqlStr = "delete from 考勤表 where 学号='" + GridView1.DataKeys[e.RowIndex].Values[0].ToString() + "' and 日期='" + GridView1.DataKeys[e.RowIndex].Values[1].ToString() + "'";
            LinkDB.ExecuteSql(sqlStr);
            if (LinkDB.error != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('删除失败(" + LinkDB.error + ")');</script>");
                LinkDB.error = "";
            }
            bind();
        }

        // 在单击 GridView 控件内某一行的 Update 按钮（其 CommandName 属性设置为"Update"的按钮）时发生，但在 GridView 控件更新记录之前。此事件通常用于取消更新操作。
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string 原学号 = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            string 原日期 = GridView1.DataKeys[e.RowIndex].Values[1].ToString();
            string 学号 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string 日期 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string 出勤 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string 备注 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            if (学号 == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('学号不能为空');</script>");
                return;
            }
            else if (日期 == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('日期不能为空');</script>");
                return;
            }
            string sql = "update 考勤表 set 学号='" + 学号 + "',日期='" + 日期 + "'";
            if (出勤 != "")
                sql += ",出勤='" + 出勤 + "'";
            else
                sql += ",出勤=NULL";
            if (备注 != "")
                sql += ",备注='" + 备注 + "'";
            else
                sql += ",备注=NULL";
            sql += " where 学号 = '" + 原学号 + "' and 日期='" + 原日期 + "'";
            LinkDB.ExecuteSql(sql);
            if (LinkDB.error != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('更新失败(" + LinkDB.error + ")');</script>");
                LinkDB.error = "";
            }
            GridView1.EditIndex = -1;
            bind();
        }

        // 在单击 GridView 控件内某一行的 Edit 按钮（其 CommandName 属性设置为“Edit”的按钮）时发生，但在 GridView 控件进入编辑模式之前。此事件通常用于取消编辑操作。
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind();
        }

        // 在单击 GridView 控件内某一行的 Cancel 按钮（其 CommandName 属性设置为“Cancel”的按钮）时发生，但在 GridView 控件退出编辑模式之前。此事件通常用于停止取消操作。
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bind();
        }

        // 在 GridView 控件中的某个行被绑定到一个数据记录时发生。此事件通常用于在某个行被绑定到数据时修改该行的内容。    
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "EditOrder":
                    bind();
                    break;
            }
        }

        // 在 GridView 控件中的改变页数时发生。此事件常用于控件页数改变时的数据重新绑定，注意某些数据绑定时页数的还原。
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bind();
        }

        // 在 GridView 控件中的某个行被绑定到一个数据记录时发生。此事件通常用于在某个行被绑定到数据时修改该行的内容。
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.Attributes["style"] = "border-color:Black";
            }
            if (e.Row.RowIndex != -1)
            {
                int id = GridView1.PageIndex * GridView1.PageSize + e.Row.RowIndex + 1;
                e.Row.Cells[1].Text = id.ToString();
            }
        }
    }
}