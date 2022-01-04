using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Altkategoriler
    {
        private byte altkateno;
        private String altkateadi;
        private Kategoriler kategori;

        public byte Altkateno { get => altkateno; set => altkateno = value; }
        public string Altkateadi { get => altkateadi; set => altkateadi = value; }
        public Kategoriler Kategori { get => kategori; set => kategori = value; }
    }
}