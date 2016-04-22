using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

/// <summary>
///user 的摘要说明
/// </summary>
public class user
{
    //
	//TODO: 在此处添加构造函数逻辑
	//
    //public static string connsql = @"data source=HONG-PC\SA;database=队员信息管理系统;uid=sa;password=sa1010";
    private static SqlConnection conn = new SqlConnection();
    private static SqlCommand comm = new SqlCommand();
	public user()
	{  
        
	}
    /// <summary>
    /// 打开连接
    /// </summary>
    private static void openConnection()
    {
        if (conn.State == ConnectionState.Closed)
        {
            try
            {
                string connsql = @"data source=HONG-PC\SA;database=队员信息管理系统;uid=sa;password=sa1010";
                conn.ConnectionString = connsql;
                comm.Connection = conn;
                conn.Open();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
    /// <summary>
    /// 关闭连接
    /// </summary>
    private static void closeConnection()
    {
        if (conn.State == ConnectionState.Open)
        {
            conn.Close();
        }
        conn.Dispose();
        comm.Dispose();
    }
    /// <summary>
    /// 执行一条sql语句
    /// </summary>
    /// <param name="sqlStr">sql语句</param>
    public static void ExecuteSql(string sqlStr)
    {
        try
        {
            openConnection();
            comm.CommandType = CommandType.Text;
            comm.CommandText = sqlStr;
            comm.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }
        finally
        {
            closeConnection();
        }
    }
    /// <summary>
    /// 是否重复注册
    /// </summary>
    /// <param name="sqlStr">SqlDatareader</param>
    public static bool IsExists(string Num, string EMail)
    {
        string query = "select 学号,邮箱 from 注册表 where 学号='" + Num + "' or 邮箱='" + EMail + "'";
        bool isexists=false;//之前无记录
        openConnection();
        comm.CommandType = CommandType.Text;
        comm.CommandText = query;
        SqlDataReader dr = comm.ExecuteReader();
        if (dr.Read())
            isexists = true;  

        dr.Close();
        closeConnection();
        return isexists;

    }
    /// <summary>
    /// 密码加密
    /// </summary>
    //public static string HashPasswordForStoringInConfigFile(string password, string passwordFormat);
    //public static string mymd5(string str)
    //{
    //    //密码加密
    //    string EnPsWdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5");
    //    return(EnPsWdStr);
    //}
}