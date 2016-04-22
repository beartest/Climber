using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

/// <summary>
///Common 的摘要说明
/// </summary>
public class LinkDB : System.Web.UI.Page 
{
		//
		//TODO: 在此处添加构造函数逻辑
		//
        private static SqlConnection conn = new SqlConnection();
        private static SqlCommand comm = new SqlCommand();
        public static string error = "";
	    public LinkDB()
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
                    string connsql = @"data source=WIN-TEQBPUNT5PE\SQLEXPRESS;database=14峰网站数据库;uid=sa;password=708615";
                    conn.ConnectionString =connsql;
                    comm.Connection = conn;
                    conn.Open();
                }
                catch (SqlException ex)
                {
                    ClassSqlException(ex);
                }
                catch (Exception e)
                {
                    error = "其它原因错误";
                    //throw new Exception(e.Message);
                }
            }
        }
        /// <summary>
        /// 关闭连接
        /// </summary>
        public static void closeConnection()
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
            catch (SqlException ex)
            {
                ClassSqlException(ex);
            }
            catch (Exception e)
            {
                error = "其它原因错误";
                //throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
        }
        /// <summary>
        /// 执行一条sql语句
        /// </summary>
        /// <param name="sqlStr">sql语句</param>
        public static int executeSql(string sqlStr)
        {
            int l=0;
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlStr;
                l =Convert.ToInt32( comm.ExecuteScalar());
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return l;
 
        }
        /// <summary>
        /// 返回一个数据集
        /// </summary>
        /// <param name="sqlStr">sql语句</param>
        /// <returns></returns>
        public static DataSet dataSet(string sqlStr)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlStr;
                da.SelectCommand = comm; 
                da.Fill(ds, "tables");
            }
            catch (SqlException ex)
            {
                ClassSqlException(ex);
            }
            catch(Exception e)
            {
                error = "其它原因错误";
                //throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return ds;
        }
        /// <summary>
        /// 返回一个SqlDataReader
        /// </summary>
        /// <param name="sqlStr">sql语句</param>
        /// <returns></returns>
        public static SqlDataReader Reader(string sqlStr)
        {
            SqlDataReader dr;
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlStr;
                dr = comm.ExecuteReader();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return dr;
        }
        /// <summary>
        /// 返回一个数据视图
        /// </summary>
        /// <param name="sqlStr">sql语句</param>
        /// <returns></returns>
       
        public static DataView dataView(string sqlStr)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            DataView dv = new DataView();
            DataSet ds = new DataSet();
            try
            {
                openConnection();
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlStr;
                da.SelectCommand = comm;
                da.Fill(ds);
                dv = ds.Tables[0].DefaultView;
            }
            catch (SqlException ex)
            {
                ClassSqlException(ex);
            }
            catch (Exception e)
            {
                error = "其它原因错误";
                //throw new Exception(e.Message);
            }
            finally
            {
                closeConnection();
            }
            return dv;
        }
        /// <summary>
        /// 将SqlException分类，返回不同错误类型说明
        /// </summary>
        private static void ClassSqlException(SqlException se)
        {
            switch (se.Number)
            {
                case -1:
                    error = "未找到或无法访问服务器";
                    break;
                case 4060:
                    error = "无法打开所请求的数据库";
                    break;
                case 2627:
                    error = "主键重复";
                    break;
                case -2:
                    error = "timeout";
                    break;
                case 17:
                    error = "Sql Server不存在或者拒绝访问";
                    break;
                case 17142:
                    error = "Sql Server暂停";
                    break;
                case 2812:
                    error = "存储过程不存在";
                    break;
                case 208:
                    error = "目标表不存在";
                    break;
                default:
                    error = "其它原因错误";
                    break;
            }
        }
	
}