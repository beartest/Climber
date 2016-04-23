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
    public partial class Admin2 : System.Web.UI.Page
    {
        private static string sqlStr = "select * from 装备表 order by ID desc";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DateLabel.Text = DateTime.Now.ToString("D");
                this.WeekLabel.Text = DateTime.Now.ToString("dddd");
                bindParent();
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

        public void bindParent()
        {
            string sqlStr = "select * from 装备表";
            DataSet myds = LinkDB.dataSet(sqlStr);
            ParentGridView.DataSource = myds;
            ParentGridView.DataKeyNames = new string[] { "ID","装备名称" };
            ParentGridView.DataBind();
        }
        protected void ParentGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.Attributes["style"] = "border-color:Black";
            }
        }
        protected void ParentGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int parent_index = e.NewEditIndex;
            ParentGridView.EditIndex = parent_index;
            bindParent();
            string tablename = "";
            if (Convert.ToInt32(ParentGridView.DataKeys[parent_index].Values[0]) < 200)
                tablename = ParentGridView.DataKeys[parent_index].Values[1].ToString().Trim() + "1";
            else if (Convert.ToInt32(ParentGridView.DataKeys[parent_index].Values[0]) < 300)
                tablename = ParentGridView.DataKeys[parent_index].Values[1].ToString().Trim() + "2";
            else
                tablename = ParentGridView.DataKeys[parent_index].Values[1].ToString().Trim() + "3";
            string sql = "select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '" + tablename + "'";
            GridView childGridView = (GridView)(ParentGridView.Rows[parent_index].FindControl("ChildGridView"));
            childGridView.Columns.Clear();
            SqlDataReader dr = LinkDB.Reader(sql);
            while (dr.Read())
            {
                string DR = (string)dr["COLUMN_NAME"];
                BoundField bf = new BoundField();
                if (DR != "编号")
                {
                    bf.DataField = DR;
                }
                bf.HeaderText = DR;
                childGridView.Columns.Add(bf);
            }
            dr.Close();
            string sqlStr = "select * from " + tablename;
            DataSet myds = LinkDB.dataSet(sqlStr);
            childGridView.DataSource = myds;
            childGridView.DataKeyNames = new string[] { "编号" };
            childGridView.DataBind();
        }
        protected void ParentGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ParentGridView.EditIndex = -1;
            bindParent();
        }
        protected void ChildGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (TableCell tc in e.Row.Cells)
            {
                tc.Attributes["style"] = "border-color:Black";
            }
            if (e.Row.RowIndex != -1)
            {
                int id = ParentGridView.PageIndex * ParentGridView.PageSize + e.Row.RowIndex + 1;
                e.Row.Cells[0].Text = id.ToString();
            }
        }
    }
}