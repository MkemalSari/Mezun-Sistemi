using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {    
            	int id ;
            if (Request.QueryString["id"]==null)
            {
                

                
                    id = Convert.ToInt32(Session["ID"].ToString());
                    var sonMesaj = (from b in db.Mesajs where b.kullaniciIDAlan == id || b.kullaniciIDGonderen == id orderby b.mesajID descending select b).FirstOrDefault();
                    Response.Redirect("~/mesajlar.aspx?id=" + sonMesaj.mesajID.ToString());
               
             
            }
            try
            {

            
            // mesajlardaki kişileri listeler.
            	id = Convert.ToInt32(Session["ID"].ToString());
            var mesajKisiler = (from b in db.Mesajs where b.kullaniciIDAlan == id || b.kullaniciIDGonderen == id orderby b.mesajID descending select b).ToList();
            mesajKisiler = mesajKisiler.GroupBy(test => test.mesajGrup)
                   .Select(grp => grp.First())
                   .ToList();
            rptrMesajKisiler.DataSource = mesajKisiler;
            rptrMesajKisiler.DataBind();

            //mesajın içerigini listeler
            int mesajinID = Convert.ToInt32(Request.QueryString["id"]);
            int karsiID;
            var karsi = (from b in db.Mesajs where b.mesajID == mesajinID orderby b.mesajID descending select b).FirstOrDefault();
            if (karsi.kullaniciIDAlan==id)
            {
                karsiID = Convert.ToInt32(karsi.kullaniciIDGonderen);
            }
            else
            {
                karsiID =Convert.ToInt32(karsi.kullaniciIDAlan);
            }
           var mesajlar = (from b in db.Mesajs where (b.kullaniciIDAlan == id && b.kullaniciIDGonderen == karsiID )||( b.kullaniciIDGonderen == id && b.kullaniciIDAlan == karsiID) orderby b.mesajID descending select b).ToList();
           
            rptrMesajListele.DataSource = mesajlar;
            rptrMesajListele.DataBind();
            }
            catch (Exception)
            {

               
            }

            }
           protected bool idBenimMi(string id)
        {
            if (id==Session["ID"].ToString())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        
       
        protected string AktifMesaj(string gelenID)
        {
    
            if (gelenID==Request.QueryString["id"])
            {
                return "active";
            }
            else
            {
                return "";
            }
        }
        protected string MesajGosterici(string id)
        {
            string isim = "";
            int yeniID = Convert.ToInt32(id);
            var mesaj = (from b in db.Mesajs where b.mesajID == yeniID orderby b.mesajID descending select b).FirstOrDefault();
            if (Convert.ToInt32(Session["ID"].ToString()) == mesaj.kullaniciIDAlan)
            {
                var kisi1 = db.Kullanicis.Where(o => o.kullaniciID == mesaj.kullaniciIDGonderen).FirstOrDefault();
                isim = kisi1.isim + " " + kisi1.soyad;
            }
            else if (Convert.ToInt32(Session["ID"].ToString()) == mesaj.kullaniciIDGonderen)
            {
                var kisi2 = db.Kullanicis.Where(o => o.kullaniciID == mesaj.kullaniciIDAlan).FirstOrDefault();
                isim = kisi2.isim + " " + kisi2.soyad;
            }
            return isim;
        }

        protected void LinkBtnMesajGonder_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"].ToString());
            int mesajinID = Convert.ToInt32(Request.QueryString["id"]);
            int karsiID;
            var karsi = (from b in db.Mesajs where b.mesajID == mesajinID orderby b.mesajID descending select b).FirstOrDefault();
            if (karsi.kullaniciIDAlan == id)
            {
                karsiID = Convert.ToInt32(karsi.kullaniciIDGonderen);
            }
            else
            {
                karsiID = Convert.ToInt32(karsi.kullaniciIDAlan);
            }
            Model.Mesaj yeniMsj = new Model.Mesaj();
            yeniMsj.kullaniciIDAlan = karsiID;
            yeniMsj.kullaniciIDGonderen = id;
            yeniMsj.mesajIcerik = TextBoxMesajKutusu.Text;
            yeniMsj.mesajZaman = DateTime.Now;
            yeniMsj.mesajOkunma = false;
            yeniMsj.mesajGrup = karsi.mesajGrup;
            db.Mesajs.Add(yeniMsj);
            db.SaveChanges();
            Response.Redirect(Page.Request.Url.ToString());
            TextBoxMesajKutusu.Focus();
        }
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
    }
}
