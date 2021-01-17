using System;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace BaiTapLonN6
{
    public partial class HoSoTamTru : Form
    {
        SqlConnection con = new SqlConnection(ConnectionString.connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet ds = new DataSet();
        static int start;
        int page;
        static String trangthai = "";
        static String TimKiem = "";

        private String ten;
        private String quyen;
        public HoSoTamTru(String tenuser,String quyenhan)
        {
            InitializeComponent();
            this.ten = tenuser;
            this.quyen = quyenhan;
        }

        public Boolean click = false;

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
           
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            
                    
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
           
        }

        private void HoSoTamTru_Load(object sender, EventArgs e)
        {
            
               
        }

        private void getData2(AutoCompleteStringCollection dataCollection)
        {
        }
        private void getData(AutoCompleteStringCollection dataCollection)
        {
            
            
        }

        private void cbboxKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        public bool IsNumber(string pText)
        {
            Regex regex = new Regex(@"^[-+]?[0-9]*\.?[0-9]+$");
            return regex.IsMatch(pText);
        }
        public static string RemoveVietnameseTone(string text)
        {
            string result = text.ToLower();
            result = Regex.Replace(result, "à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|/g", "a");
            result = Regex.Replace(result, "è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|/g", "e");
            result = Regex.Replace(result, "ì|í|ị|ỉ|ĩ|/g", "i");
            result = Regex.Replace(result, "ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|/g", "o");
            result = Regex.Replace(result, "ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|/g", "u");
            result = Regex.Replace(result, "ỳ|ý|ỵ|ỷ|ỹ|/g", "y");
            result = Regex.Replace(result, "đ", "d");
            return result;
        }
        private void btTimSV_Click(object sender, EventArgs e)
        {
            
        }
        public static int count()
        {
            int kq;
            SqlConnection con = new SqlConnection(ConnectionString.connectionString);
            con.Open();
            String sql = "SELECT COUNT(*)FROM Hosotamtru";
            SqlCommand cmd = new SqlCommand(sql, con);
            kq = (int)cmd.ExecuteScalar();
            con.Close();
            return kq;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
           
                
        }

        private void btnfullback_Click(object sender, EventArgs e)
        {
            
        }

        private void btnback_Click(object sender, EventArgs e)
        {
            
        }

        private void btnnext_Click(object sender, EventArgs e)
        {
           
        }

        private void btnfullnext_Click(object sender, EventArgs e)
        {
           
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
           
        }
    }
}
