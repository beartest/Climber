using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Climber
{
    public class ContentClear
    {
        //重置view中的控件
        public static void ClearAllContent(System.Web.UI.Control view)
        {
            foreach (System.Web.UI.Control control in view.Controls)
            {
                if (control is TextBox)
                    (control as TextBox).Text = "";
                else if (control is DropDownList)
                    (control as DropDownList).SelectedIndex = 0;
                else if (control is CheckBox)
                    (control as CheckBox).Checked = false;
                else if (control is RadioButton)
                    (control as RadioButton).Checked = false;
                else if (control is RadioButtonList)
                    (control as RadioButtonList).SelectedIndex = -1;
                else if (control is CheckBoxList)
                {
                    foreach (ListItem item in (control as CheckBoxList).Items)
                    {
                        item.Selected = false;
                    }
                }
            }
        }

        //获取CheckBoxList的值，返回以逗号分隔的字符串
        public static string GetCheckBoxListValue(CheckBoxList CBList)
        {
            string strTemp = "";
            for (int i = 0; i < CBList.Items.Count; i++)
            {
                if (CBList.Items[i].Selected)
                {
                    if (strTemp == "")
                    {
                        strTemp = CBList.Items[i].Value;
                    }
                    else
                    {
                        strTemp += "," + CBList.Items[i].Value;
                    }
                }
            }
            return strTemp;
        }
    }
}