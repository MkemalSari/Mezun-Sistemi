using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class Login : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (CheckBoxSozlesme.Checked)
            {
                var kisi = db.Kullanicis.Where(o => o.email == kayitEmail.Text).FirstOrDefault();
                if (kisi != null)
                {
                    LabelSozlesmeKontrol.Visible = true;
                    LabelSozlesmeKontrol.Text = "Mevcut E-posta adresi girdiniz. !";
                }
                else
                {
                    Random rdn = new Random();
                    string random = rdn.Next(10000000, 99999999).ToString();
                    LabelSozlesmeKontrol.Visible = false;
                    Model.Kullanici k1 = new Model.Kullanici();
                    DateTime uyeZamani = System.DateTime.Now;
                    k1.isim = kayitAd.Text;
                    k1.soyad = kayitSoyad.Text;
                    k1.email = kayitEmail.Text;
                    k1.sifre = kayitPassword1.Text;
                    k1.onay = false;
                    k1.uyeKoduZaman = uyeZamani;
                    k1.uyeKodu = random;
                    db.Kullanicis.Add(k1);
                    db.SaveChanges();
                    long id = k1.kullaniciID;

                    SmtpClient mlClient = new SmtpClient();
                    MailMessage mlMessage = new MailMessage();
                    mlMessage.To.Add(kayitEmail.Text);
                    mlMessage.From = new MailAddress("codetech.destek@gmail.com", "Site Üye Onayı");
                    mlMessage.Subject = "Mail İle Uye Kayıt Onayı";
                    mlMessage.IsBodyHtml = true;
                    mlMessage.Body = "Sayın " + kayitAd.Text + "<br/>" + "İsimli Hesabı Aktif Hale Getirmek İçin Kodunuz : " + random;
                    NetworkCredential guvenlikKarti = new NetworkCredential("codetech.destek", "4256123789");
                    mlClient.Credentials = guvenlikKarti;
                    mlClient.Port = 587;
                    mlClient.Host = "smtp.gmail.com";
                    mlClient.EnableSsl = true;
                    mlClient.Send(mlMessage);
                    Response.Redirect("Onay.aspx/?kd1=" + uyeZamani + "&kid=" + id);
                }






            }
            else
            {
                LabelSozlesmeKontrol.Text = "Lütfen Sözleşmeyi Kabul Ediniz. !";
                LabelSozlesmeKontrol.Visible = true;
            }
       
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            string mail = girisEmail.Text;
            string sifre = girisPassword.Text;
            var kisi = db.Kullanicis.Where(o => o.email == mail && o.sifre == sifre).FirstOrDefault();
           
            if (kisi != null)
            {
                LabelGirisHataMesaji.Visible = true;
            LabelGirisHataMesaji.Text = kisi.isim;
                if (kisi.onay == true)
                {


                    if (kisi.dTarihi == null)
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("KayitAdim1.aspx");
                    }
                    else if (kisi.isBilgisi == null)
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("KayitAdim2.aspx");
                    }
                    else if (kisi.cinsiyet == null)
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("KayitAdim3.aspx");
                    }
                    else if (kisi.sehirID == null)
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("KayitAdim4.aspx");
                    }
                    else if (kisi.resim == null)
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("KayitAdim5.aspx");
                    }
                    else
                    {
                        Session["ID"] = kisi.kullaniciID;
                        Response.Redirect("Profil.aspx");
                    }
                }
                else
                {
                    Random rdn = new Random();
                    string random = rdn.Next(10000000, 99999999).ToString();
                    kisi.uyeKodu = random;
                    db.SaveChanges();
                    SmtpClient mlClient = new SmtpClient();
                    MailMessage mlMessage = new MailMessage();
                    mlMessage.To.Add(kisi.email);
                    mlMessage.From = new MailAddress("codetech.destek@gmail.com", "Site Üye Onayı");
                    mlMessage.Subject = "Mail İle Uye Kayıt Onayı";
                    mlMessage.IsBodyHtml = true;
                    mlMessage.Body = "Sayın " + kayitAd.Text + "<br/>" + "Hesabınızı Aktif Hale Getirmek İçin Yeni  Kodunuz : " + random;
                    NetworkCredential guvenlikKarti = new NetworkCredential("codetech.destek", "4256123789");
                    mlClient.Credentials = guvenlikKarti;
                    mlClient.Port = 587;
                    mlClient.Host = "smtp.gmail.com";
                    mlClient.EnableSsl = true;
                    mlClient.Send(mlMessage);
                    Response.Redirect("Onay.aspx/?kd1=" + kisi.uyeKoduZaman + "&kid=" + kisi.kullaniciID);
                }
            }
            else
            {
                LabelGirisHataMesaji.Visible = true;
            }
        }
    }
}