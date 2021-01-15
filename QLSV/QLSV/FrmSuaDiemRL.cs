using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BaiTapLonN6
{
    
    public partial class FrmSuaDiemRL : Form
    {
        private String Masodiem;
        private String MSV;
        private String Hoten;
        private String Lop;
        private String Namhoc;
        private String Hocky;
        private String tongdiem;

        public FrmSuaDiemRL()
        {
            InitializeComponent();
        }
        public FrmSuaDiemRL(String Masodiem,String MSV,String Hoten,String lop,String namhoc,String hocky,String tongdiem)
        {
            
            InitializeComponent();
            this.Masodiem = Masodiem;
            this.MSV = MSV;
            this.Hoten = Hoten;
            this.Lop = lop;
            this.Namhoc = namhoc;
            this.Hocky = hocky;
            this.tongdiem = tongdiem;
        }

        private void FrmSuaDiemRL_Load(object sender, EventArgs e)
        {
        }
        

        private void button1_Click(object sender, EventArgs e)
        {
            
                
        }

        private void txtTongDiemRL_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void txtTongDiemRL_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
           
            }
        }
    }

