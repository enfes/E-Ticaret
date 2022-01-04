using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

namespace e_ticaret
{
    public class Urunlerdao
    {
        SqlDataReader oku;
        SqlCommand komut = new SqlCommand();
        SqlConnection bag = new Connection().baglantiyagec();
        public int urunkaydet(Urunler urun)
        {
            int sayi = 0;
            try
            {
                bag.Open();
                komut.CommandText = "insert into urunler " +
                    "(urunadi,fiyat,aciklama,resim,kateno,altkateno) values(@urunadi," +
                    "@fiyat,@aciklama,@resim,@kateno,@altkateno)";
                komut.Connection = bag;
                komut.Parameters.AddWithValue("@urunadi", urun.Urunadi);
                komut.Parameters.AddWithValue("@fiyat", urun.Fiyat);
                komut.Parameters.AddWithValue("@aciklama", urun.Aciklama);
                komut.Parameters.AddWithValue("@resim", urun.Resim);
                komut.Parameters.AddWithValue("@kateno", urun.Kategori.Kateno);
                komut.Parameters.AddWithValue("@altkateno", urun.Altkategori.Altkateno);
                sayi = komut.ExecuteNonQuery();
                bag.Close();
            }
            catch (SqlException)
            {
                sayi = -1;
            }
            catch (Exception)
            {
                sayi = -2;
            }
            finally
            {
                bag.Close();
            }
            return sayi;
        }
        public int sonurunno_getir()
        {
            bag.Open();
            komut.CommandText = "select max(urunid) from urunler";
            komut.Connection = bag;
            int sonurunid = Convert.ToInt32(komut.ExecuteScalar());
            bag.Close();
            return sonurunid;
        }

        public ArrayList urungetir()
        {
            ArrayList uruntorbasi = new ArrayList();
            bag.Open();
            SqlCommand komut = new SqlCommand("select * from urunler,kategoriler  where urunler.kateno=kategoriler.kateno order by urunadi", bag);
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read() == true)
            {
                Urunler uruns = new Urunler();
                uruns.Urunid = Convert.ToInt32(oku["urunid"]);
                uruns.Urunadi = oku["urunadi"].ToString();
                uruns.Fiyat = Convert.ToInt32(oku["fiyat"]);
                uruns.Aciklama = oku["aciklama"].ToString();
                Kategoriler kat = new Kategoriler();
                kat.Kateadi = oku["kateadi"].ToString();
                uruns.Kategori = kat;
                uruns.Resim = oku["resim"].ToString();
                uruntorbasi.Add(uruns);
            }
            oku.Close();
            bag.Close();
            return uruntorbasi;
        }

        public int urunsil(int urunid)
        {

            int s = 0;
            bag.Open();
            komut.CommandText = "Delete from urunler where urunid=@urunid";
            komut.Parameters.AddWithValue("@urunid", urunid);
            komut.Connection = bag;
            s = komut.ExecuteNonQuery();
            bag.Close();
            return s;
        }

        public int urunguncelle(int urunid, String urunadi, double fiyat, String aciklama, String resim, int kateno,int altkateno)
        {
            int sayi = 0;
            bag.Open();
            komut.CommandText = "update urunler set urunadi=@urunadi,fiyat=@fiyat,aciklama=@aciklama,resim=@resim,kateno=@kateno,altkateno=@altkateno where urunid=@urunid";
            komut.Parameters.AddWithValue("@urunadi", urunadi);
            komut.Parameters.AddWithValue("@fiyat", fiyat);
            komut.Parameters.AddWithValue("@aciklama", aciklama);
            komut.Parameters.AddWithValue("@resim", resim);
            komut.Parameters.AddWithValue("@kateno", kateno);
            komut.Parameters.AddWithValue("@altkateno", altkateno);
            komut.Parameters.AddWithValue("@urunid", urunid);

            komut.Connection = bag;
            sayi = komut.ExecuteNonQuery();

            bag.Close();

            return sayi;
        }

        public Urunler tekurungetir(int urunid)
        {
            bag.Open();
            komut.CommandText = "select * from  urunler,kategoriler,altkategoriler  where urunid=@urunid and urunler.kateno=kategoriler.kateno and urunler.altkateno=altkategoriler.altkateno ";
            komut.Parameters.AddWithValue("@urunid", urunid);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Urunler u = new Urunler();
            u.Urunid = Convert.ToInt32(oku["urunid"]);
            u.Urunadi = oku["urunadi"].ToString();
            u.Fiyat = Convert.ToDouble(oku["fiyat"]);
            u.Aciklama = oku["aciklama"].ToString();
            u.Resim = oku["resim"].ToString();
            Kategoriler k = new Kategoriler();
            k.Kateadi = oku["kateadi"].ToString();
            k.Kateno = Convert.ToByte(oku["kateno"]);
            u.Kategori = k;
            Altkategoriler a = new Altkategoriler();
            a.Altkateadi = oku["altkateadi"].ToString();
            a.Altkateno = Convert.ToByte(oku["altkateno"]);
            u.Altkategori = a;
            oku.Close();
            bag.Close();
            return u;
        }
        public Urunler tekurun(int urunid)
        {
            bag.Open();
            komut.CommandText = "select * from  urunler  where urunid=@urunid  ";
            komut.Parameters.AddWithValue("@urunid", urunid);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Urunler u = new Urunler();
            u.Urunid = Convert.ToInt32(oku["urunid"]);
            u.Urunadi = oku["urunadi"].ToString();
            u.Fiyat = Convert.ToDouble(oku["fiyat"]);
            u.Aciklama = oku["aciklama"].ToString();
            u.Resim = oku["resim"].ToString();
            oku.Close();
            bag.Close();
            return u;
        }

        public ArrayList sayfaliurungetir(int kateno, int baslangicyeri)
        {
            ArrayList urunlistesi = new ArrayList();
            bag.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("select * from urunler where kateno=@kateno", bag);
            adaptor.SelectCommand.Parameters.AddWithValue("@kateno", kateno);
            DataSet ds = new DataSet();
            adaptor.Fill(ds, baslangicyeri, 9, "urunler");
            foreach (DataRow datasatir in ds.Tables["urunler"].Rows)
            {
                Urunler ur = new Urunler();
                ur.Urunid = Convert.ToInt32(datasatir["urunid"]);
                ur.Urunadi = datasatir["urunadi"].ToString();
                ur.Fiyat = Convert.ToDouble(datasatir["fiyat"]);
                ur.Resim = datasatir["resim"].ToString();
                urunlistesi.Add(ur);
            }
            bag.Close();
            return urunlistesi;
        }
        public ArrayList altkategore(int altkateno, int baslangicyeri)
        {
            ArrayList urunlistesi = new ArrayList();
            bag.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("select * from urunler where altkateno=@altkateno", bag);
            adaptor.SelectCommand.Parameters.AddWithValue("@altkateno", altkateno);
            DataSet ds = new DataSet();
            adaptor.Fill(ds, baslangicyeri, 9, "urunler");
            foreach (DataRow datasatir in ds.Tables["urunler"].Rows)
            {
                Urunler ur = new Urunler();
                ur.Urunid = Convert.ToInt32(datasatir["urunid"]);
                ur.Urunadi = datasatir["urunadi"].ToString();
                ur.Fiyat = Convert.ToDouble(datasatir["fiyat"]);
                ur.Resim = datasatir["resim"].ToString();
                urunlistesi.Add(ur);
            }
            bag.Close();
            return urunlistesi;
        }


        public int urunsayisi(int kateno)
        {
            bag.Open();
            komut.CommandText = "select count(*) from urunler where kateno=@kateno";
            komut.Connection = bag;
            komut.Parameters.AddWithValue("@kateno", kateno);
            int sayi = Convert.ToInt32(komut.ExecuteScalar());
            bag.Close();
            return sayi;
        }
        public int urunler()
        {
            ArrayList urunlistesi = new ArrayList();
            bag.Open();
            komut.CommandText = "select count(*) from urunler";
            komut.Connection = bag;
            int urunsayi=Convert.ToInt32(komut.ExecuteScalar());
            bag.Close();
            return urunsayi;
        }
    }
}