using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class KayitAdim2 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (kisi.isBilgisi!=null)
            {
                 Response.Redirect("KayitAdim3.aspx");
            }
        }

       

        protected void LinkButtonİleri_Click(object sender, EventArgs e)
        {
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            kisi.isBilgisi = TextBoxIsbilgisi.Text;
            db.SaveChanges();
            

            Response.Redirect("KayitAdim3.aspx");
        }

        protected void LinkButtonGec_Click1(object sender, EventArgs e)
        {
            Response.Redirect("KayitAdim3.aspx");
        }
    }
}