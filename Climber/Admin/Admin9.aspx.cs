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
    public partial class Admin9 : System.Web.UI.Page
    {
        private static string sqlStr = "select * from 人员表 order by 编号 desc";

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
            string[] q = new string[11];
            string sql = "select * from 人员表";
            q[0] = "人员表.学号 like '%" + this.xuehao1.Text + "%'";
            q[1] = "人员表.姓名 like '%" + this.xingming1.Text + "%'";
            q[2] = "人员表.联系电话 = '" + this.dianhua1.Text + "'";
            q[3] = "人员表.出生日期 = '" + this.shengri1.Text + "'";
            q[4] = "人员表.性别 = '" + this.xingbie1.SelectedItem.Value + "'";
            q[5] = "人员表.籍贯 = '" + this.jiguan1.SelectedItem.Value + "'";
            q[6] = "人员表.所在院系 = '" + this.xueyuan1.SelectedItem.Value + "'";
            q[7] = "人员表.入学年份 = '" + this.xuenian1.SelectedItem.Value + "'";
            q[8] = "人员表.学历 = '" + this.xueli1.SelectedItem.Value + "'";
            q[9] = "人员表.部门名称 ='" + this.bumen1.SelectedItem.Value + "'";
            q[10] = "人员表.职位 = '" + this.zhiwei1.SelectedItem.Value + "'";
            if (this.xuehao1.Text == "")
                q[0] = null;
            if (this.xingming1.Text == "")
                q[1] = null;
            if (this.dianhua1.Text == "")
                q[2] = null;
            if (this.shengri1.Text == "")
                q[3] = null;
            if (this.xingbie1.SelectedItem.Value == "全部")
                q[4] = null;
            else if (this.xingbie1.SelectedItem.Value == "未知")
                q[4] = "人员表.性别 is null ";
            if (this.jiguan1.SelectedItem.Value == "全部")
                q[5] = null;
            else if (this.jiguan1.SelectedItem.Value == "未知")
                q[5] = "人员表.籍贯 is null ";
            if (this.xueyuan1.SelectedItem.Value == "全部")
                q[6] = null;
            else if (this.xueyuan1.SelectedItem.Value == "未知")
                q[6] = "人员表.所在院系 is null ";
            if (this.xuenian1.SelectedItem.Value == "全部")
                q[7] = null;
            else if (this.xuenian1.SelectedItem.Value == "未知")
                q[7] = "人员表.入学年份 is null ";
            if (this.xueli1.SelectedItem.Value == "全部")
                q[8] = null;
            else if (this.xueli1.SelectedItem.Value == "未知")
                q[8] = "人员表.学历 is null ";
            if (this.bumen1.SelectedItem.Value == "全部")
                q[9] = null;
            else if (this.bumen1.SelectedItem.Value == "未知")
                q[9] = "人员表.部门名称 is null ";
            if (this.zhiwei1.SelectedItem.Value == "全部")
                q[10] = null;
            else if (this.zhiwei1.SelectedItem.Value == "未知")
                q[10] = "人员表.职位 is null ";
            for (int i = 0; i < 11; i++)
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
            sql += " order by 编号 desc";
            GridView1.PageIndex = 0;
            sqlStr = sql;
            bind();
        }

        protected void charu_Click(object sender, EventArgs e)
        {
            string c = "学号,姓名";
            string v = "'" + this.xuehao2.Text + "','" + this.xingming2.Text + "'";
            string sql = "insert into 人员表";
            if (this.dianhua2.Text != "")
            { c += ",联系电话"; v += ",'" + this.dianhua2.Text + "'"; }
            if (this.shengri2.Text != "")
            { c += ",出生日期"; v += ",'" + this.shengri2.Text + "'"; }
            if (this.xingbie2a.Checked)
            { c += ",性别"; v += ",'男'"; }
            if (this.xingbie2b.Checked)
            { c += ",性别"; v += ",'女'"; }
            if (this.jiguan2.SelectedItem.Value != "未知")
            { c += ",籍贯"; v += ",'" + this.jiguan2.SelectedItem.Value + "'"; }
            if (this.xueyuan2.SelectedItem.Value != "未知")
            { c += ",所在院系"; v += ",'" + this.xueyuan2.SelectedItem.Value + "'"; }
            if (this.xuenian2.SelectedItem.Value != "未知")
            { c += ",入学年份"; v += ",'" + this.xuenian2.SelectedItem.Value + "'"; }
            if (this.xueli2.SelectedItem.Value != "未知")
            { c += ",学历"; v += ",'" + this.xueli2.SelectedItem.Value + "'"; }
            if (this.bumen2.SelectedItem.Value != "未知")
            { c += ",部门名称"; v += ",'" + this.bumen2.SelectedItem.Value + "'"; }
            if (this.zhiwei2.SelectedItem.Value != "未知")
            { c += ",职位"; v += ",'" + this.zhiwei2.SelectedItem.Value + "'"; }
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
            sqlStr = "select * from 人员表 where 学号= '" + this.xuehao2.Text + "' union " + sqlStr;
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

        protected void shanchu_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool ischecked = ((CheckBox)GridView1.Rows[i].FindControl("select")).Checked;
                if (ischecked)
                {
                    string sqlStr = "delete from 人员表 where 学号=" + Convert.ToInt32(GridView1.DataKeys[i].Value) + "";
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
            GridView1.DataKeyNames = new string[] { "学号" };
            GridView1.DataBind();
        }

        // 在单击 GridView 控件内某一行的 Delete 按钮时发生，但在 GridView 控件更新记录之前。此事件通常用于删除操作。
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sqlStr = "delete from 人员表 where 学号=" + GridView1.DataKeys[e.RowIndex].Value + "";
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
            string[] s = { "学号", "姓名", "性别", "联系电话", "出生日期", "籍贯", "所在院系", "入学年份", "学历", "部门名称", "职位" };
            string[] q = new string[11];
            for (int i = 0; i < 11; i++)
            {
                q[i] = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[i + 2].Controls[0])).Text.ToString().Trim();
            }
            if (q[0] == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('学号不能为空');</script>");
                return;
            }
            else if (q[1] == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('姓名不能为空');</script>");
                return;
            }
            string sql = "update 人员表 set 学号='" + q[0] + "',姓名='" + q[1] + "'";
            for (int i = 2; i < 11; i++)
            {
                if (q[i] != "")
                    sql += "," + s[i] + "='" + q[i] + "'";
                else
                    sql += "," + s[i] + "=NULL";
            }
            string 原学号 = GridView1.DataKeys[e.RowIndex].Value.ToString();
            sql += " where 学号 = '" + 原学号 + "'";
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