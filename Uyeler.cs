using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Uyeler
    {
        private int uyeid;
        private String sifre;
        private String kuladi;
        private String adsoyad;
        private DateTime dogtar;
        private String cinsiyet;
        private String adres;
        private String email;
        private bool onay;

        public int Uyeid { get => uyeid; set => uyeid = value; }
        public string Sifre { get => sifre; set => sifre = value; }
        public string Kuladi { get => kuladi; set => kuladi = value; }
        public string Adsoyad { get => adsoyad; set => adsoyad = value; }
        public DateTime Dogtar { get => dogtar; set => dogtar = value; }
        public string Adres { get => adres; set => adres = value; }
        public string Email { get => email; set => email = value; }
        public bool Onay { get => onay; set => onay = value; }
        public string Cinsiyet { get => cinsiyet; set => cinsiyet = value; }
    }
}