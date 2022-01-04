using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

namespace e_ticaret
{
    public class Siparislerdao
    {
        SqlDataReader oku;
        SqlCommand komut = new SqlCommand();
        SqlConnection bag = new Connection().baglantiyagec();

        public int sipariskaydet(int uyeid, ArrayList musterisepet)
        {
            bag.Open();
            komut.CommandText = "select max(sipno) from siparisler";
            komut.Connection = bag;
            int son_sipno = Convert.ToInt32(komut.ExecuteScalar());
            int yeni_sipno = son_sipno + 1;
            foreach (Sepet sepettekiurun in musterisepet)
            {
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = bag;
                cmd2.CommandText = "insert into siparisler(" +
                    "sipno,uyeid,urunid,adet,sip_tarihi)values(" +
                    "@sipno,@uyeid,@urunid,@adet,@sip_tarihi)";
                cmd2.Parameters.AddWithValue("@sipno", yeni_sipno);
                cmd2.Parameters.AddWithValue("@uyeid", uyeid);
                cmd2.Parameters.AddWithValue("urunid", sepettekiurun.Urun.Urunid);
                cmd2.Parameters.AddWithValue("@adet", sepettekiurun.Adet);
                cmd2.Parameters.AddWithValue("sip_tarihi", DateTime.Now);
                cmd2.ExecuteNonQuery();

            }
            bag.Close();
            return yeni_sipno;
        }

        public Siparisler teksip(int uyeid)
        {
            bag.Open();
            komut.CommandText = "select * from siparisler where uyeid=@uyeid";
            komut.Parameters.AddWithValue("@uyeid", uyeid);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Siparisler siparis = new Siparisler();
            siparis.Adet = Convert.ToInt32(oku["adet"]);
            siparis.Sipno = Convert.ToInt32(oku["sipno"]);
            siparis.Sip_tarihi = Convert.ToDateTime(oku["sip_tarihi"]);
            Urunler ur = new Urunler();
            ur.Resim = oku["resim"].ToString();
            siparis.Urun = ur;


            oku.Close();
            bag.Close();
            return siparis;
        }

    }
}