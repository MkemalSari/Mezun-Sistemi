using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class KayitAdim4 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (kisi.sehirID != null)
            {
                Response.Redirect("KayitAdim5.aspx");
            }
        }

        protected void LinkButtonGec_Click(object sender, EventArgs e)
        {

            Response.Redirect("KayitAdim5.aspx");
}
        protected void LinkButtonİleri_Click(object sender, EventArgs e)
        {
            string ad=DropDownListIller.SelectedItem.Text;
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            var sehir = db.Sehirs.Where(k => k.sehirAd == ad).FirstOrDefault();

            kisi.sehirID = sehir.sehirID;
            db.SaveChanges();
            Response.Redirect("KayitAdim5.aspx");
        }
        
    }
}