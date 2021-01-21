using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BaiTapLonN6
{
    public partial class FrmGiangVienNhapDiemMonHoc : Form
    {
        private String magiangvien;
        private static String duongdan = null;
        static String MMH;
        static String NamHocCuaLopHocPhan;
        public FrmGiangVienNhapDiemMonHoc(String mgv)
        {
            InitializeComponent();
            this.magiangvien = mgv;
        }






        private void FrmGiangVienNhapDiemMonHoc_Load(object sender, EventArgs e)
        {
            
        }


   

        private void simpleButton1_Click(object sender, EventArgs e)
        {
           
        }

        private void btnXuatExCel_Click(object sender, EventArgs e)
        {
            
            }




        private void btnloadsv_Click(object sender, EventArgs e)
        {
           
        }



        private void simpleButton2_Click(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_DataBindingComplete(object sender, DataGridViewBindingCompleteEventArgs e)
        {
            dataGridView1.ClearSelection();
        }
    }
}
