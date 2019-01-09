using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class arkOnay : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            int sid = Convert.ToInt32(Session["ID"].ToString());
            int qid = Convert.ToInt32(Request.QueryString["id"]);
            var onayla = db.Arkadas.Where(k => k.kullaniciID1 == qid && k.kullaniciID2 == sid).FirstOrDefault();
            if (Request.QueryString["islem"].ToString()=="onay")
            {
                
                onayla.arkadaslikOnay = true;
                db.SaveChanges();
                Response.Redirect("profil.aspx");
            }
            else if (Request.QueryString["islem"].ToString() == "sil")
            {
                db.Arkadas.Remove(onayla);
                db.SaveChanges();
                Response.Redirect("profil.aspx");
            }

            }
            catch (Exception)
            {

                Response.Redirect("profil.aspx");
            }
           
        }
    }
}