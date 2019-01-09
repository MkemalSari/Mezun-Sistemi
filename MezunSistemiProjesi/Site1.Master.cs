using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            try
            {
                 int id = Convert.ToInt32(Session["ID"].ToString());

                //okul grupları
                 var okulbul = db.OkunanBolums.Where(k => k.kullaniciID == id).FirstOrDefault();
                 if (okulbul != null)
                 {
                     
                     var bolum = db.Bolums.Where(k => k.bolumID == okulbul.bolumID).FirstOrDefault();
                     var okul = db.ViewOkuls.Where(k => k.okulID == bolum.okulID).FirstOrDefault();
                     var uni = db.ViewOkuls.Where(k => k.uniID == okul.uniID).FirstOrDefault();
                     panelokulGruplari.Visible = true;
                     if (bolum.bolumAd.Length > 20)
                     {
                         lblGrpBolum.Text = bolum.bolumAd.Substring(0, 20) + "...";
                     }
                     else
                     {
                         lblGrpBolum.Text = bolum.bolumAd;
                     }
                     lblGrpBolum.NavigateUrl = "Grup.aspx?g=b&id=" + bolum.bolumID.ToString();
                     if (okul.okulAd.Length > 20)
                     {
                         lblGrpOkul.Text = okul.okulAd.Substring(0, 20) + "...";
                     }
                     else
                     {
                         lblGrpOkul.Text = okul.okulAd;
                     }

                     lblGrpOkul.NavigateUrl = "Grup.aspx?g=o&id=" + okul.okulID.ToString();
                     if (uni.uniAd.Length > 20)
                     {
                         lblGrpUni.Text =  uni.uniAd.Substring(0, 20) + "...";
                     }
                     else
                     {
                         lblGrpUni.Text = uni.uniAd;
                     }
                     lblGrpUni.NavigateUrl = "Grup.aspx?g=u&id=" + uni.uniID.ToString();
                 }




                // var bildirim =(db.Bildirimlers.Where(b => b.kullaniciID == id)).ToList();
                var bildirim = (from b in db.Bildirimlers where b.kullaniciID == id orderby b.bildirimID descending select b).ToList();
                rptrBildirim.DataSource = bildirim;
                rptrBildirim.DataBind();

                //id nin geçtigi bütün mesajları getirir
                var mesaj = (from b in db.Mesajs where b.kullaniciIDAlan == id || b.kullaniciIDGonderen == id orderby b.mesajID descending select b).ToList();
                //tekrar eden mesajları filtreler.
                mesaj = mesaj.GroupBy(test => test.mesajGrup)
                       .Select(grp => grp.First())
                       .ToList();
                rptrMesaj.DataSource = mesaj;
                rptrMesaj.DataBind();

                var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                LabelKullaniciİsimKucuk.Text = kisi.isim[0].ToString().ToUpper() + kisi.isim.Substring(1, kisi.isim.Length - 1).ToLower();
                string strBase64 = Convert.ToBase64String(kisi.resim);
                Image1KucukResim.ImageUrl = "data:Image/png;base64," + strBase64; 
                //Ark isteklerini listele
                
                var istekList = db.Arkadas.Where(k=>k.kullaniciID2==id && k.arkadaslikOnay==false).ToList();
                rptrArkistekler.DataSource = istekList;
                rptrArkistekler.DataBind();


            }
            catch (Exception)
            {

                Response.Redirect("Login.aspx");
            }
           
           
          
         
        }
        
        protected string resimDoldur(string id)
        {
            int kid = Convert.ToInt32(id);
            var dondurucu = db.Kullanicis.Where(k => k.kullaniciID == kid).FirstOrDefault();
            string resim="";
            if (dondurucu.resim != null)
            {
                string strBase64 = Convert.ToBase64String(dondurucu.resim);
                resim = "data:Image/png;base64," + strBase64;
            }
            else
            {
                if (dondurucu.cinsiyet == "Erkek")
                {
                    resim = "~/image/Man.jpg";
                }
                else
                {
                    resim = "~/image/Woman.jpg";
                }
            }
            return resim;
        }
             
         protected string isimDondur(string id)
        {
            int kid = Convert.ToInt32(id);
            var dondurucu = db.Kullanicis.Where(k => k.kullaniciID == kid).FirstOrDefault();
            return dondurucu.isim;
        }
        protected string MesajGosterici(string id)
        {
            string isim = "";
            int yeniID = Convert.ToInt32(id);
            var mesaj = (from b in db.Mesajs where b.mesajID == yeniID  orderby b.mesajID descending select b).FirstOrDefault();
            if (Convert.ToInt32(Session["ID"].ToString())==mesaj.kullaniciIDAlan)
            {
                var kisi1 = db.Kullanicis.Where(o => o.kullaniciID == mesaj.kullaniciIDGonderen).FirstOrDefault();
                isim = kisi1.isim + " " + kisi1.soyad;
            }
            else if (Convert.ToInt32(Session["ID"].ToString())==mesaj.kullaniciIDGonderen)
            {
                var kisi2 = db.Kullanicis.Where(o => o.kullaniciID == mesaj.kullaniciIDAlan).FirstOrDefault();
                isim = kisi2.isim + " " + kisi2.soyad;
            }
            return isim;
        }

        protected void LinkButtonArkadaslikReddet_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButtonArkadaslikKabul_Click1(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(Request.QueryString["id"]);
            //int sessionid = Convert.ToInt32(Session["ID"].ToString());
            //var arkDurum = db.Arkadas.Where(k =>k.kullaniciID1=)
            //arkDurum.arkadaslikOnay = true;
            //db.SaveChanges();
            //Response.Redirect(Page.Request.Url.ToString());
        }
    }
}