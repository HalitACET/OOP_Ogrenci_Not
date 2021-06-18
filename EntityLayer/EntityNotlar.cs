using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer
{
   public class EntityNotlar
    {
        private int OgrID;
        private string Ad;
        private string Soyad;
        
        int _Sinav1;
        int _Sinav2;
        int _Sinav3;
        int _Proje;
        double _Ortalama;
        string _Durum;

        public int OgrID1 { get => OgrID; set => OgrID = value; }
        public string Ad1 { get => Ad; set => Ad = value; }
        public string Soyad1 { get => Soyad; set => Soyad = value; }
        
        public int Sinav1 { get => _Sinav1; set => _Sinav1 = value; }
        public int Sinav2 { get => _Sinav2; set => _Sinav2 = value; }
        public int Sinav3 { get => _Sinav3; set => _Sinav3 = value; }
        public int Proje { get => _Proje; set => _Proje = value; }
        public double Ortalama { get => _Ortalama; set => _Ortalama = value; }
        public string Durum { get => _Durum; set => _Durum = value; }
        
    }
}
