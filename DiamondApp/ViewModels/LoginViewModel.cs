﻿using System;
using System.Data.Common;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DiamondApp.Tools;
using GalaSoft.MvvmLight.Command;
using ObservableObject = GalaSoft.MvvmLight.ObservableObject;

namespace DiamondApp.ViewModels
{
    public class LoginViewModel : ObservableObject
    {
        private DiamondDBEntities _ctx;
        private RelayCommand<PasswordBox> _loginCommand;
        // public Action CloseAction { get; set; } <- read on google to correct close the window

        private int _userId;
        private char _userType;
        private string _userLogin;

        public LoginViewModel()
        {
            _ctx = new DiamondDBEntities();
        }

        public string UserLogin
        {
            get { return _userLogin; }
            set
            {
                _userLogin = value;
                RaisePropertyChanged();
                _loginCommand.RaiseCanExecuteChanged(); // check if user can click login button
            }
        }

        public ICommand LoginCommand22
        {
            // if Login button clicked execute the login operation
            get
            {
                if (_loginCommand == null)
                {
                    _loginCommand = new RelayCommand<PasswordBox>((t) => LoginExecute(t), (t) => CanLoginExecute(t));
                }
                return _loginCommand;
            }          
        }

        // check if username is not empty
        private bool CanLoginExecute(PasswordBox arg)
        {
            if (string.IsNullOrEmpty(_userLogin))
                return false;
            return true;
        }

        // login logic
        private void LoginExecute(PasswordBox passBox)
        {
            var userList = (from u in _ctx.Users
                select new {u.Id, u.Login, u.Password,u.AccountPrivileges.AccountType}
                ).ToList();

            foreach (var user in userList)
            {
                //(user.Password == ShaConverter.sha256_hash(passBox.Password))\
                if (user.Login == _userLogin && user.Password == passBox.Password)
                {
                    _userId = user.Id;
                    MessageBox.Show(user.AccountType);
                    MessageBox.Show("Otworz nowe okno \n" +
                                    "Zamknij obecne");
                }
                else
                {
                    MessageBox.Show("Podana nazwa użytkownika i/lub hasło jest niepoprawne!" +
                                    "Spróbuj ponownie!");
                    _userLogin = string.Empty;
                    passBox.Clear();
                }
            }
        }
    }
}