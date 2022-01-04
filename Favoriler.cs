using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Favoriler
    {
        private int favno;
        private Uyeler uyeid;
        private Urunler urunid;

        public int Favno { get => favno; set => favno = value; }
        public Uyeler Uyeid { get => uyeid; set => uyeid = value; }
        public Urunler Urunid { get => urunid; set => urunid = value; }
    }
}