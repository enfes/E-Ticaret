using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace e_ticaret
{
    public class Urunler
    {
        private int urunid;
        private String urunadi;
        private double fiyat;
        private String aciklama;
        private String resim;
        private Kategoriler kategori;
        private Altkategoriler altkategori;

        public int Urunid { get => urunid; set => urunid = value; }
        public string Urunadi { get => urunadi; set => urunadi = value; }
        public double Fiyat { get => fiyat; set => fiyat = value; }
        public string Aciklama { get => aciklama; set => aciklama = value; }
        public string Resim { get => resim; set => resim = value; }
        public Kategoriler Kategori { get => kategori; set => kategori = value; }
        public Altkategoriler Altkategori { get => altkategori; set => altkategori = value; }
    }
}