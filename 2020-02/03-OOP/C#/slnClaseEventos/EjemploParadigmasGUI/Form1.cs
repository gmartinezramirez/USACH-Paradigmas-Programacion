using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EjemploParadigmasGUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void buttonClickMe_Click(object sender, EventArgs e)
        {
            
            MouseEventArgs mea = (MouseEventArgs)e;
            Button b = (Button)sender;
            
            MessageBox.Show(b.Name + ": Me han hecho un click en " + mea.Location);

        }

        private void buttonClickMe_Click2(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            

            MessageBox.Show(b.Name + ": Yo también estoy manejando el evento");

        }
    }
}
