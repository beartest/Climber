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
    public partial class Admin7 : System.Web.UI.Page
    {
        private static string sqlStr = "select * from 活动表 order by 编号 desc";

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
            string[] q = new string[5];
            string sql = "select * from 活动表";
            q[0] = "活动表.活动名称 like '%" + this.huodong1.Text + "%'";
            q[1] = "活动表.部门名称 like '" + this.bumen1.Text + "'";
            q[2] = "活动表.活动类型 like '" + this.leixing1.Text + "'";
            q[4] = "活动表.备注 like '%" + this.beizhu1.Text + "%'";
            if (this.huodong1.Text == "")
                q[0] = null;
            if (this.bumen1.SelectedItem.Value == "全部")
                q[1] = null;
            else if (this.bumen1.SelectedItem.Value == "未知")
                q[1] = "活动表.部门名称 is null";
            if (this.leixing1.SelectedItem.Value == "全部")
                q[2] = null;
            else if (this.leixing1.SelectedItem.Value == "未知")
                q[2] = "活动表.活动类型 is null";
            if (this.shijian1.SelectedItem == null)
                q[3] = null;
            else
            {

                for (int i = 0; i < shijian1.Items.Count; i++)
                {
                    if (this.shijian1.Items[i].Selected)
                    {
                        if (q[3] == null)
                            q[3] = "活动表.活动时间 like '%" + shijian1.Items[i].Value + "%'";
                        else
                            q[3] += "and 活动表.活动时间 like '%" + shijian1.Items[i].Value + "%'";
                    }
                }
            }
            if (this.beizhu1.Text == "")
                q[4] = null;
            for (int i = 0; i < 5; i++)
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
            string c = "活动名称";
            string v = "'" + this.huodong2.Text + "'";
            string sql = "insert into 活动表";
            if (this.bumen2.SelectedItem.Value != "未知")
            { c += ",部门名称"; v += ",'" + this.bumen2.SelectedItem.Value + "'"; }
            if (this.leixing2.SelectedItem.Value != "未知")
            { c += ",活动类型"; v += ",'" + this.leixing2.SelectedItem.Value + "'"; }
            if (this.shijian2.SelectedIndex != null)
            {
                string s = ContentClear.GetCheckBoxListValue(shijian2);
                c += ",活动时间"; v += ",'" + s + "'";
            }
            if (this.leixing2.Text != "")
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
            sqlStr = "select * from 活动表 where 活动名称= '" + this.huodong2.Text + "' union " + sqlStr;
            bind();
        }

        protected void shanchu_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                bool ischecked = ((CheckBox)GridView1.Rows[i].FindControl("select")).Checked;
                if (ischecked)
                {
                    string sqlStr = "delete from 活动表 where 活动名称='" + GridView1.DataKeys[i].Value + "'";
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
            GridView1.DataKeyNames = new string[] { "活动名称" };
            GridView1.DataBind();
        }

        // 在单击 GridView 控件内某一行的 Delete 按钮时发生，但在 GridView 控件更新记录之前。此事件通常用于删除操作。
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sqlStr = "delete from 活动表 where 活动名称='" + GridView1.DataKeys[e.RowIndex].Value + "'";
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
            string 原活动名称 = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string 活动名称 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string 部门名称 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string 活动类型 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string 活动时间 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            string 备注 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
            if (活动名称 == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('活动名称不能为空');</script>");
                return;
            }
            string sql = "update 活动表 set 活动名称='" + 活动名称 + "'";
            if (部门名称 != "")
                sql += ",部门名称='" + 部门名称 + "'";
            else
                sql += ",部门名称=NULL";
            if (活动类型 != "")
                sql += ",活动类型='" + 活动类型 + "'";
            else
                sql += ",活动类型=NULL";
            if (活动时间 != "")
                sql += ",活动时间='" + 活动时间 + "'";
            else
                sql += ",活动时间=NULL";
            sql += " where 活动名称 = '" + 原活动名称 + "'";
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