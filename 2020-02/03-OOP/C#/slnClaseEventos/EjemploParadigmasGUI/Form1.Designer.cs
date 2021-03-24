namespace EjemploParadigmasGUI
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonClickMe = new System.Windows.Forms.Button();
            this.buttonSaludar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // buttonClickMe
            // 
            this.buttonClickMe.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.buttonClickMe.Location = new System.Drawing.Point(102, 142);
            this.buttonClickMe.Name = "buttonClickMe";
            this.buttonClickMe.Size = new System.Drawing.Size(200, 100);
            this.buttonClickMe.TabIndex = 0;
            this.buttonClickMe.Text = "Hazme Click!";
            this.buttonClickMe.UseVisualStyleBackColor = false;
            this.buttonClickMe.Click += new System.EventHandler(this.buttonClickMe_Click);
            this.buttonClickMe.Click += new System.EventHandler(this.buttonClickMe_Click2);
            // 
            // buttonSaludar
            // 
            this.buttonSaludar.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.buttonSaludar.Location = new System.Drawing.Point(463, 142);
            this.buttonSaludar.Name = "buttonSaludar";
            this.buttonSaludar.Size = new System.Drawing.Size(200, 100);
            this.buttonSaludar.TabIndex = 1;
            this.buttonSaludar.Text = "Saludar";
            this.buttonSaludar.UseVisualStyleBackColor = false;
            this.buttonSaludar.Click += new System.EventHandler(this.buttonClickMe_Click2);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.buttonSaludar);
            this.Controls.Add(this.buttonClickMe);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonClickMe;
        private System.Windows.Forms.Button buttonSaludar;
    }
}

