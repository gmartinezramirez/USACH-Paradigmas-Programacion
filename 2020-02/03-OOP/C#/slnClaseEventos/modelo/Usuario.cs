using System;
using System.Collections.Generic;
using System.Text;

namespace modelo
{
    public class Usuario
    {
        private string _user;
        private string _password;

        public string User
        {
            set {
                if (!value.Equals(""))
                    _user = value;
                else
                    _user = "";
            }

            get {
                return this._user;
            }
        }

        public string Password
        {
            set {
                if ((!value.Equals("")) && (!value.Equals(_user)))
                    _password = value;
            }  
        }

        public Usuario(string user, string password)
        {
            this.User = user;
            this.Password = password;
        }

        public override bool Equals(object obj)
        {
            if (obj == null)
                return false;

            Usuario uTmp = obj as Usuario;

            if ((System.Object)uTmp == null)
                return false;

            return ((this._user.Equals(uTmp._user)) && (this._password.Equals(uTmp._password)));
        }

        public override string ToString()
        {
            return User;
        }

    }
}
