using System;
using System.Collections.Generic;
using System.Text;

namespace modelo
{
    public class Sistema
    {
        public List<Usuario> usuarios = new List<Usuario>();

        private Usuario _loggedUser = null;

        public Usuario LoggedUser
        {
            get
            {
                return this._loggedUser;

            }
        }

        public bool register(Usuario u)
        {
            if (!usuarios.Contains(u))
            {
                usuarios.Add(u);
                return true;
            }
            return false;
        }

        public bool login(Usuario u)
        {
            if (LoggedUser != null)
                return false;

            if (usuarios.Contains(u))
            {
                _loggedUser = u;
                return true;
            }
            else
                return false;
        }

        public void logout()
        {
            _loggedUser = null;
        }
    }
}
