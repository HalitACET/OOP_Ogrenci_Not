using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EntityLayer;
using FacadeLayer;
using BusinessLogicLayer;
namespace Ogrenci_Not
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        void OgrenciListesi()
        {
            List<EntityOgrenci> OgrList = BllOgrenci.Listele();
            dataGridView1.DataSource = OgrList;
            this.Text = "Öğrenci Listesi";
        }
        void KulupAdListele()
        {
            List<EntityKulup> klplst = BllKulup.Listele();
            cmbKulup.DisplayMember = "KulupAd";
            cmbKulup.ValueMember = "KulupID";
            cmbKulup.DataSource = klplst;
            dataGridView1.DataSource = klplst;
            this.Text = "Kulüp Listesi";
        }
        void NotListesi()
        {
            List<EntityNotlar> NotList = BllNotlar.Listele();
            dataGridView1.DataSource = NotList;
            this.Text = "Not Listesi";
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            KulupAdListele();
            OgrenciListesi();
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {
            EntityOgrenci ent = new EntityOgrenci();
            
            ent.Ad = txtAd.Text;
            ent.Soyad = txtSoyad.Text;
            ent.Fotograf = txtFotograf.Text;
            ent.KulupID = Convert.ToInt16(cmbKulup.SelectedValue);
            BllOgrenci.Ekle(ent);
            MessageBox.Show("Kayıt Yapıldı...");
            OgrenciListesi();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (this.Text=="Öğrenci Listesi")
            {
                txtID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                txtAd.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
                txtSoyad.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                txtFotograf.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            }
            if (this.Text=="Not Listesi")
            {
                txtNotID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                txtAd.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
                txtSoyad.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                txtS1.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                txtS2.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
                txtS3.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
                txtProje.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
                txtOrt.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
                txtDurum.Text = dataGridView1.CurrentRow.Cells[8].Value.ToString();
            }
            if (this.Text=="Kulüp Listesi")
            {
                txtKulupID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                txtKulupAd.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            }
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            EntityOgrenci ent = new EntityOgrenci();
            ent.ID =Convert.ToInt16(txtID.Text);
            ent.Ad = txtAd.Text;
            ent.Soyad = txtSoyad.Text;
            ent.Fotograf = txtFotograf.Text;
            ent.KulupID = Convert.ToInt16(cmbKulup.SelectedValue);
            BllOgrenci.Guncelle(ent);
            MessageBox.Show("Kayıt Güncellendi");
            OgrenciListesi();
        }

        private void btnListele_Click(object sender, EventArgs e)
        {
            OgrenciListesi();
        }

        private void btnNotListele_Click(object sender, EventArgs e)
        {
            NotListesi();
        }

        private void btnNotGuncelle_Click(object sender, EventArgs e)
        {
            EntityNotlar ent = new EntityNotlar();
            ent.OgrID1 =Convert.ToInt16(txtNotID.Text);
            ent.Sinav1 = Convert.ToInt16(txtS1.Text);
            ent.Sinav2 = Convert.ToInt16(txtS2.Text);
            ent.Sinav3 = Convert.ToInt16(txtS3.Text);
            ent.Proje = Convert.ToInt16(txtProje.Text);
            ent.Ortalama = Convert.ToInt16(txtOrt.Text);
            ent.Durum = txtDurum.Text;
            BllNotlar.Guncelle(ent);
            MessageBox.Show("Notlar Güncellendi");
            NotListesi();
        }

        private void btnHesapla_Click(object sender, EventArgs e)
        {
            int s1, s2, s3, proje;
            double ort;
            string durum;

            s1 = Convert.ToInt16(txtS1.Text);
            s2 = Convert.ToInt16(txtS2.Text);
            s3 = Convert.ToInt16(txtS3.Text);
            proje = Convert.ToInt16(txtProje.Text);

            ort = (s1 + s2 + s3 + proje) / 4;
            txtOrt.Text = ort.ToString();
            if (ort>=50)
            {
                durum = "True";
            }
            else
            {
                durum = "False";
            }
            txtDurum.Text = durum;
        }

        private void btnKulupListele_Click(object sender, EventArgs e)
        {
            KulupAdListele();
        }

        private void btnKulupKaydet_Click(object sender, EventArgs e)
        {
            EntityKulup ent = new EntityKulup();
            ent.KulupAd = txtKulupAd.Text;
            BllKulup.Ekle(ent);
            MessageBox.Show("Kulüp Eklendi");
            KulupAdListele();
        }

        private void btnKulupGuncelle_Click(object sender, EventArgs e)
        {
            EntityKulup ent = new EntityKulup();
            ent.KulupAd = txtKulupAd.Text;
            ent.KulupID = Convert.ToInt16(txtKulupID.Text);
            BllKulup.Guncelle(ent);
            MessageBox.Show("Kulüp Güncellendi");
            KulupAdListele();
        }

        private void btnKulupSil_Click(object sender, EventArgs e)
        {
            EntityKulup ent = new EntityKulup();
            ent.KulupID = Convert.ToInt16(txtKulupID.Text);
            BllKulup.Sil(ent.KulupID);
            MessageBox.Show("Kulüp Silindi");
            KulupAdListele();

        }
    }
}
