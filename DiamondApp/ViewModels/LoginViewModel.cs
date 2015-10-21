using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Common;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using DiamondApp.Annotations;

namespace DiamondApp.ViewModels
{
    public class LoginViewModel : INotifyPropertyChanged
    {
        private DiamondDBEntities _ctx;
        private int _userId;

        public LoginViewModel(int loggedUserId, DiamondDBEntities dbContext)
        {
            _userId = loggedUserId;
            _ctx = dbContext;
        }

        public bool TestConnection()
        {
            using (var db = new DiamondDBEntities())
            {
                DbConnection conn = db.Database.Connection;
                try
                {
                    conn.Open();   // check the database connection
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }


        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            var handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
