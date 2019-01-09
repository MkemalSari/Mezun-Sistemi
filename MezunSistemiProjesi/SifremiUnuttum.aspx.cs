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
    public partial class SifremiUnuttum : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();

        //int UyeID;
        //DateTime UyeZamani;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            var kisi = db.Kullanicis.Where(o => o.email ==txtePosta.Text).FirstOrDefault();

    if (kisi!=null)
    {
                SmtpClient mlClient = new SmtpClient();
                MailMessage mlMessage = new MailMessage();
                mlMessage.To.Add(txtePosta.Text);
                mlMessage.From = new MailAddress("codetech.destek@gmail.com", "Şifre Hatırlatma");
                mlMessage.Subject = "Mail İle Şifre Hatırlatma";
                mlMessage.IsBodyHtml = true;
                mlMessage.Body = "Sayın " + kisi.isim +" "+kisi.soyad+ "<br/>" + " Hesabınızın Mevcut  Şifresi : " + kisi.sifre;
                NetworkCredential guvenlikKarti = new NetworkCredential("codetech.destek", "4256123789");
                mlClient.Credentials = guvenlikKarti;
                mlClient.Port = 587;
                mlClient.Host = "smtp.gmail.com";
                mlClient.EnableSsl = true;
                mlClient.Send(mlMessage);

                LabelOnay.ForeColor = System.Drawing.Color.LimeGreen;
                LabelOnay.Text = "Şifreniz E-posta Adresine gönderilmiştir.";
                LabelOnay.Visible = true;
                HyperLink1.Visible = true;
    }
    else
    {
        HyperLink1.Visible = false;

        LabelOnay.ForeColor = System.Drawing.Color.OrangeRed;
        LabelOnay.Text = "Girmiş Olduğunuz E-posta Adresi Hatalı!";
        LabelOnay.Visible = true;
    }
   
    }
        
    }
}