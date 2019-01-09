using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class KayitAdim3 : System.Web.UI.Page
    { Model.MezunVsEntities db = new Model.MezunVsEntities();




         static short cins;
        protected void Page_Load(object sender, EventArgs e)
         {
             if (Session["ID"] == null)
             {
                 Response.Redirect("Login.aspx");
             }

            if (IsPostBack!=true)
            {
                cins = 0;
            }
           
          


            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (kisi.cinsiyet != null)
            {
                Response.Redirect("KayitAdim4.aspx");
            }
        }
     
      

        protected void LinkButtonKadin_Click(object sender, EventArgs e)
        {   cins = 1;
            LinkButton1Erkek.BorderStyle = System.Web.UI.WebControls.BorderStyle.NotSet;
            LinkButtonKadin.BorderStyle = System.Web.UI.WebControls.BorderStyle.Solid;
            Label1.Visible = false;
        }

      

        

        protected void LinkButtonGec_Click(object sender, EventArgs e)
        {
            Response.Redirect("KayitAdim4.aspx");
        }

        protected void LinkButton1ilerii_Click(object sender, EventArgs e)
        {
            if (cins == 0)
            {
                Label1.Visible = true;
            }
            else
            {
                Label1.Visible = false;
                int id = (int)Session["ID"];
                var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                if (cins == 1)
                {
                    kisi.cinsiyet = "Kadın";
                }
                else if (cins == 2)
                {
                    kisi.cinsiyet = "Erkek";
                }
               
                db.SaveChanges();
                Response.Redirect("KayitAdim4.aspx");
            }
        }

        protected void LinkButton1Erkek_Click(object sender, EventArgs e)
        {
            cins += 2;
            LinkButton1Erkek.BorderStyle = System.Web.UI.WebControls.BorderStyle.Solid;
            LinkButtonKadin.BorderStyle = System.Web.UI.WebControls.BorderStyle.NotSet;
            Label1.Visible = false;
        }

      

       
    }
}