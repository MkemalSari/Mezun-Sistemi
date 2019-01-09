using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {


            LinkButtonResim.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");
            try
            {
                if (IsPostBack != true)
                {
                    int id = Convert.ToInt32(Session["ID"].ToString());
                    var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
                    if (kisi.resim != null)
                    {
                        string strBase64 = Convert.ToBase64String(kisi.resim);
                        Image1.ImageUrl = "data:Image/png;base64," + strBase64;

                    }
                    TextBoxHakkimda.Text = kisi.hakkimda;
                    TextBoxFace.Text = kisi.facebookURL;
                    TextBoxMail.Text = kisi.gosterilenMail;
                    TextBoxTwiter.Text = kisi.twitterURL;
                    DateTime dt = kisi.dTarihi.Value;
                    TextBoxDogumTarihi.Text = dt.Month+"/"+dt.Day+"/"+dt.Year;
                    TextBoxis.Text = kisi.isBilgisi;
                    DropDownListCinsiyet.Text = kisi.cinsiyet;
                    var sehir = db.Sehirs.Where(k => k.sehirID == kisi.sehirID).FirstOrDefault();
                    DropDownListIller.Text = sehir.sehirAd.ToString();



                    // eğitim doldurma


                    var durum = db.OkunanBolums.Where(k => k.kullaniciID == id).FirstOrDefault();
                  
                    if (durum != null)
                    
                    {
                          DateTime cikisT = durum.cikisTarihi.Value;
                          DateTime girisT = durum.girisTarihi.Value;
                          var okulbilgisi = db.ViewOkuls.Where(k => k.okunanBolumID == durum.okunanBolumID).FirstOrDefault();
                          DropDownListEgitimSehir.SelectedItem.Text = okulbilgisi.sehirAd;
                          var unibilgisi = db.Universites.Where(u => u.sehirID == okulbilgisi.sehirID).ToList();
                          var fakultebilgisi = db.OkulFakultes.Where(f => f.uniID == okulbilgisi.uniID).ToList();
                          var bolumbilgisi = db.Bolums.Where(b => b.okulID == okulbilgisi.okulID).ToList();
                          DropDownListEgitimUni.DataSource = unibilgisi;
                          DropDownListEgitimUni.DataTextField = "uniAd";
                          DropDownListEgitimUni.DataValueField = "uniID";
                          DropDownListEgitimUni.DataBind();
                          DropDownListEgitimUni.SelectedItem.Text = okulbilgisi.uniAd;

                          DropDownListEgitimFakulte.DataSource = fakultebilgisi;
                          DropDownListEgitimFakulte.DataTextField = "okulAd";
                          DropDownListEgitimFakulte.DataValueField = "okulID";
                          DropDownListEgitimFakulte.DataBind();
                          DropDownListEgitimFakulte.SelectedItem.Text = okulbilgisi.okulAd;

                          DropDownListBolum.DataSource = bolumbilgisi;
                          DropDownListBolum.DataTextField = "bolumAd";
                          DropDownListBolum.DataValueField = "bolumID";
                          DropDownListBolum.DataBind();
                          DropDownListBolum.SelectedItem.Text = okulbilgisi.bolumAd;
                          TextBoxGirisTarihi.Text = girisT.Month + "/" + girisT.Day + "/" + girisT.Year;
                          TextBoxCikisTarihi.Text = cikisT.Month + "/" + cikisT.Day + "/" + cikisT.Year;

                    }
                        else
                    {
                        DropDownListEgitimSehir.SelectedItem.Text = null;
                    }
                        //İs bilgilerini doldurma
                    var isbilgisi=db.KullaniciIsGecmisis.Where(i=>i.kullaniciID==id).FirstOrDefault();
                    if (isbilgisi!=null)
                    {
                        DateTime iscikisT = isbilgisi.isCikisTarihi.Value;
                        DateTime isgirisT = isbilgisi.isGirisTarihi.Value;
                        var isbigi = db.ViewisBilgisis.Where(k => k.isID == isbilgisi.isID).FirstOrDefault();
                        DropDownSirketSehir.Text = isbigi.sehirAd;
                        var sirketAd = db.Isyeris.Where(u => u.IsyeriID == isbilgisi.IsyeriID).ToList();
                        var departman = db.Departmen.Where(u => u.IsyeriID == isbigi.IsyeriID).ToList();

                        DropDownSirket.DataSource = sirketAd;
                        DropDownSirket.DataTextField = "isyeriAd";
                        DropDownSirket.DataValueField = "isyeriID";
                        DropDownSirket.DataBind();
                        DropDownSirket.SelectedItem.Text = isbigi.IsyeriAd;

                        DropDownDepartman.DataSource = departman;
                        DropDownDepartman.DataTextField = "departmanAd";
                        DropDownDepartman.DataValueField = "departmanID";
                        DropDownDepartman.DataBind();
                        DropDownDepartman.SelectedItem.Text = isbigi.departmanAd;

                        TextBoxPozisyon.Text = isbigi.pozisyon;

                        TextBoxisBaslangicTarihi.Text = isgirisT.Month + "/" + isgirisT.Day + "/" + isgirisT.Year;
                        TextBoxisBitisTarihi.Text = iscikisT.Month + "/" + iscikisT.Day + "/" + iscikisT.Year;
                    
                    }
                   
                }
            }
            catch (Exception)
            {

                Response.Redirect("login.aspx");
            }
        }

        protected void LinkBtnArkadasEkle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["ID"].ToString());
            //iS BİLGİLERİNİ kAYDETME
            var isbilgisi = db.KullaniciIsGecmisis.Where(i => i.kullaniciID == id).FirstOrDefault();
            if (isbilgisi==null)
            {
                try
                {

               
                 Model.KullaniciIsGecmisi isgecmis = new Model.KullaniciIsGecmisi();
            isgecmis.kullaniciID = id;
            isgecmis.pozisyon = TextBoxPozisyon.Text;
            isgecmis.IsyeriID = Convert.ToInt32(DropDownSirket.SelectedValue); 
            string[] iscikisTarihi = TextBoxisBitisTarihi.Text.Replace(".", "/").Split('/');
            string[] isgirisTarihi = TextBoxisBaslangicTarihi.Text.Replace(".", "/").Split('/');
             isgecmis.isCikisTarihi = new DateTime(Convert.ToInt32(iscikisTarihi[2]), Convert.ToInt32(iscikisTarihi[0]), Convert.ToInt32(iscikisTarihi[1]));
             isgecmis.isGirisTarihi = new DateTime(Convert.ToInt32(isgirisTarihi[2]), Convert.ToInt32(isgirisTarihi[0]), Convert.ToInt32(isgirisTarihi[1]));
             isgecmis.departmanID = Convert.ToInt32(DropDownDepartman.SelectedValue);
             db.KullaniciIsGecmisis.Add(isgecmis);
                }
                catch (Exception)
                {

                }
            }
            else
            {
                try
                {
                isbilgisi.pozisyon = TextBoxPozisyon.Text;
                isbilgisi.IsyeriID = Convert.ToInt32(DropDownSirket.SelectedValue);
                string[] iscikisTarihi = TextBoxisBitisTarihi.Text.Replace(".", "/").Split('/');
                string[] isgirisTarihi = TextBoxisBaslangicTarihi.Text.Replace(".", "/").Split('/');
                isbilgisi.isCikisTarihi = new DateTime(Convert.ToInt32(iscikisTarihi[2]), Convert.ToInt32(iscikisTarihi[0]), Convert.ToInt32(iscikisTarihi[1]));
                isbilgisi.isGirisTarihi = new DateTime(Convert.ToInt32(isgirisTarihi[2]), Convert.ToInt32(isgirisTarihi[0]), Convert.ToInt32(isgirisTarihi[1]));
                isbilgisi.departmanID = Convert.ToInt32(DropDownDepartman.SelectedValue);
                }
                catch (Exception)
                {

                }
            }
            
           
           



            // Gerekli özellikller
            string ad = DropDownListIller.SelectedItem.Text;
            var sehir = db.Sehirs.Where(k => k.sehirAd == ad).FirstOrDefault();
            string[] dizi = TextBoxDogumTarihi.Text.Replace(".", "/").Split('/');
            
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();


            //EGitim Kayıt İşemleri
            var durum = db.OkunanBolums.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (durum == null)
            {
                try
                {

                
                Model.OkunanBolum okunan = new Model.OkunanBolum();
                okunan.bolumID = Convert.ToInt32(DropDownListBolum.SelectedValue);
                okunan.kullaniciID = kisi.kullaniciID;
                string[] girisTarihi = TextBoxGirisTarihi.Text.Replace(".", "/").Split('/');
                string[] cikisTarihi = TextBoxCikisTarihi.Text.Replace(".", "/").Split('/');
                okunan.girisTarihi = new DateTime(Convert.ToInt32(girisTarihi[2]), Convert.ToInt32(girisTarihi[0]), Convert.ToInt32(girisTarihi[1]));
                okunan.cikisTarihi = new DateTime(Convert.ToInt32(cikisTarihi[2]), Convert.ToInt32(cikisTarihi[0]), Convert.ToInt32(cikisTarihi[1]));
                if (CheckBoxMezunDurum.Checked)
                {
                    okunan.mezunDurumu = true;
                }
                else okunan.mezunDurumu = false;

                db.OkunanBolums.Add(okunan);
                }
                catch (Exception)
                {

                    
                }
            }
            else
            {

                try
                {

                durum.kullaniciID = kisi.kullaniciID;
                string[] girisTarihi = TextBoxGirisTarihi.Text.Replace(".", "/").Split('/');
                string[] cikisTarihi = TextBoxCikisTarihi.Text.Replace(".", "/").Split('/');
                if (DropDownListBolum.SelectedValue != null)
                {
                    durum.bolumID = Convert.ToInt32(DropDownListBolum.SelectedValue);
                    durum.girisTarihi = new DateTime(Convert.ToInt32(girisTarihi[2]), Convert.ToInt32(girisTarihi[0]), Convert.ToInt32(girisTarihi[1]));
                    durum.cikisTarihi = new DateTime(Convert.ToInt32(cikisTarihi[2]), Convert.ToInt32(cikisTarihi[0]), Convert.ToInt32(cikisTarihi[1]));
                
                }
                if (CheckBoxMezunDurum.Checked)
                {
                    durum.mezunDurumu = true;
                }
                else durum.mezunDurumu = false;

                }
                catch (Exception)
                {

                   
                }

            }




            //İletişim Kayıt
            if (TextBoxFace.Text != null && TextBoxFace.Text != "")
            {
                string face = TextBoxFace.Text.Substring(0, 1).ToLower();
                if (face == "h")
                {
                    kisi.facebookURL = TextBoxFace.Text;

                }
                else if (face == "w")
                {
                    kisi.facebookURL = "https://" + TextBoxFace.Text;
                }
                else if (face == "f")
                {
                    kisi.facebookURL = "https://www." + TextBoxFace.Text;
                }
            }
            if (TextBoxTwiter.Text != null && TextBoxTwiter.Text != "")
            {
                string twit = TextBoxTwiter.Text.Substring(0, 1).ToLower();
                if (twit == "h")
                {
                    kisi.twitterURL = TextBoxTwiter.Text;

                }
                else if (twit == "w")
                {
                    kisi.twitterURL = "https://" + TextBoxTwiter.Text;
                }
                else if (twit == "t")
                {
                    kisi.twitterURL = "https://www." + TextBoxTwiter.Text;
                }
            }


            kisi.gosterilenMail = TextBoxMail.Text;
            kisi.hakkimda = TextBoxHakkimda.Text;
            kisi.isBilgisi = TextBoxis.Text;
            kisi.cinsiyet = DropDownListCinsiyet.SelectedItem.Text;

            kisi.dTarihi = new DateTime(Convert.ToInt32(dizi[2]), Convert.ToInt32(dizi[0]), Convert.ToInt32(dizi[1]));
            kisi.sehirID = sehir.sehirID;
            byte[] bytUpfile;
            if (FileUpload1.HasFile)
            {
                try
                {
                    string strTestFilePath = FileUpload1.PostedFile.FileName;
                    string strTestFileName = Path.GetFileName(strTestFilePath);
                    Int32 intFileSize = FileUpload1.PostedFile.ContentLength;
                    string strContentType = FileUpload1.PostedFile.ContentType;
                    string ext = Path.GetExtension(strTestFileName);
                    string yol = Path.GetFullPath(strTestFilePath);


                    if (ext == ".png" || ext == ".jpg" || ext == ".jpeg" || ext == ".PNG" || ext == ".JPG" || ext == ".JPEG" || ext == ".gif" || ext == ".GIF")
                    {

                        // 
                        Stream strmStream = FileUpload1.PostedFile.InputStream;
                        Int32 intFileLength = (Int32)strmStream.Length;
                        bytUpfile = new byte[intFileLength + 1];
                        strmStream.Read(bytUpfile, 0, intFileLength);
                        strmStream.Close();
                        string strBase64 = Convert.ToBase64String(bytUpfile);
                        Image1.ImageUrl = "data:Image/png;base64," + strBase64;
                        kisi.resim = bytUpfile;
                        LabelHata.Text = Convert.ToString(FileUpload1.FileBytes);
                        LabelHata.Visible = false;


                    }
                    else
                    {
                        Response.Write("<script>alert('Lütfen Bir Resim Formatı Seçiniz!');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }




            db.SaveChanges();
            Response.Redirect("profil.aspx");

        }

        protected void LinkButtonResim_Click(object sender, EventArgs e)
        {


        }

        protected void FileUpload1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_Load(object sender, EventArgs e)
        {

            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();

        }

        protected void FileUpload1_Init(object sender, EventArgs e)
        {

        }

        protected void FileUpload1_Unload(object sender, EventArgs e)
        {

        }

        protected void DropDownListEgitimSehir_SelectedIndexChanged(object sender, EventArgs e)
        {




        }

        protected void DropDownListEgitimSehir_TextChanged(object sender, EventArgs e)
        {
            DropDownListEgitimUni.Items.Clear();
            DropDownListEgitimFakulte.Items.Clear();
            DropDownListBolum.Items.Clear();
            var sehir = db.Sehirs.Where(s => s.sehirAd == DropDownListEgitimSehir.SelectedItem.Text).FirstOrDefault();
            int sehID = sehir.sehirID;
            var uni = db.Universites.Where(u => u.sehirID == sehID).ToList();
            DropDownListEgitimUni.DataSource = uni;
            DropDownListEgitimUni.DataTextField = "uniAd";
            DropDownListEgitimUni.DataValueField = "uniID";
            DropDownListEgitimUni.DataBind();
        }

        protected void DropDownListEgitimUni_TextChanged(object sender, EventArgs e)
        {
            DropDownListEgitimFakulte.Items.Clear();
            DropDownListBolum.Items.Clear();
            int uniID = Convert.ToInt32(DropDownListEgitimUni.SelectedValue);
            var fakulte = db.OkulFakultes.Where(u => u.uniID == uniID).ToList();
            DropDownListEgitimFakulte.DataSource = fakulte;
            DropDownListEgitimFakulte.DataTextField = "okulAd";
            DropDownListEgitimFakulte.DataValueField = "okulID";
            DropDownListEgitimFakulte.DataBind();
        }

        protected void DropDownListEgitimFakulte_TextChanged(object sender, EventArgs e)
        {
            DropDownListBolum.Items.Clear();
            int fakID = Convert.ToInt32(DropDownListEgitimFakulte.SelectedValue);
            var bolum = db.Bolums.Where(u => u.okulID == fakID).ToList();
            DropDownListBolum.DataSource = bolum;
            DropDownListBolum.DataTextField = "bolumAd";
            DropDownListBolum.DataValueField = "bolumID";
            DropDownListBolum.DataBind();
        }

        protected void DropDownSirketSehir_TextChanged(object sender, EventArgs e)
        {
            DropDownSirket.Items.Clear();
            DropDownDepartman.Items.Clear();
            
            var sehir = db.Sehirs.Where(s => s.sehirAd == DropDownSirketSehir.SelectedItem.Text).FirstOrDefault();
            int sehID = sehir.sehirID;
            var isYeri = db.Isyeris.Where(u => u.sehırID == sehID).ToList();
            DropDownSirket.DataSource = isYeri;
            DropDownSirket.DataTextField = "IsyeriAd";
            DropDownSirket.DataValueField = "IsyeriID";
            DropDownSirket.DataBind();
        }

        protected void DropDownSirket_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownDepartman.Items.Clear();
            
            var isAd = db.Isyeris.Where(s => s.IsyeriAd == DropDownSirket.SelectedItem.Text).FirstOrDefault();
            int isYeriID = isAd.IsyeriID;
            var departaman = db.Departmen.Where(u => u.IsyeriID == isYeriID).ToList();
            DropDownDepartman.DataSource = departaman;
            DropDownDepartman.DataTextField = "departmanAd";
            DropDownDepartman.DataValueField = "departmanID";
            DropDownDepartman.DataBind();
        }
    }
}