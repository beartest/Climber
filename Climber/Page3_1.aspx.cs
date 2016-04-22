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
    public partial class Page3_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int index = int.Parse(Request.QueryString["ID"]);
            NewsDetial(index);
        }

        #region
        // protected System.Web.UI.HtmlControls.HtmlTable Ttable;
        public void NewsDetial(int i)
        {
            string picture = "kuaile";
            string sql = "select 新闻标题,发布时间,新闻作者,图片描述 from 新闻表 where ID=" + i;
            SqlDataReader dr = LinkDB.Reader(sql);
            while (dr.Read())
            {
                Ttitle.Text = (string)dr["新闻标题"];
                Ttime.Text = "    发布单位:地大登山攀岩俱乐部" + "      发布时间:" + ((DateTime)dr["发布时间"]).ToShortDateString() +
                            "        文/" + (string)dr["新闻作者"] + "  浏览次数:20";
                picture = (string)dr["图片描述"];
            }
            dr.Close();
            string content = "select 新闻内容 from 新闻表 where ID=" + i;
            DataSet newsset = LinkDB.dataSet(content);
            Repeater1.DataSource = newsset.Tables["tables"].DefaultView;
            Repeater1.DataBind();
            newsset.Clear();

            string path = AppDomain.CurrentDomain.BaseDirectory+"Admin\\Images\\upload\\" + picture + ".jpg";
            Image1.ImageUrl = "~/Admin/Images/upload/" + picture + ".jpg";
            Bitmap smallP = new Bitmap(path);
            Image1.Height = 200;
            Image1.Width = 200 * smallP.Width / smallP.Height;

        }
        #endregion
    }
}