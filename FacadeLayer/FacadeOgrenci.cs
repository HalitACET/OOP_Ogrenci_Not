using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using EntityLayer;
namespace FacadeLayer
{
  public  class FacadeOgrenci
    {
        public static int Ekle(EntityOgrenci deger)
        {
            SqlCommand komut = new SqlCommand("OgrenciEkle",SqlBaglantisi.baglanti);
            komut.CommandType = CommandType.StoredProcedure;
            if (komut.Connection.State!=ConnectionState.Open)
            {
                komut.Connection.Open();
            }
            komut.Parameters.AddWithValue("Ad",deger.Ad);
            komut.Parameters.AddWithValue("Soyad",deger.Soyad);
            komut.Parameters.AddWithValue("Fotograf",deger.Fotograf);
            komut.Parameters.AddWithValue("KulupID",deger.KulupID);
            return komut.ExecuteNonQuery();
        }

        public static bool Sil(int deger)
        {
            SqlCommand komut = new SqlCommand("OgrenciSil",SqlBaglantisi.baglanti);
            komut.CommandType = CommandType.StoredProcedure;
            if (komut.Connection.State!=ConnectionState.Open)
            {
                komut.Connection.Open();
            }
            komut.Parameters.AddWithValue("ID",deger);
            return komut.ExecuteNonQuery() > 0;
        }
        public static bool Guncelle(EntityOgrenci deger)
        {
            SqlCommand komut = new SqlCommand("OgrenciGuncelle",SqlBaglantisi.baglanti);
            komut.CommandType = CommandType.StoredProcedure;
            if (komut.Connection.State!=ConnectionState.Open)
            {
                komut.Connection.Open();
            }
            komut.Parameters.AddWithValue("Ad",deger.Ad);
            komut.Parameters.AddWithValue("Soyad",deger.Soyad);
            komut.Parameters.AddWithValue("Fotograf",deger.Fotograf);
            komut.Parameters.AddWithValue("KulupID",deger.KulupID);
            komut.Parameters.AddWithValue("ID",deger.ID);
            return komut.ExecuteNonQuery() > 0;
        }
        public static List<EntityOgrenci> OgrenciListesi()
        {
            List<EntityOgrenci> degerler = new List<EntityOgrenci>();
            SqlCommand komut = new SqlCommand("OgrenciListesi",SqlBaglantisi.baglanti);
            komut.CommandType = CommandType.StoredProcedure;
            if (komut.Connection.State!=ConnectionState.Open)
            {
                komut.Connection.Open();
            }
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                EntityOgrenci ent = new EntityOgrenci();
                ent.Ad = dr["Ad"].ToString();
                ent.Soyad = dr["Soyad"].ToString();
                ent.Fotograf = dr["Fotograf"].ToString();
                ent.KulupID =Convert.ToInt16(dr["KulupID"]);
                ent.ID =Convert.ToInt16(dr["ID"]);
                degerler.Add(ent);
            }
            dr.Close();
            return degerler;
        }
    }
}
