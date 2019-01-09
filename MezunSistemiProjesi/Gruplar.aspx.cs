using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
      
    public partial class WebForm2 : System.Web.UI.Page
    {
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
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            
            int sid = Convert.ToInt32(Session["ID"].ToString());
            var okulbul = db.OkunanBolums.Where(k=>k.kullaniciID==sid).FirstOrDefault();
            if (okulbul!=null)
            {
                var bolum = db.Bolums.Where(k => k.bolumID == okulbul.bolumID).FirstOrDefault();
                var okul = db.ViewOkuls.Where(k=>k.okulID==bolum.okulID).FirstOrDefault();
                var uni = db.ViewOkuls.Where(k => k.uniID == okul.uniID).FirstOrDefault();
                panelOkulGruplari.Visible = true;
               lblBolumAdi.Text = bolum.bolumAd;
                lblBolumAdi.NavigateUrl = "Grup.aspx?g=b&id="+bolum.bolumID.ToString();
               lblOkulAdi.Text = okul.okulAd;
                lblOkulAdi.NavigateUrl = "Grup.aspx?g=o&id="+okul.okulID.ToString();
               lblUniAdi.Text = uni.uniAd;
                lblUniAdi.NavigateUrl = "Grup.aspx?g=u&id="+uni.uniID.ToString();

                var bolumUyeList = db.OkunanBolums.Where(k => k.bolumID == bolum.bolumID).ToList();
                rptrBolumGrp.DataSource = bolumUyeList;
                rptrBolumGrp.DataBind();


                var okulUyeList = db.ViewOkuls.Where(k => k.okulID == okul.okulID).ToList();
                rptrOkulGrp.DataSource = okulUyeList;
                rptrOkulGrp.DataBind();

                var uniUyeList = db.ViewOkuls.Where(k => k.uniID == uni.uniID).ToList();
                rptrUniGrp.DataSource = uniUyeList;
                rptrUniGrp.DataBind();
            }
            }
            catch (Exception)
            {

                Response.Redirect("login.aspx");
            }
        }
    }
}