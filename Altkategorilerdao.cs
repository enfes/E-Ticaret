using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

namespace e_ticaret
{
    public class Altkategorilerdao
    {
        ArrayList altkateliste = new ArrayList();
        SqlDataReader oku;
        SqlCommand komut = new SqlCommand();
        SqlConnection bag = new Connection().baglantiyagec();
        public ArrayList alttumu()
        {
            ArrayList aktorbasi = new ArrayList();
            bag.Open();
            SqlCommand komut = new SqlCommand("select * from altkategoriler,kategoriler where altkategoriler.anakateno=kategoriler.kateno order by altkateadi", bag);
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read() == true)
            {
                Altkategoriler altkat = new Altkategoriler();
                altkat.Altkateno = Convert.ToByte(oku["altkateno"]);
                altkat.Altkateadi = oku["altkateadi"].ToString();
                Kategoriler kat = new Kategoriler();
                kat.Kateadi = oku["kateadi"].ToString();
                altkat.Kategori = kat;
                aktorbasi.Add(altkat);
            }
            oku.Close();
            bag.Close();
            return aktorbasi;
        }
        public int altkatekaydet(Altkategoriler altkate)
        {
            int sayi = 0;
            try
            {
                bag.Open();
                komut.CommandText = "insert into altkategoriler (altkateadi,anakateno) values (@altkateadi,@anakateno)";
                komut.Connection = bag;
                komut.Parameters.AddWithValue("@altkateadi",altkate.Altkateadi);
                komut.Parameters.AddWithValue("@anakateno", altkate.Kategori.Kateno);
                sayi = komut.ExecuteNonQuery();

                bag.Close();
            }
            catch (SqlException)
            {
                sayi = -1;
            }
            catch (Exception)
            { sayi = -2; }

            return sayi;

        }
        public int altkateesil(int altkateno)
        {
            int s = 0;
            bag.Open();
            komut.CommandText = "Delete from altkategoriler where altkateno=@altkateno";
            komut.Parameters.AddWithValue("@altkateno", altkateno);
            komut.Connection = bag;
            s = komut.ExecuteNonQuery();
            bag.Close();
            return s;

        }
        public int altkateguncelle(String altkateadi, int altkateno)
        {
            int sayi = 0;

            bag.Open();
            komut.CommandText = "update altkategoriler set altkateadi=@altkateadi where altkateno=@altkateno";
            komut.Parameters.AddWithValue("@altkateadi", altkateadi);
            komut.Parameters.AddWithValue("@altkateno", altkateno);
            komut.Connection = bag;
            sayi = komut.ExecuteNonQuery();

            bag.Close();

            return sayi;
        }
        public int guncelle(String altkateadi, int anakateno)
        {
            int sayi = 0;

            bag.Open();
            komut.CommandText = "update altkategoriler,kategoriler set altkateadi=@altkateadi where anakateno=@anakateno";
            komut.Parameters.AddWithValue("@altkateadi", altkateadi);
            komut.Parameters.AddWithValue("@anakateno", anakateno);
            komut.Connection = bag;
            sayi = komut.ExecuteNonQuery();
            bag.Close();
            return sayi;
        }
        public ArrayList tekaltkategetir(int anakateno)
        {
            ArrayList altktorba = new ArrayList();
            bag.Open();
            komut.Connection = bag;
            komut.CommandText = "select * from altkategoriler,kategoriler" +
                         " where altkategoriler.anakateno=kategoriler.kateno and altkategoriler.anakateno=" + anakateno;
            oku = komut.ExecuteReader();
            while (oku.Read())
            {
                Altkategoriler altkate = new Altkategoriler();
                altkate.Altkateadi = oku["altkateadi"].ToString();
                altkate.Altkateno = Convert.ToByte(oku["altkateno"]);
                
                altktorba.Add(altkate);

            }
            oku.Close();
            return altktorba;
        }
        public Altkategoriler tekalt(int altkateno)
        {
            bag.Open();
            komut.CommandText = "select * from altkategoriler,kategoriler where altkateno=@altkateno";
            komut.Parameters.AddWithValue("@altkateno", altkateno);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Altkategoriler akat = new Altkategoriler();
            akat.Altkateno = Convert.ToByte(oku["altkateno"]);
            akat.Altkateadi = oku["altkateadi"].ToString();

            oku.Close();
            bag.Close();
            return akat;
        }
        public ArrayList tekaltkate(int altkateno)
        {
            ArrayList altktorba = new ArrayList();
            bag.Open();
            komut.Connection = bag;
            komut.CommandText = "select * from altkategoriler,kategoriler" +
                         " where altkategoriler.anakateno=kategoriler.kateno and altkategoriler.anakateno";
            oku = komut.ExecuteReader();
            while (oku.Read())
            {
                Altkategoriler altkate = new Altkategoriler();
                altkate.Altkateadi = oku["altkateadi"].ToString();
                altkate.Altkateno = Convert.ToByte(oku["altkateno"]);

                altktorba.Add(altkate);

            }
            oku.Close();
            return altktorba;
        }
        public ArrayList kriteregore_tekalt(int altkateno)
        {
            bag.Open();
            komut.Connection = bag;
                komut.CommandText = "select * from altkategoriler,kategoriler where altkategoriler.altkateno=kategoriler.kateno and altkategoriler.altkateno=" + altkateno;
            oku = komut.ExecuteReader();
            while (oku.Read())
            {
                Altkategoriler altkate = new Altkategoriler();
                altkate.Kategori.Kateno = Convert.ToByte(oku["kateno"]);
                altkateliste.Add(altkate);
            }
            oku.Close();
            bag.Close();
            return altkateliste;
        }
    }
}