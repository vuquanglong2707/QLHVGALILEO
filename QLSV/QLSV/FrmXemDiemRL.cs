using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

using DataTable = System.Data.DataTable;

namespace BaiTapLonN6
{
    public partial class FrmXemDiemRL : Form
    {
        private String quyenhan;
        private String username;
        public FrmXemDiemRL(String quyenhan,String MaSV)
        {
            InitializeComponent();
            this.quyenhan = quyenhan;
            this.username = MaSV;
        }

        static String duongdan=null;
        public Boolean click = false;

        private void FrmXemDiemRL_Load(object sender, EventArgs e)
        {
           
          
        }

        private void export2Excel(DataGridView g,String duongdan)
        {
           
        }
        private void cbboxChonkhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cbboxChonlop_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void btnLoadDanhSach_Click(object sender, EventArgs e)
        {
           
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
              
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void btnChonDuongDan_Click(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            
        }

        private void cbboxNamHoc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void radioButtonHK1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
