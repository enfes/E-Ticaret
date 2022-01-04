using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


namespace e_ticaret
{
    public class Connection
    {
        public SqlConnection baglantiyagec()
        {
            SqlConnection bag = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\veri_tabani_e_ticaret.mdf;Integrated Security=True");
            return bag;
        }
    }
}