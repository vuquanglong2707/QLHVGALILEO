using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BaiTapLonN6
{
    public partial class FrmQLGiangVien : Form
    {
        private String magiangvien;
        private String quyenhan;
        public FrmQLGiangVien(String user,String quyen)
        {
            InitializeComponent();
            this.magiangvien = user;
            this.quyenhan = quyen;
        }

        private void FrmQLGiangVien_Load(object sender, EventArgs e)
        {
           
        
        }

        private void btnThemMoi_Click(object sender, EventArgs e)
        {
          
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

        }

        private void btnOK_Click(object sender, EventArgs e)
        {
 
        }

        private void btnCanCel_Click(object sender, EventArgs e)
        {
           
        }

        private void btnchonhinh_Click(object sender, EventArgs e)
        {
            
        }

        private void btnLoadDSGV_Click(object sender, EventArgs e)
        {
        }

        private void radioButtonTatCa_CheckedChanged(object sender, EventArgs e)
        {
            cbboxchonkhoa.Enabled = false;
        }

        private void radioButtonTheoKhoa_CheckedChanged(object sender, EventArgs e)
        {
           
        }

        private void cbboxKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }
        //public static string RemoveVietnameseTone(string text)
        //{
           
        //}

        private void btTimGV_Click(object sender, EventArgs e)
        {
           
        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
          
        }
    }
}
