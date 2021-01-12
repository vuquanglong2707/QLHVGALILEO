using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace BaiTapLonN6
{
    public partial class HoSoSinhVien : Form
    {
        static String imgLoc = "";
        SqlConnection con = new SqlConnection(ConnectionString.connectionString);
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet ds = new DataSet();
        static int start;
        int page;
        static String trangthai="";
        static String TimKiem = "";
        static String Quyen = "";
        static String username = "";
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
        public HoSoSinhVien(String quyenhan,String user)
        {
            InitializeComponent();
            start = 0;
            page = 1;
            Quyen = quyenhan;
            username = user;
            Control.CheckForIllegalCrossThreadCalls = false;
        }
        public Boolean click = false;
        
        private void btThemSV_Click(object sender, EventArgs e)
        {
           
        }
        private void LoadTheme()
        {
            
        }

        private void HoSoSinhVien_Load_1(object sender, EventArgs e)
        {

            
        }
        private void getData(AutoCompleteStringCollection dataCollection)
        {
            
        }
        private void getData2(AutoCompleteStringCollection dataCollection)
        {
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void btLoadSV_Click(object sender, EventArgs e)
        {
            
        }

        private void cbboxKhoa1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        


        private void cbboxLop1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cbboxTinhThanhPho1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cbboxQuanHuyen1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cbboxchonkhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void btSuaSV_Click(object sender, EventArgs e)
        {
            
        }

        private void btXoaSV_Click(object sender, EventArgs e)
        {
            
        }

        private void txtSDT1_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void txtCMND1_KeyPress(object sender, KeyPressEventArgs e)
        {
           
        }

        private void txtNamNhapHoc1_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void cbboxchonkhoa_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }
       

        private void btTimSV_Click(object sender, EventArgs e)
        {
            
        }

        private void txtCMND1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void btnback_Click(object sender, EventArgs e)
        {
            
            
        }
        
        private void btnnext_Click(object sender, EventArgs e)
        {
            
        }

        private void btnfullback_Click(object sender, EventArgs e)
        {
            
        }

        private void btnfullnext_Click(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
           
        }
    }
}
