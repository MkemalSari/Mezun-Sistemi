using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MezunSistemiProjesi
{
    public partial class denemeAmaclidir : System.Web.UI.Page
    {
        Model.MezunVsEntities db = new Model.MezunVsEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            iller.Add("Adana");
            iller.Add(" Adıyaman");
            iller.Add(" Afyon");
            iller.Add(" Ağrı");
            iller.Add(" Amasya");
            iller.Add(" Ankara");
            iller.Add(" Antalya");
            iller.Add(" Artvin");
            iller.Add(" Aydın");
            iller.Add(" Balıkesir");
            iller.Add(" Bilecik");
            iller.Add(" Bingöl");
            iller.Add(" Bitlis");
            iller.Add(" Bolu");
            iller.Add(" Burdur");
            iller.Add(" Bursa");
            iller.Add(" Çanakkale");
            iller.Add(" Çankırı");
            iller.Add(" Çorum");
            iller.Add(" Denizli");
            iller.Add(" Diyarbakır");
            iller.Add(" Edirne");
            iller.Add(" Elazığ");
            iller.Add(" Erzincan");
            iller.Add(" Erzurum");
            iller.Add(" Eskişehir");
            iller.Add(" Gaziantep");
            iller.Add(" Giresun");
            iller.Add(" Gümüşhane");
            iller.Add(" Hakkari");
            iller.Add(" Hatay");
            iller.Add(" Isparta");
            iller.Add(" İçel (Mersin)");
            iller.Add(" İstanbul");
            iller.Add(" İzmir");
            iller.Add(" Kars");
            iller.Add(" Kastamonu");
            iller.Add(" Kayseri");
            iller.Add(" Kırklareli");
            iller.Add(" Kırşehir");
            iller.Add(" Kocaeli");
            iller.Add(" Konya");
            iller.Add(" Kütahya");
            iller.Add(" Malatya");
            iller.Add(" Manisa");
            iller.Add(" K.maraş");
            iller.Add(" Mardin");
            iller.Add(" Muğla");
            iller.Add(" Muş");
            iller.Add(" Nevşehir");
            iller.Add(" Niğde");
            iller.Add(" Ordu");
            iller.Add(" Rize");
            iller.Add(" Sakarya");
            iller.Add(" Samsun");
            iller.Add(" Siirt");
            iller.Add(" Sinop");
            iller.Add(" Sivas");
            iller.Add(" Tekirdağ");
            iller.Add(" Tokat");
            iller.Add(" Trabzon");
            iller.Add(" Tunceli");
            iller.Add(" Şanlıurfa");
            iller.Add(" Uşak");
            iller.Add(" Van");
            iller.Add(" Yozgat");
            iller.Add(" Zonguldak");
            iller.Add(" Aksaray");
            iller.Add(" Bayburt");
            iller.Add(" Karaman");
            iller.Add(" Kırıkkale");
            iller.Add(" Batman");
            iller.Add(" Şırnak");
            iller.Add(" Bartın");
            iller.Add(" Ardahan");
            iller.Add(" Iğdır");
            iller.Add(" Yalova");
            iller.Add(" Karabük");
            iller.Add(" Kilis");
            iller.Add(" Osmaniye");
            iller.Add(" Düzce");
        }
        List<string> iller = new List<string>();
        protected void Button1_Click(object sender, EventArgs e)
        {
                            
                             for (int i = 0; i < iller.Count; i++)
                             {
                                 Model.Sehir sehir = new Model.Sehir();
                                 sehir.sehirID = i+1;
                                 sehir.sehirAd = iller[i]; 
                                 db.Sehirs.Add(sehir);   
                                 db.SaveChanges();
                             }
                               
                                 
                                          
              
        }
    }
}