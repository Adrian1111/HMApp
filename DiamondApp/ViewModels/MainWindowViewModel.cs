using System.Linq;
using System.Windows;
using DiamondApp.Tools;

namespace DiamondApp.ViewModels
{
    class MainWindowViewModel : ObservableObject
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
    }
}
