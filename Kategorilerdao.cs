using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;

namespace e_ticaret
{
    public class Kategorilerdao
    {
        SqlCommand komut = new SqlCommand();

        SqlConnection bag = new Connection().baglantiyagec();
        public ArrayList tumkategorileri_getir()
        {
            ArrayList katetorbasi = new ArrayList();
            bag.Open();
            SqlCommand komut = new SqlCommand("select * from kategoriler order by kateno", bag);
            SqlDataReader oku = komut.ExecuteReader();
            while (oku.Read() == true)
            {
                Kategoriler katego = new Kategoriler();
                katego.Kateno = Convert.ToByte(oku["kateno"]);
                katego.Kateadi = oku["kateadi"].ToString();
                katetorbasi.Add(katego);
            }
            oku.Close();
            bag.Close();
            return katetorbasi;
        }


        public int katekaydet(String kateadi)
        {
            int sayi = 0;
            try
            {
                bag.Open();
                String sql = "insert into kategoriler (kateadi) values ('" + kateadi + "')";
                SqlCommand komut = new SqlCommand(sql, bag);
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
        public int kateesil(int kateno)
        {
            int s = 0;
            bag.Open();
            komut.CommandText = "Delete from kategoriler where kateno=@kateno";
            komut.Parameters.AddWithValue("@kateno", kateno);
            komut.Connection = bag;
            s = komut.ExecuteNonQuery();
            bag.Close();
            return s;

        }

        public int kateguncelle(String kateadi, int kateno)
        {
            int sayi = 0;

            bag.Open();
            komut.CommandText = "update kategoriler set kateadi=@kateadi where kateno=@kateno";
            komut.Parameters.AddWithValue("@kateadi", kateadi);
            komut.Parameters.AddWithValue("@kateno", kateno);
            komut.Connection = bag;
            sayi = komut.ExecuteNonQuery();

            bag.Close();

            return sayi;
        }
        public Kategoriler tekkategetir(int kateno)
        {
            bag.Open();
            komut.CommandText = "select * from kategoriler where kateno=@kateno";
            komut.Parameters.AddWithValue("@kateno", kateno);
            komut.Connection = bag;
            SqlDataReader oku = komut.ExecuteReader();
            oku.Read();
            Kategoriler kat = new Kategoriler();
            kat.Kateno = Convert.ToByte(oku["kateno"]);
            kat.Kateadi = oku["kateadi"].ToString();

            oku.Close();
            bag.Close();
            return kat;
        }
    }
}