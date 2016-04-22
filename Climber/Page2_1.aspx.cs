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
    public partial class Page2_1 : System.Web.UI.Page
    {
        string column;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {

                column = Session["kind"].ToString();
            }

            Label2.Text = column;
            repeater1.DataSource = pds(column);
            repeater1.DataBind();
            
        }

        #region 分页数据绑定
        public PagedDataSource pds(string i)
        {

            string sql = "select ID,新闻标题,发布时间 from 新闻表 where 栏目名称= '" + i + "' order by 发布时间 desc";
            DataSet ds = LinkDB.dataSet(sql);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = ds.Tables["tables"].DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 15;
            pds.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
            return pds;

        }

        #endregion

        protected void repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //column = Server.UrlDecode(Request["id"]);
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label labCurrentPage = (Label)e.Item.FindControl("labCurrentPage");
                Label labPageCount = (Label)e.Item.FindControl("labPageCount");
                HyperLink hlFirst = (HyperLink)e.Item.FindControl("hlFirst");
                HyperLink hlPrevious = (HyperLink)e.Item.FindControl("hlPrevious");
                HyperLink hlNext = (HyperLink)e.Item.FindControl("hlNext");
                HyperLink hlLast = (HyperLink)e.Item.FindControl("hlLast");

                int pagecount = pds(column).PageCount;
                int currentpage = pds(column).CurrentPageIndex;
                labCurrentPage.Text =(currentpage+1).ToString();
                labPageCount.Text = pagecount.ToString();

                if (currentpage <= 0)
                {
                    hlFirst.Enabled = false;
                    hlPrevious.Enabled = false;
                    hlNext.Enabled = true;
                    hlLast.Enabled = true;
                }
                else
                {
                    hlPrevious.NavigateUrl = "?page=" + (currentpage - 1);
 
                }

                if (currentpage >= pagecount - 1)
                {
                    hlFirst.Enabled = true;
                    hlPrevious.Enabled = true;
                    hlNext.Enabled = false;
                    hlLast.Enabled = false;

                }
                else
                {
                    hlNext.NavigateUrl = "?page=" + (currentpage + 1);
                }

                hlFirst.NavigateUrl = "?page=0";
                hlLast.NavigateUrl = "?page="+(pagecount-1).ToString();
            }

        }

    }
}