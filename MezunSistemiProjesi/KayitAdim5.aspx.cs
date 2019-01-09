using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
   
    public partial class KayitAdim5 : System.Web.UI.Page
    {



        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
          
            ButtonResimSec.Attributes.Add("onclick", "document.getElementById('" + FileUpload1.ClientID + "').click(); return false;");

            
           
                 if (Session["ID"]==null)
            {
                 Response.Redirect("Login.aspx");
            }
            
           
           
           
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (kisi.cinsiyet=="Erkek")
            {
                imageView1.ImageUrl = "image\\Man.jpg";
            }
            else
            {
                imageView1.ImageUrl = "image\\Woman.jpg";
            }
           
        }

        protected void LinkButtonGec_Click1(object sender, EventArgs e)
           
        {   
            
            int id = (int)Session["ID"];
            string yol;
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
            if (kisi.cinsiyet == "Erkek")
            {
                yol = @"C:\Users\MustafaKemal\Desktop\son proje\MezunSistemiProjesi\image\Man.jpg";
            }
            else
            {
                yol = @"C:\Users\MustafaKemal\Desktop\son proje\MezunSistemiProjesi\image\Woman.jpg";
            }
           
            byte[] imageData = null;
                 FileInfo fileInfo = new FileInfo(yol); 
                  long imageFileLength = fileInfo.Length;
           
                FileStream fs = new FileStream(yol, FileMode.Open, FileAccess.Read); 
                BinaryReader br = new BinaryReader(fs);
                imageData = br.ReadBytes((int)imageFileLength); 
                kisi.resim= imageData;
          
          
           
            db.SaveChanges();
           Response.Redirect("Profil.aspx"); 

           


        }
        protected void LinkButtonIleri_Click(object sender, EventArgs e)
        {
            int id = (int)Session["ID"];
            var kisi = db.Kullanicis.Where(k => k.kullaniciID == id).FirstOrDefault();
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
                        byte[] bytUpfile = new byte[intFileLength + 1];
                        strmStream.Read(bytUpfile, 0, intFileLength);
                        strmStream.Close();

                        kisi.resim = bytUpfile;
                        db.SaveChanges();


                        Label1.Visible = false;


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



            //string strBase64 = Convert.ToBase64String(kisi.resim);
            //imageView1.ImageUrl = "data:Image/png;base64," + strBase64; 

          
            if (kisi.resim!=null)
            {
                 Response.Redirect("Profil.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
        }
       
        protected void ButtonResimSec_Click(object sender, EventArgs e)
        {
           
            
        }

        protected void LinkButtonYukle_Click(object sender, EventArgs e)
        {
            

            
        }

       

        
    }
}