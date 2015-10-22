using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DiamondApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {

        public ObservableCollection<SubBox> SubFields
        {
            get
            {
                if (_subFields == null)
                {
                    _subFields = new ObservableCollection<SubBox>()
                    { 
                        new SubBox("1", "5", "9"),
                        new SubBox("2", "6", "10"),
                        new SubBox("3", "7", "11"), 
                        new SubBox("4", "8", "12"),
                    };
                }

                return _subFields;
            }
        }private ObservableCollection<SubBox> _subFields;

        public Element ElementView
        {
            get { return _element; }
            set
            {
                if (value == _element) return;

                _element = value;
                this.OnPropertyChanged("ElementView");
            }
        }private Element _element;


        public MainWindow()
        {
            InitializeComponent();
            ElementView = Element.Propozycje;
            mainWindow.DataContext = this;
        }

        #region INotifyPropertyChanged Members

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = this.PropertyChanged;
            if (handler != null)
            {
                var e = new PropertyChangedEventArgs(propertyName);
                handler(this, e);
            }
        }

        #endregion
    }
}
