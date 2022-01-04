using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace e_ticaret
{
    public class Kategoriler
    {
        private byte kateno;
        private String kateadi;

        public byte Kateno { get => kateno; set => kateno = value; }
        public string Kateadi { get => kateadi; set => kateadi = value; }
    }
}