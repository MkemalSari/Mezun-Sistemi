using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();

        protected string kullaniciIDdondur(string gelenID)
        {
            int id = Convert.ToInt32(gelenID);
            string donecekID="";
            var arkadas = db.Arkadas.Where(k=>k.arkadasID==id).FirstOrDefault();
            if (Request.QueryString["id"] == null)
            {
                int kid=Convert.ToInt32(Session["ID"].ToString());
                if (arkadas.kullaniciID1==kid)
             	{
	            	donecekID=arkadas.kullaniciID2.ToString();
             	}
                else
	            { 
                    donecekID = arkadas.kullaniciID1.ToString();
	            }
            }
            else
	        {
                int kid=Convert.ToInt32(Request.QueryString["id"]);
                if (arkadas.kullaniciID1==kid)
             	{
	            	donecekID=arkadas.kullaniciID2.ToString();
             	}
                else
	            { 
                    donecekID = arkadas.kullaniciID1.ToString();
	            }
	        }
            return donecekID;
        }
        protected string ResimGosterici(string id)
        {

            int yeniID = Convert.ToInt32(id);
            //   var mesaj = (from b in db.Mesajs where b.mesajID == yeniID orderby b.mesajID descending select b).FirstOrDefault();
            var arkadaslik = db.Arkadas.Where(k => k.arkadasID == yeniID).FirstOrDefault();
            string resim = "";
            if (Request.QueryString["id"] == null)
            {

                if (Convert.ToInt32(Session["ID"].ToString()) == arkadaslik.kullaniciID1)
                {

                    //2. nin resmi gitcek

                    int K2id = Convert.ToInt32(arkadaslik.kullaniciID2);
                    var kullanici = db.Kullanicis.Where(k => k.kullaniciID == K2id).FirstOrDefault();
                    if (kullanici.resim != null)
                    {
                        string strBase64 = Convert.ToBase64String(kullanici.resim);
                        resim = "data:Image/png;base64," + strBase64;
                    }
                    else
                    {
                        if (kullanici.cinsiyet == "Erkek")
                        {
                            resim = "~/image/Man.jpg";
                        }
                        else
                        {
                            resim = "~/image/Woman.jpg";
                        }
                    }

                }
                else if (Convert.ToInt32(Session["ID"].ToString()) == arkadaslik.kullaniciID2)
                {
                    //1. nin resmi gidicek
                    int K1id = Convert.ToInt32(arkadaslik.kullaniciID1);
                    var kullanici = db.Kullanicis.Where(k => k.kullaniciID == K1id).FirstOrDefault();
                    if (kullanici.resim != null)
                    {
                        string strBase64 = Convert.ToBase64String(kullanici.resim);
                        resim = "data:Image/png;base64," + strBase64;
                    }
                    else
                    {
                        if (kullanici.cinsiyet == "Erkek")
                        {
                            resim = "~/image/Man.jpg";
                        }
                        else
                        {
                            resim = "~/image/Woman.jpg";
                        }
                    }
                }

            }
            else
            {

                if (Convert.ToInt32(Request.QueryString["id"]) == arkadaslik.kullaniciID1)
                {

                    //2. nin resmi gitcek

                    int K2id = Convert.ToInt32(arkadaslik.kullaniciID2);
                    var kullanici = db.Kullanicis.Where(k => k.kullaniciID == K2id).FirstOrDefault();
                    if (kullanici.resim != null)
                    {
                        string strBase64 = Convert.ToBase64String(kullanici.resim);
                        resim = "data:Image/png;base64," + strBase64;
                    }
                    else
                    {
                        if (kullanici.cinsiyet == "Erkek")
                        {
                            resim = "~/image/Man.jpg";
                        }
                        else
                        {
                            resim = "~/image/Woman.jpg";
                        }
                    }

                }
                else if (Convert.ToInt32(Request.QueryString["id"]) == arkadaslik.kullaniciID2)
                {
                    //1. nin resmi gidicek
                    int K1id = Convert.ToInt32(arkadaslik.kullaniciID1);
                    var kullanici = db.Kullanicis.Where(k => k.kullaniciID == K1id).FirstOrDefault();
                    if (kullanici.resim != null)
                    {
                        string strBase64 = Convert.ToBase64String(kullanici.resim);
                        resim = "data:Image/png;base64," + strBase64;
                    }
                    else
                    {
                        if (kullanici.cinsiyet == "Erkek")
                        {
                            resim = "~/image/Man.jpg";
                        }
                        else
                        {
                            resim = "~/image/Woman.jpg";
                        }
                    }
                }
            }
            return resim;
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                int id = Convert.ToInt32(Session["ID"].ToString());
                var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                if (Request.QueryString["id"] == null)
                {//ANA KULLANICI PROFİLİ
                    panelMesaj.Visible = false;
                    LinkBtnArkadasEkle.Text = "Bilgileri Güncelle   <i class=\"fa fa-save\"></i>";
                    LinkBtnArkadasEkle.CssClass = "btn btn-success";
                    LinkButtonDuzenle.Visible = true;
                  //  LinkButtonArkEkle.Visible = true;
                }
                else if (Request.QueryString["id"] == Session["ID"].ToString())
                {
                    Response.Redirect("Profil.aspx");
                }
                else
                {//DİĞER KULLANICI PROFİLİ
                    id = Convert.ToInt32(Request.QueryString["id"]);
                    int sesionid = Convert.ToInt32(Session["ID"].ToString());
                    kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                    panelMesaj.Visible = true;
                    var arkDurum = db.Arkadas.Where(k => (k.kullaniciID1 == id && k.kullaniciID2 == sesionid) || (k.kullaniciID1 == sesionid && k.kullaniciID2 == id)).FirstOrDefault();
                   
                    if (arkDurum != null)
                    {

                         if (arkDurum.arkadaslikOnay==true)
                      {
                        LinkBtnArkadasEkle.CssClass = "btn btn-danger";
                        LinkBtnArkadasEkle.Text = "Arkadaşlıktan Çıkar  <i class=\"fa fa-close\"></i>";
                          }
                         else
                         {
                             if (arkDurum.kullaniciID1==sesionid)
                             {
                                  LinkBtnArkadasEkle.CssClass = "btn btn-danger";
                             LinkBtnArkadasEkle.Text = "İsteği İptal Et  <i class=\"fa fa-close\"></i>";
                             }
                             else
                             {
                                 LinkBtnArkadasEkle.CssClass = "btn btn-success";
                                 LinkBtnArkadasEkle.Text = "İsteği Onayla  <i class=\"fa fa-check\"></i>";
                             }
                         }
                        


                    }
                    else
                    {
                        LinkBtnArkadasEkle.CssClass = "btn btn-success";
                        LinkBtnArkadasEkle.Text = "Arkadaş Ekle  <i class=\"fa fa-save\"></i>";

                    }
                    LinkBtnArkadasEkle.Visible = true;
                    LinkButtonDuzenle.Visible = false;
                  // LinkButtonArkEkle.Visible = false;
                    var egitim = db.OkunanBolums.Where(k => k.kullaniciID == id).FirstOrDefault();
                    var iss = db.KullaniciIsGecmisis.Where(k => k.kullaniciID == id).FirstOrDefault();
                    if (iss == null)
                    {
                        PanelIs.Visible = false;
                    }
                    else
                    {

                        PanelIs.Visible = true;
                        var isbilgis = db.ViewisBilgisis.Where(k => k.kullaniciID == id).FirstOrDefault();
                        lblSirketAd.Text = isbilgis.IsyeriAd;
                        lblSirketSehir.Text = isbilgis.sehirAd;
                        lblPozisyon.Text = isbilgis.pozisyon;
                        lblisGirisT.Text = Convert.ToDateTime(isbilgis.isGirisTarihi).ToShortDateString();

                    }
                    if (egitim == null)
                    {
                        PanelEgitim.Visible = false;
                    }
                    else
                    {
                        if (IsPostBack != true)
                        {
                            panelMesaj.Visible = true;
                            var egitimbilgis = db.ViewOkuls.Where(k => k.kullaniciID == id).FirstOrDefault();
                            lblEgitimSehir.Text = egitimbilgis.sehirAd;
                            lblOkulAdi.Text = egitimbilgis.uniAd;
                            lblOkul.Text = egitimbilgis.okulAd;
                            lblTarih.Text = Convert.ToDateTime(egitimbilgis.girisTarihi).ToShortDateString();
                        }
                    }

                }
                int nid;
                if (Request.QueryString["id"] == null)
                {
                    nid = Convert.ToInt32(Session["ID"].ToString());
                }
                else
                {
                    nid = Convert.ToInt32(Request.QueryString["id"]);
                }
                var arkList = db.Arkadas.Where(k => (k.kullaniciID1 == nid || k.kullaniciID2 == nid)&&k.arkadaslikOnay==true).ToList();
                if (arkList != null)
                {
                    panelArkList.Visible = true;
                    rptrARK.DataSource = arkList;
                    rptrARK.DataBind();
                }
                else
                {
                    panelArkList.Visible = false;
                }
                if (kisi.resim != null)
                {
                    string strBase64 = Convert.ToBase64String(kisi.resim);
                    Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                }
                else
                {
                    if (kisi.cinsiyet == "Erkek")
                    {
                        Image1.ImageUrl = "~/image/Man.jpg";
                    }
                    else
                    {
                        Image1.ImageUrl = "~/image/Woman.jpg";
                    }

                }
                LabelKullaniciCinsiyet.Text = kisi.cinsiyet;
                DateTime dt = kisi.dTarihi.Value;
                LabelKullanıcıDogumTarihi.Text = dt.ToShortDateString();
                LabelKullaniciİs.Text = kisi.isBilgisi;
                var sehir = db.Sehirs.Where(k => k.sehirID == kisi.sehirID).FirstOrDefault();
                LabelKullaniciSehir.Text = sehir.sehirAd.ToString();
                LabelKullaniciHakımda.Text = kisi.hakkimda;
                HyperLinkMail.Text = kisi.gosterilenMail;
                HyperLinkMail.NavigateUrl = "https://" + kisi.gosterilenMail;
                HyperLinkFace.NavigateUrl = kisi.facebookURL;
                HyperLinkTwitter.NavigateUrl = kisi.twitterURL;
                LabelKullaniciİsim.Text = kisi.isim + " " + kisi.soyad;
                if (IsPostBack != true)
                { //İŞ GÖSTERME
                    
                    var isbilgis = db.ViewisBilgisis.Where(k => k.kullaniciID == id).FirstOrDefault();
                    if (isbilgis != null)
                    {
                        PanelIs.Visible = true;
                        lblSirketAd.Text = isbilgis.IsyeriAd;
                        lblSirketSehir.Text = isbilgis.sehirAd;
                        lblPozisyon.Text = isbilgis.pozisyon;
                        lblisGirisT.Text = Convert.ToDateTime(isbilgis.isGirisTarihi).ToShortDateString();
                    }
                   

                    //EĞTİM GÖSTERME
                    var egitimbilgis = db.ViewOkuls.Where(k => k.kullaniciID == id).FirstOrDefault();
                    if (egitimbilgis!=null)
                    {
                        PanelEgitim.Visible = true;
                        lblEgitimSehir.Text = egitimbilgis.sehirAd;
                        lblOkulAdi.Text = egitimbilgis.uniAd;
                        lblOkul.Text = egitimbilgis.okulAd;
                        lblTarih.Text = Convert.ToDateTime(egitimbilgis.girisTarihi).ToShortDateString();
                    }
                 
                }




            }
            catch (Exception)
            {
                // Response.Redirect("~/Profil.aspx");        
            }




        }

        protected void LinkBtnMesajGonder_Click(object sender, EventArgs e)
        {//PROFİL MESAJI
            string mesaj = TextBoxMesajKutusu.Text;
            int grup;
            if (mesaj != "" || mesaj != null)
            {
                int profilID = Convert.ToInt32(Request.QueryString["id"]);
                int gonderenID = Convert.ToInt32(Session["ID"].ToString());
                var mesajlar = (from b in db.Mesajs where (b.kullaniciIDAlan == profilID && b.kullaniciIDGonderen == gonderenID) || (b.kullaniciIDGonderen == profilID && b.kullaniciIDAlan == gonderenID) orderby b.mesajID descending select b).ToList();
                if (mesajlar.Count == 0)
                {
                    var tummesajlar = (from b in db.Mesajs orderby b.mesajGrup descending select b).FirstOrDefault();
                    grup = Convert.ToInt32(tummesajlar.mesajGrup) + 1;
                }
                else
                {
                    var SonMesaj = mesajlar.FirstOrDefault();
                    grup = Convert.ToInt32(SonMesaj.mesajGrup);
                }
                Model.Mesaj nm = new Model.Mesaj();
                nm.mesajGrup = grup.ToString();
                nm.mesajIcerik = mesaj;
                nm.kullaniciIDGonderen = gonderenID;
                nm.kullaniciIDAlan = profilID;
                nm.mesajZaman = DateTime.Now;
                db.Mesajs.Add(nm);
                db.SaveChanges();
                Response.Redirect(Page.Request.Url.ToString());
                TextBoxMesajKutusu.Focus();
            }
        }

        protected void LinkButtonDuzenle_Click(object sender, EventArgs e)
        {
            if ((LinkButtonDuzenle.Text).Substring(0, 1) == "D")
            {
                DropDownListCinsiyet.Visible = true;
                TextBoxDogumTarihi.Visible = true;
                TextBoxis.Visible = true;
                DropDownListIller.Visible = true;
                LinkButtonDuzenle.Text = "Kaydet  <i class=\"fa fa-save\"></i>";
                LabelKullaniciSehir.Visible = false;
                LabelKullaniciİs.Visible = false;
                LabelKullanıcıDogumTarihi.Visible = false;
                LabelKullaniciCinsiyet.Visible = false;

                //BİLGİLERİ GETİRİCEK KODLAR YAZILCAK
                TextBoxDogumTarihi.Text = LabelKullanıcıDogumTarihi.Text;
                TextBoxis.Text = LabelKullaniciİs.Text;
                DropDownListIller.Text = LabelKullaniciSehir.Text;
                DropDownListCinsiyet.Text = LabelKullaniciCinsiyet.Text;

            }
            else
            {
                DropDownListCinsiyet.Visible = false;
                TextBoxDogumTarihi.Visible = false;
                TextBoxis.Visible = false;
                DropDownListIller.Visible = false;
                LinkButtonDuzenle.Text = "Düzenle  <i class=\"fa fa-save\"></i>";
                LabelKullaniciSehir.Visible = true;
                LabelKullaniciİs.Visible = true;
                LabelKullanıcıDogumTarihi.Visible = true;
                LabelKullaniciCinsiyet.Visible = true;

                //KAYDEDİP TEKRAR LİSTELEME YAPILACAK
                string ad = DropDownListIller.SelectedItem.Text;
                var sehir = db.Sehirs.Where(k => k.sehirAd == ad).FirstOrDefault();
                string[] dizi = TextBoxDogumTarihi.Text.Replace(".", "/").Split('/');
                int id = Convert.ToInt32(Session["ID"].ToString());
                var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                kisi.isBilgisi = TextBoxis.Text;
                kisi.cinsiyet = DropDownListCinsiyet.SelectedItem.Text;
                kisi.dTarihi = new DateTime(Convert.ToInt32(dizi[2]), Convert.ToInt32(dizi[0]), Convert.ToInt32(dizi[1]));
                kisi.sehirID = sehir.sehirID;
                db.SaveChanges();
                Response.Redirect("~/Profil.aspx");




            }

        }

        protected void LinkBtnArkadasEkle_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("~/Duzenle.aspx");
            }
            else
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                int sessionid = Convert.ToInt32(Session["ID"].ToString());
                var arkDurum = db.Arkadas.Where(k => (k.kullaniciID1 == id && k.kullaniciID2 == sessionid) || (k.kullaniciID1 == sessionid && k.kullaniciID2 == id)).FirstOrDefault();
                if (arkDurum != null)
                {
                    if (arkDurum.arkadaslikOnay == true)
                    {
                        //Ark.cıkar
                        db.Arkadas.Remove(arkDurum);
                        db.SaveChanges();
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    else
                    {
                        if (arkDurum.kullaniciID1==sessionid)
                        {
                              //Ark.cıkar
                        db.Arkadas.Remove(arkDurum);
                        db.SaveChanges();
                        Response.Redirect(Page.Request.Url.ToString());
                        }
                        else
                        {
                            arkDurum.arkadaslikOnay = true;
                            db.SaveChanges();
                            Response.Redirect(Page.Request.Url.ToString());
                        }
                    }
                

                }
                else
                {
                    //ark.ekle
                    Model.Arkada arkads = new Model.Arkada();
                    arkads.kullaniciID1 = sessionid;
                    arkads.kullaniciID2 = id;
                    arkads.arkadaslikOnay = false;
                    db.Arkadas.Add(arkads);
                    db.SaveChanges();
                    Response.Redirect(Page.Request.Url.ToString());

                }
            }

        }






    }
}
