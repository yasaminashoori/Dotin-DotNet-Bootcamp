using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WFCalculator
{
    public partial class InputName : Form
    {
        public InputName()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var greetingName = textBox1.Text;

            var message = $"خوش آمدید کاربر عزیز {greetingName}";

            MessageBox.Show(message,"پیام سیستم", MessageBoxButtons.OK, MessageBoxIcon.Information);

        }
    }
}
