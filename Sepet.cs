using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Sepet
    {
        private Urunler urun;
        private int adet;

        public Urunler Urun { get => urun; set => urun = value; }
        public int Adet { get => adet; set => adet = value; }
    }
}