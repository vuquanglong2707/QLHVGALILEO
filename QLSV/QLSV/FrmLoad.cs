using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using app = Microsoft.Office.Interop.Excel.Application;
namespace BaiTapLonN6
{
    public partial class FrmLoad : Form
    {
        private DataGridView data;
        private String ddan;
        private static float Number;
        public FrmLoad(DataGridView g, String duongdan)
        {
            InitializeComponent();
            data = g;
            ddan = duongdan;
            Control.CheckForIllegalCrossThreadCalls = false;
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e) //dowork thực hiện xong, completed sẽ được gọi
        {
           
        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            
        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            
        }
   
        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
        }

        private void FrmLoad_Load(object sender, EventArgs e)
        {
            
        }
    }
}
