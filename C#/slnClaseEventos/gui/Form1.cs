using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using modelo;

namespace gui
{
    public partial class Form1 : Form
    {
        Sistema miSistema = new Sistema();

        public Form1()
        {
            InitializeComponent();
        }

        private void buttonRegister_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario(textBoxUser.Text, textBoxPassword.Text);

            if (miSistema.register(u))
            {
                MessageBox.Show("Registro Exitoso");
                loadUsers();
            }
            else
                MessageBox.Show("El usuario ya existe");
        }

        private void loadUsers()
        {
            listBoxUsers.Items.Clear();
            listBoxUsers.Items.AddRange(miSistema.usuarios.ToArray());
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            Usuario u = new Usuario(textBoxUser.Text, textBoxPassword.Text);

            if (miSistema.login(u))
            {
                MessageBox.Show(u + " ha iniciado sesión");
                textBoxActiveUser.Text = u.ToString();
            }
            else
                MessageBox.Show("El usuario no existe o la contraseña es incorrecta");

        }

        private void buttonLogout_Click(object sender, EventArgs e)
        {
            textBoxActiveUser.Text = "";
            miSistema.logout();
        }

        private void listBoxUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            textBoxPassword.Text = "";
            textBoxUser.Text = listBoxUsers.SelectedItem.ToString();
        }
    }
}
