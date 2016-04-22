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
    public partial class Google : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RepeaterDataBind("select * from 山峰表");
            }
        }

        private void RepeaterDataBind(string sql)
        {
            DataSet myds = LinkDB.dataSet(sql);
            RepeaterBind.DataSource = myds;
            RepeaterBind.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string k = "";
            string[] q = new string[3];
            string sql = "select * from 山峰表";

            if (this.TextBox1.Text == "")
                q[0] = null;
            else
                q[0] = "山峰表.山峰名称 like '%" + this.TextBox1.Text + "%'";

            switch (this.DropDownList1.SelectedItem.Value)
            {
                case "全部":
                    q[1] = null;
                    break;
                case "<2km":
                    q[1] = "山峰表.海拔高度 <=2000";
                    break;
                case "2km-4km":
                    q[1] = "山峰表.海拔高度 >2000 and 山峰表.海拔高度<=4000";
                    break;
                case "4km-6km":
                    q[1] = "山峰表.海拔高度 >4000 and 山峰表.海拔高度<=6000";
                    break;
                case ">6km":
                    q[1] = "山峰表.海拔高度 >6000";
                    break;
            }

            if (this.DropDownList2.SelectedItem.Value == "中国")
                q[2] = null;
            else
                q[2] = "山峰表.所在地区 = '" + this.DropDownList2.SelectedItem.Value + "'";
            for (int i = 0; i < 3; i++)
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
            RepeaterDataBind(sql);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "TrunIntoRegion()", true);
        }
    }
}