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
    public partial class Admin8 : System.Web.UI.Page
    {
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

        protected void charu_Click(object sender, EventArgs e)
        {
            string c = "部门名称";
            string v = "'" + this.bumen.Text + "'";
            string sql = "insert into 部门表";
            if (this.buzhang.Text != "")
            { c += ",部长"; v += ",'" + this.buzhang.Text + "'"; }
            if (this.fubuzhang.Text != "")
            { c += ",副部长"; v += ",'" + this.fubuzhang.Text + "'"; }
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
            bind();
        }

        protected void chongzhi_Click(object sender, EventArgs e)
        {
            ContentClear.ClearAllContent(View1);
        }

        // 数据绑定
        public void bind()
        {
            DataSet myds = LinkDB.dataSet("select * from 部门表");
            if (LinkDB.error != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('" + LinkDB.error + "');</script>");
                LinkDB.error = "";
                return;
            }
            GridView1.DataSource = myds;
            GridView1.DataKeyNames = new string[] { "部门名称" };
            GridView1.DataBind();
        }

        // 在单击 GridView 控件内某一行的 Delete 按钮时发生，但在 GridView 控件更新记录之前。此事件通常用于删除操作。
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sqlStr = "delete from 部门表 where 部门名称='" + GridView1.DataKeys[e.RowIndex].Value + "'";
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
            string 原部门名称 = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string 部门名称 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
            string 部长 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string 副部长 = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            if (部门名称 == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('部门名称不能为空');</script>");
                return;
            }
            string sql = "update 部门表 set 部门名称='" + 部门名称 + "'";
            if (部长 != "")
                sql += ",部长='" + 部长 + "'";
            else
                sql += ",部长=NULL";
            if (副部长 != "")
                sql += ",副部长='" + 副部长 + "'";
            else
                sql += ",副部长=NULL";
            sql += " where 部门名称 = '" + 原部门名称 + "'";
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
                e.Row.Cells[0].Text = id.ToString();
            }
        }
    }
}