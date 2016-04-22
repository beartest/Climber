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
    public partial class Page2_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["i"];
            LabBind(ID);
            RepeaterBind(ID);
            HyperBind(ID);
        }
        public void RepeaterBind(string D)
        {
            string rep;
            if (D == "部门介绍")
                rep = "select 内容 from 部门内容 where 类型ID=";
            else if (D == "日常活动")
                rep = "select 内容 from 日常内容 where 类型ID=";
            else if (D == "精品活动")
                rep = "select 内容 from 精品内容 where 类型ID=";
            else 
                rep = "select 内容 from 户外内容 where 类型ID=";
            for (int id = 0; id < 6; id++)
            {
                string repp = rep + id;
                DataSet repDS = LinkDB.dataSet(repp);
                switch (id)
                {
                    case 0:
                        {
                            repeater1.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater1.DataBind();
                            repeater2.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater2.DataBind();
                            break;
                        }
                    case 1:
                        {
                            repeater3.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater3.DataBind();
                            repeater4.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater4.DataBind();
                            break;
                        }
                    case 2:
                        {
                            repeater5.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater5.DataBind();
                            repeater6.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater6.DataBind();
                            break;
                        }
                    case 3:
                        {
                            repeater7.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater7.DataBind();
                            repeater8.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater8.DataBind();
                            break;
                        }
                    case 4:
                        {
                            repeater9.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater9.DataBind();
                            repeater10.DataSource = repDS.Tables["tables"].DefaultView;
                            repeater10.DataBind();
                            break;
                        }
                    case 5:
                            break;
                }

            }

        }

        public void HyperBind(string D)
        {
            string[] b = new string[6];
            string hyp;
            if (D == "部门介绍")
                hyp = "select 部门名称 from 部门介绍";
            else if (D == "日常活动")
                hyp = "select 活动名称 from 日常活动 ";
            else if(D=="精品活动")
                hyp = "select 活动名称 from 精品活动 ";
            else 
                hyp = "select 活动名称 from 户外百科 ";
               
            DataSet hypDS = LinkDB.dataSet(hyp);
            for (int x = 0; x < hypDS.Tables["tables"].Rows.Count; x++)
            {
                for (int y = 0; y < hypDS.Tables["tables"].Columns.Count; y++)
                {
                    b[x] = hypDS.Tables["tables"].Rows[x][y].ToString();
                }
            }
            HyperLink1.Text = b[0];
            HyperLink2.Text = b[1];
            HyperLink3.Text = b[2];
            HyperLink4.Text = b[3];
            HyperLink5.Text = b[4];
        }
        
        public void LabBind(string D)
        {
            string[] a = new string[6];
            string lab;
            if (D == "部门介绍")
                lab = "select 部门简介 from 部门介绍";
            else if (D == "日常活动")
                lab = "select 活动简介 from 日常活动 ";
            else if (D == "精品活动")
                lab = "select 活动简介 from 精品活动 ";
            else
                lab = "select 活动简介 from 户外百科 ";

            DataSet labDS = LinkDB.dataSet(lab);
            for (int x = 0; x < labDS.Tables["tables"].Rows.Count; x++)
            {
                for (int y = 0; y < labDS.Tables["tables"].Columns.Count; y++)
                {
                    a[x] = labDS.Tables["tables"].Rows[x][y].ToString();
                }
            }
            Label1.Text = a[0];
            Label2.Text = a[1];
            Label3.Text = a[2];
            Label4.Text = a[3];
            Label5.Text = a[4];
        }

        protected void repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if ((e.Item.ItemIndex + 1) % 2 == 0)
            {
                e.Item.Controls.Clear();
            }
        }
        protected void repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if ((e.Item.ItemIndex + 1) % 2 != 0)
            {
                e.Item.Controls.Clear();
            }
        }
    }
}