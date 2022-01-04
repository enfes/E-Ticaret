using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Siparisler
    {
        private Uyeler uyeid;
        private Urunler urun;
        private int adet;
        private DateTime sip_tarihi;
        private int sipno;
        private int kayitno;

        public Uyeler Uyeid { get => uyeid; set => uyeid = value; }
        public Urunler Urun { get => urun; set => urun = value; }
        public int Adet { get => adet; set => adet = value; }
        public DateTime Sip_tarihi { get => sip_tarihi; set => sip_tarihi = value; }
        public int Sipno { get => sipno; set => sipno = value; }
        public int Kayitno { get => kayitno; set => kayitno = value; }
    }
}