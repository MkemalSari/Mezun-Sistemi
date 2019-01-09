using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class Onay : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        int UyeID;
        DateTime UyeZamani;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["kid"] != null && Request.QueryString["kd1"] != null)
            {

                UyeZamani = Convert.ToDateTime(Request.QueryString["kd1"]);
                //            UyeKod = Request.QueryString["kd2"];
                UyeID = Convert.ToInt32(Request.QueryString["kid"]);

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
    
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            var kisi = db.Kullanicis.Where(o => o.kullaniciID == UyeID).FirstOrDefault();


            if (kisi.uyeKodu == txtOnay.Text.Trim())
            {


                LabelOnay.Visible = false;

                if (kisi != null)
                {
                    kisi.onay = true;
                    db.SaveChanges();
                }

                Response.Redirect("profile.aspx");
            }
            else
            {
                LabelOnay.Visible = true;
            }
        }
    }
}