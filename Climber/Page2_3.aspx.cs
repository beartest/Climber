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
    public partial class Page2_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["i"];
            RepeaterBind(ID);
        }

        public void RepeaterBind(string D)
        {
            Ttitle.Text = D;
            string sql = "select 内容 from 其余项 where ID=";
            if (D == "俱乐部简介")
                sql += 1;
            if (D == "大事记")
                sql += 2;
            else if (D == "联系我们")
                sql += 3;
            DataSet repDS = LinkDB.dataSet(sql);
            Repeater1.DataSource = repDS.Tables["tables"].DefaultView;
            Repeater1.DataBind();

        }
    }
}