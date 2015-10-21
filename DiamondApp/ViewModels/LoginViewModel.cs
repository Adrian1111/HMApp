using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Common;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DiamondApp.Annotations;
using DiamondApp.Tools;
using GalaSoft.MvvmLight.Command;

namespace DiamondApp.ViewModels
{
    public class LoginViewModel : ObservableObject
    {
        private DiamondDBEntities _ctx;
        private int _userId;
        private ICommand _loginCommand;
        private string _userLogin;
        private string _userPassword;

        public LoginViewModel()
        {
            _ctx = new DiamondDBEntities();
        }

        public ICommand LoginCommand
        {//            get { return new RelayCommand<PasswordBox>(LoginExecute, pb => CanLoginExecute()); }

            get { return new RelayCommand<PasswordBox>((p) => LoginExecute(p),(p) => CanLoginExecute(p)); }

        }

        private bool CanLoginExecute(PasswordBox arg)
        {
            if (string.IsNullOrEmpty(_userLogin))
                return false;
            return true;
        }

        private void LoginExecute(PasswordBox obj)
        {
            MessageBox.Show("u can");
        }

        public string UserLogin
        {
            get { return _userLogin; }
            set
            {
                _userLogin = value;
                RaisePropertyChanged("UserLogin");
                MessageBox.Show(_userLogin);
            }
        }

        public bool TestConnection()
        {
            using (var db = new DiamondDBEntities())
            {
                DbConnection conn = db.Database.Connection;
                try
                {
                    conn.Open(); // check the database connection
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}
