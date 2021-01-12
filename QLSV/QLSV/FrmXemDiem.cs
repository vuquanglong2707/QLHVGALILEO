using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BaiTapLonN6
{
    public partial class FrmXemDiem : Form
    {
        private String MaSinhVien;
        public FrmXemDiem(String MaSV)
        {
            InitializeComponent();
            this.MaSinhVien = MaSV;
        }

        private void FrmXemDiem_Load(object sender, EventArgs e)
        {
            
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
          
        }

        private void radioTheoNHHK_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        private void dataGridView2_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            
        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
           
        }
    }
}
