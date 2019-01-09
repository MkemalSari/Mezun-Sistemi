using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected string resimDoldur(string id)
        {
            int kid = Convert.ToInt32(id);
            var dondurucu = db.Kullanicis.Where(k => k.kullaniciID == kid).FirstOrDefault();
            string resim = "";
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

        protected string idgetir()
        {
            return Session["ID"].ToString();
        }
        protected string tarihDoldur(string id)
        {
            int pid = Convert.ToInt32(id);
            var pay = db.Paylasims.Where(k => k.paylasimID == pid).FirstOrDefault();
            DateTime dt = Convert.ToDateTime(pay.tarih);
            string ay = "";
            if (dt.Month == 1) ay = "Ocak";
            if (dt.Month == 2) ay = "Şubat";
            if (dt.Month == 3) ay = "Mart";
            if (dt.Month == 4) ay = "Nisan";
            if (dt.Month == 5) ay = "Mayıs";
            if (dt.Month == 6) ay = "Haziran";
            if (dt.Month == 7) ay = "Temmuz";
            if (dt.Month == 8) ay = "Ağustos";
            if (dt.Month == 9) ay = "Eylül";
            if (dt.Month == 10) ay = "Ekim";
            if (dt.Month == 11) ay = "Kasım";
            if (dt.Month == 12) ay = "Aralık";

            return dt.Day + " " + ay;

        }

        protected string isimDondur(string id)
        {
            int kid = Convert.ToInt32(id);
            var dondurucu = db.Kullanicis.Where(k => k.kullaniciID == kid).FirstOrDefault();
            return dondurucu.isim + " " + dondurucu.soyad;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
             
           
            try
            {//Ana Kullanıcı bilgileri Dolduruluyor.
                int sid = Convert.ToInt32(Session["ID"].ToString());
                var kbilgi = db.Kullanicis.Where(k => k.kullaniciID == sid).FirstOrDefault();
                HyperLinkAnaKulaniciAd.Text = kbilgi.isim + " " + kbilgi.soyad;
                HyperLinkAnaKulaniciAd.NavigateUrl = "profil.aspx?id=" + kbilgi.kullaniciID.ToString();
                LabelMesajTarih.Text = DateTime.Now.ToShortDateString();
                ImageAnaKullanici.ImageUrl = resimDoldur(kbilgi.kullaniciID.ToString());


            }
            catch (Exception)
            {

                Response.Redirect("login.aspx");
            }


            if (Request.QueryString["id"] == null || Request.QueryString["g"] == null)
            {
                Response.Redirect("Gruplar.aspx");
            }
            else
            {
                int bid = Convert.ToInt32(Request.QueryString["id"]);
                if (Request.QueryString["g"] == "b")
                {
                    //Bolum bilgileri doldurulacak

                    var kullanicilist = db.OkunanBolums.Where(k => k.bolumID == bid).ToList();
                    rptrUyeList.DataSource = kullanicilist;
                    rptrUyeList.DataBind();
                    panelBolumBaslik.Visible = true;
                    panelOkulBaslik.Visible = true;
                    var bolum = db.Bolums.Where(k => k.bolumID == bid).FirstOrDefault();
                    LabelBolumBaslik.Text = bolum.bolumAd;
                    var okul = db.OkulFakultes.Where(k => k.okulID == bolum.okulID).FirstOrDefault();
                    LabelOkulBaslik.Text = okul.okulAd;
                    var uni = db.Universites.Where(k => k.uniID == okul.uniID).FirstOrDefault();
                    LabelUniBaslik.Text = uni.uniAd;
                    var paylasim = db.Paylasims.Where(p => p.grup == "b" && p.ogeID == bid).ToList();
                    rptrPaylasim.DataSource = paylasim;
                    rptrPaylasim.DataBind();


                }
                else if (Request.QueryString["g"] == "o")
                {
                    //okul bilgileri doldurulacak
                    var kullanicilist = db.ViewOkuls.Where(k => k.okulID == bid).ToList();
                    rptrUyeList.DataSource = kullanicilist;
                    rptrUyeList.DataBind();
                    panelBolumBaslik.Visible = false;
                    panelOkulBaslik.Visible = true;

                    var okul = db.OkulFakultes.Where(k => k.okulID == bid).FirstOrDefault();
                    LabelOkulBaslik.Text = okul.okulAd;
                    var uni = db.Universites.Where(k => k.uniID == okul.uniID).FirstOrDefault();
                    LabelUniBaslik.Text = uni.uniAd;
                    var paylasim = db.Paylasims.Where(p => p.grup == "o" && p.ogeID == bid).ToList();
                    rptrPaylasim.DataSource = paylasim;
                    rptrPaylasim.DataBind();


                }
                else if (Request.QueryString["g"] == "u")
                {
                    //universite bilgileri doldurulacak
                    var kullanicilist = db.ViewOkuls.Where(k => k.uniID == bid).ToList();
                    rptrUyeList.DataSource = kullanicilist;
                    rptrUyeList.DataBind();
                    panelBolumBaslik.Visible = false;
                    panelOkulBaslik.Visible = false;

                    var uni = db.Universites.Where(k => k.uniID == bid).FirstOrDefault();
                    LabelUniBaslik.Text = uni.uniAd;
                    var paylasim = db.Paylasims.Where(p => p.grup == "u" && p.ogeID == bid).ToList();
                    rptrPaylasim.DataSource = paylasim;
                    rptrPaylasim.DataBind();
                }
                else
                {
                    Response.Redirect("Gruplar.aspx");
                }
            }



        }
        protected List<Model.Yorum> yorumDondurucu(string idpaylasim)
        {
            int iddd = Convert.ToInt32(idpaylasim);
            var yorumlar = db.Yorums.Where(k => k.paylasimID == iddd).ToList();
            return yorumlar;

        }

        protected void rptrPaylasim_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {


        }

        protected void ButtonPaylasim_Click(object sender, EventArgs e)
        {

            int grubid = Convert.ToInt32(Request.QueryString["id"]);
            string grupoge = Request.QueryString["g"];
            int id = Convert.ToInt32(Session["ID"].ToString());
            Model.Paylasim pay = new Model.Paylasim();
            pay.kullaniciID = id;
            pay.icerik = TextBoxKullaniciYorum.Text;
            pay.grup = grupoge;
            pay.ogeID = grubid;
            pay.tarih = DateTime.Now;
            db.Paylasims.Add(pay);
            db.SaveChanges();
            Response.Redirect(Page.Request.Url.ToString());
        }

        TextBox txt;
        int paylasimIDD;
     

       

        protected void rptrYorum_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
           
            paylasimIDD = Convert.ToInt32(e.CommandArgument);

          
        }

        protected void rptrPaylasim_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "linkbtn")
            {
                string[] str = Request.Form.GetValues("txtYorum"+ Convert.ToInt32(e.CommandArgument).ToString());
                
                int id = Convert.ToInt32(Session["ID"].ToString());


                Model.Yorum yorum = new Model.Yorum();
                yorum.paylasimID = Convert.ToInt32(e.CommandArgument);////////////
                yorum.tarih = DateTime.Now;
                yorum.kullaniciID = id;
                yorum.icerik = str[0]; ////
                db.Yorums.Add(yorum);
                db.SaveChanges();
                Response.Redirect(Page.Request.Url.ToString());
               
            }
        }


        

    }
}
