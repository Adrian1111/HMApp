using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Windows;
using DiamondApp.Annotations;

namespace DiamondApp
{
    class MainWindowViewModel : INotifyPropertyChanged
    {
        DiamondDBEntities ctx = new DiamondDBEntities();

        public MainWindowViewModel()
        {
            MyMethod();
        }

        private void MyMethod()
        {
            var myQuerry = (from s in ctx.Proposition
                select s).ToList().Last();
            MessageBox.Show(myQuerry.Id.ToString());
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
