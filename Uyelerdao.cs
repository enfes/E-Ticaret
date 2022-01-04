using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;

namespace e_ticaret
{
    public class Uyelerdao
    {
        SqlDataReader oku;
        ArrayList uyelistesi = new ArrayList();
        SqlCommand komut = new SqlCommand();
        SqlConnection bag = new Connection().baglantiyagec();
        public ArrayList tumuyeler()
        {
            bag.Open();
            komut.Connection = bag;
            komut.CommandText = "select * from uyeler";
            Arraylisteyaz();
            bag.Close();
            return uyelistesi;

        }
        public ArrayList kriteregore_uyegetir(String email, int plaka)
        {

            bag.Open();
            komut.Connection = bag;
            if (plaka == 0)
            {
                komut.CommandText = "select * from uyeler,sehirler,meslek" +
                         " where uyeler.plaka=sehirler.plaka and " +
                "uyeler.meslekid=meslek.meslekid and email like'%" + email + "'";
            }//if
            else
            {
                komut.CommandText = "select * from uyeler,sehirler,meslek" +
                        " where uyeler.plaka=sehirler.plaka and " +
               "uyeler.meslekid=meslek.meslekid and uyeler.plaka=" + plaka;
            }//else
            Arraylisteyaz();
            bag.Close();
            return uyelistesi;
        }
        private void Arraylisteyaz()
        {
            oku = komut.ExecuteReader();
            while (oku.Read())
            {
                Uyeler yeniuye = new Uyeler();
                yeniuye.Uyeid = Convert.ToInt32(oku["uyeid"]);
                yeniuye.Adsoyad = oku[3].ToString();
                yeniuye.Kuladi = oku["kuladi"].ToString();
                yeniuye.Sifre = oku["sifre"].ToString();
                yeniuye.Dogtar = Convert.ToDateTime(oku["dogtar"]);
                yeniuye.Cinsiyet = oku["cinsiyet"].ToString();
                yeniuye.Adres = oku["adres"].ToString();
                yeniuye.Email = oku["email"].ToString();
                if (oku["onay"] is DBNull)//vt içerik null ise
                    yeniuye.Onay = false;
                else
                    yeniuye.Onay = Convert.ToBoolean(oku["onay"]);
                uyelistesi.Add(yeniuye);

            }
            oku.Close();
        }//arraylisteyaz

        public int uyekaydet(string kuladi, string sifre, string adsoyad, DateTime dogtar, String cinsiyet, string adres,string email)
        {
            int sayi = 0;
            try
            {
                bag.Open();
                komut.CommandText = "insert into uyeler (kuladi,sifre,adsoyad,dogtar,cinsiyet,adres,email) values (@kuladi,@sifre,@adsoyad,@dogtar,@cinsiyet,@adres,@email)";

                komut.Parameters.AddWithValue("@kuladi", kuladi);
                komut.Parameters.AddWithValue("@sifre", sifre);
                komut.Parameters.AddWithValue("@adsoyad", adsoyad);
                komut.Parameters.AddWithValue("@dogtar", dogtar);
                komut.Parameters.AddWithValue("@adres", adres);
                komut.Parameters.AddWithValue("@cinsiyet", cinsiyet);
                komut.Parameters.AddWithValue("@email", email);
                komut.Connection = bag;
                sayi = komut.ExecuteNonQuery();

                bag.Close();
            }
            catch (SqlException hatamsj)
            {
                if (hatamsj.Message.IndexOf("uk_kuladi") != -1)
                    sayi = -1;
                else
                    sayi = -2;
            }
            catch (Exception)
            {
                sayi = -3;
            }
            return sayi;
        }

        public static ArrayList kullaniciliste = new ArrayList();
        static int sayac = 0;

        public static void kullaniciadioner(string kuladi)
        {
            System.Threading.Thread.Sleep(800);
            SqlConnection baglanti = new Connection().baglantiyagec();
            String[] harfler = { "a", "b", "c", "d", "e" };
            String harf = harfler[new Random().Next(0, 4)];
            String rakam = new Random().Next(0, 9).ToString();
            String yenikuladi = kuladi + harf + rakam;
            baglanti.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = baglanti;
            cmd.CommandText = "select count(*) from uyeler where kuladi=@kuladi";
            cmd.Parameters.AddWithValue("@kuladi", yenikuladi);
            int kont = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            if (kont == 0)
            {
                kullaniciliste.Add(yenikuladi);
                sayac++;
            }
            baglanti.Close();
            if (sayac != 5)
            {
                kullaniciadioner(kuladi);
            }
        }

        public int uyesil(int uyeid)
        {
            int s = 0;
            bag.Open();
            komut.CommandText = "Delete from uyeler where uyeid=@uyeid";
            komut.Parameters.AddWithValue("@uyeid", uyeid);
            komut.Connection = bag;
            s = komut.ExecuteNonQuery();
            bag.Close();
            return s;

        }

        public Uyeler tekuyegetir(int uyeid)
        {
            bag.Open();
            komut.CommandText = "select * from uyeler where  uyeid=@uyeid";
            komut.Parameters.AddWithValue("@uyeid", uyeid);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Uyeler uyem = new Uyeler();
            uyem.Uyeid = Convert.ToInt32(oku["uyeid"]);
            uyem.Adsoyad = oku["adsoyad"].ToString();
            uyem.Kuladi = oku["kuladi"].ToString();
            uyem.Sifre = oku["sifre"].ToString();
            uyem.Dogtar = Convert.ToDateTime(oku["dogtar"]);
            uyem.Cinsiyet = oku["cinsiyet"].ToString();
            uyem.Adres = oku["adres"].ToString();
            uyem.Email = oku["email"].ToString();
            if (oku["onay"] is DBNull)//vt içerik null ise
                uyem.Onay = false;
            else
                uyem.Onay = Convert.ToBoolean(oku["onay"]);
            oku.Close();
            bag.Close();
            return uyem;
        }

        public int uyeguncelle(string kuladi, string sifre, string adsoyad, DateTime dogtar, String cinsiyet, string adres, string email, int uyeid)
        {
            int sayi = 0;
            try
            {
                bag.Open();
                komut.CommandText = "update uyeler set kuladi=@kuladi,sifre=@sifre,adsoyad=@adsoyad,dogtar=@dogtar,adres=@adres,cinsiyet=@cinsiyet,email=@email where uyeid=@uyeid";

                komut.Parameters.AddWithValue("@kuladi", kuladi);
                komut.Parameters.AddWithValue("@sifre", sifre);
                komut.Parameters.AddWithValue("@adsoyad", adsoyad);
                komut.Parameters.AddWithValue("@dogtar", dogtar);
                komut.Parameters.AddWithValue("@adres", adres);
                komut.Parameters.AddWithValue("@cinsiyet", cinsiyet);
                komut.Parameters.AddWithValue("@email", email);
                komut.Parameters.AddWithValue("@uyeid", uyeid);
                komut.Connection = bag;
                sayi = komut.ExecuteNonQuery();

                bag.Close();
            }
            catch (SqlException hatamsj)
            {
                if (hatamsj.Message.IndexOf("uk_kuladi") != -1)
                    sayi = -1;
                else
                    sayi = -2;
            }
            catch (Exception)
            {
                sayi = -3;
            }
            return sayi;

        }

        public Uyeler uyegiriskontrol(String kuladi, String sifre)
        {
            Uyeler uyem = new Uyeler();
            try
            {
                bag.Open();
                komut.CommandText = "select * from uyeler where kuladi=@kuladi and sifre=@sifre";
                komut.Connection = bag;
                komut.Parameters.AddWithValue("@kuladi", kuladi);
                komut.Parameters.AddWithValue("@sifre", sifre);
                oku = komut.ExecuteReader();
                oku.Read();
                uyem.Adsoyad = oku["adsoyad"].ToString();
                uyem.Uyeid = Convert.ToInt32(oku["uyeid"]);
                oku.Close();
                bag.Close();
            }
            catch (Exception)
            {

            }
            return uyem;
        }
    }
}