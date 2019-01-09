using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
   
    public partial class KayitAdim1 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MaximumValue = DateTime.Now.ToShortDateString();

            RangeValidator1.MinimumValue = new DateTime(1900, 01, 01).ToShortDateString();

            //si.dTarihi
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            
          
        }

    

        protected void LinkButtonIleri_Click(object sender, EventArgs e)
        {
            string[] dizi = TextBoxDogumTarihi.Text.Split('/');


            int id = (int)Session["ID"];

            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            kisi.dTarihi = new DateTime(Convert.ToInt32(dizi[2]), Convert.ToInt32(dizi[0]), Convert.ToInt32(dizi[1]));
            db.SaveChanges();
            

                Response.Redirect("KayitAdim2.aspx");
            
        }

        protected void LinkButtonGec_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("KayitAdim2.aspx");
        }
    }
}