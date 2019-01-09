<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Duzenle.aspx.cs" Inherits="MezunSistemiProjesi.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOrtaBolge" runat="server">
       <!-- extra div for emulating position:fixed of the menu -->
       
     <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function PreviewImageBeforeUpload(Imagepath) {
            if (Imagepath.files && Imagepath.files[0]) {
                var Filerdr = new FileReader();
                Filerdr.onload = function (e) {
                    $('#ContentPlaceHolderOrtaBolge_Image1').attr('src', e.target.result);
                }
                Filerdr.readAsDataURL(Imagepath.files[0]);
            }
        }
    </script>
   
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
      
           
                 
              <div class="media-left">

                <div class="width-250 width-auto-xs">
                  <div class="panel panel-default widget-user-1 text-center">
                    <div class="avatar">
                        
                         <asp:LinkButton class="btn " ID="LinkButtonResim" runat="server" OnClick="LinkButtonResim_Click" ><asp:Image ID="Image1" CssClass=" img-circle" Width="120px" Height="120px" runat="server" /><br /> <br /> Değiştirmek İçin Tıklayın</asp:LinkButton>
                        <asp:Label ID="LabelHata" runat="server" ></asp:Label>
                      
                      <h3><asp:Label ID="LabelKullaniciİsim" runat="server" Text=""></asp:Label></h3>
                     
                        <asp:LinkButton class="btn btn-success" ID="LinkBtnArkadasEkle" runat="server" OnClick="LinkBtnArkadasEkle_Click">Kaydet <i class="fa fa-save"></i></asp:LinkButton>

                       
                         <asp:FileUpload ID="FileUpload1" style="display:none" accept=".png,.jpg,.jpeg,.gif" onchange="PreviewImageBeforeUpload(this);"  runat="server" />

                     
                    </div>
                    <div class="profile-icons margin-none">
                       
                      <span><i class="fa fa-users"></i><asp:Label ID="LabelArkadasSayisi" runat="server" Text="372"></asp:Label>  </span>
                      <span><i class="fa fa-photo"></i><asp:Label ID="LabelResimSayisi" runat="server" Text="53"></asp:Label></span>
                      <span><i class="fa fa-video-camera"></i><asp:Label ID="LabelVideoSayisi" runat="server" Text="15"></asp:Label></span>
                    </div>
                    <div class="panel-body">
                      <div >
                        <div class="expandable-content">
                        
                         
                        <div class="panel-heading panel-heading-gray title">
                             Hakkımda
                    </div>
                              <div class="panel-body">
                      <asp:TextBox style="height:150px; width:200px"  ID="TextBoxHakkimda" type="text" class="form-control share-text " TextMode="multiline" rows="3" placeholder="Hakkımda..." runat="server" Columns="2" ></asp:TextBox>
                    </div>
                         
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Contact -->
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      İletişim
                        
                    </div>
                    
                      
                         <div class="input-group">
                             
                              <span class="input-group-addon"><i class="fa fa-envelope fa-fw"></i></span> 
                            
                             <asp:TextBox ID="TextBoxMail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                         
                       <div class="input-group">
                              <span class="input-group-addon"><i class="fa fa-facebook fa-fw"></i></span>
                           
                          
                             <asp:TextBox ID="TextBoxFace" class="form-control " runat="server"></asp:TextBox>
                            
                           
                            
                            </div>
                         
                       <div class="input-group">
                              <span class="input-group-addon"><i class="fa fa-twitter fa-fw"></i></span>
                            
                            <asp:TextBox ID="TextBoxTwiter" class="form-control " runat="server"></asp:TextBox>
                           
                            </div>
                      <br />    
                            
                       
                          

                       
                         
                       
                   
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxFace" Display="Dynamic" ErrorMessage="Hatalı Facebook Adresi !" ForeColor="#FF0066" ValidationExpression="(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?"></asp:RegularExpressionValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxTwiter" Display="Dynamic" ErrorMessage="Hatalı Twitter Adresi !" ForeColor="#FF0066" ValidationExpression="(?:(?:http|https):\/\/)?(?:www.)?twitter.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?"></asp:RegularExpressionValidator>
                            
                       
                          

                       
                         
                       
                   
                  </div>
                </div>
              </div>
              
              <div class="media-body">
                
                
              

                <div >
                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-gray">

                      <asp:LinkButton ID="LinkButtonGuncelle" class="btn btn-primary btn-xs pull-right" runat="server" >Güncelle <i class="fa fa-pencil"></i></asp:LinkButton>
                        <i class="fa fa-fw fa-info-circle"></i> Hakımda
                      </div>
                      <div class="panel-body">
                        <ul class="list-unstyled profile-about margin-none">
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Doğum Tarihi</span></div>
                              <div class="col-sm-8">
                       
                          <asp:TextBox ID="TextBoxDogumTarihi" CssClass=" form-control datepicker" runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">İş</span></div>
                              <div class="col-sm-8">
                             
                                <asp:TextBox ID="TextBoxis"  type="text" class="form-control " runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Cinsiyet</span></div>
                              <div class="col-sm-8">
                                 
                                <asp:DropDownList  ID="DropDownListCinsiyet" Height="30px"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="false" data-size="6" style="display: none" runat="server">
                                     <asp:ListItem>Erkek</asp:ListItem>
                                          <asp:ListItem>Kadın</asp:ListItem>
                                        
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Yaşadığı Yer</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownListIller"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server">
                                
                                           <asp:ListItem>Adana</asp:ListItem>
                                          <asp:ListItem> Adıyaman</asp:ListItem>
                                          <asp:ListItem> Afyon</asp:ListItem>
                                          <asp:ListItem> Ağrı</asp:ListItem>
                                          <asp:ListItem> Amasya</asp:ListItem>
                                          <asp:ListItem> Ankara</asp:ListItem>
                                          <asp:ListItem> Antalya</asp:ListItem>
                                          <asp:ListItem> Artvin</asp:ListItem>
                                          <asp:ListItem> Aydın</asp:ListItem>
                                          <asp:ListItem> Balıkesir</asp:ListItem>
                                          <asp:ListItem> Bilecik</asp:ListItem>
                                          <asp:ListItem> Bingöl</asp:ListItem>
                                          <asp:ListItem> Bitlis</asp:ListItem>
                                          <asp:ListItem> Bolu</asp:ListItem>
                                          <asp:ListItem> Burdur</asp:ListItem>
                                          <asp:ListItem> Bursa</asp:ListItem>
                                          <asp:ListItem> Çanakkale</asp:ListItem>
                                          <asp:ListItem> Çankırı</asp:ListItem>
                                          <asp:ListItem> Çorum</asp:ListItem>
                                          <asp:ListItem> Denizli</asp:ListItem>
                                          <asp:ListItem> Diyarbakır</asp:ListItem>
                                          <asp:ListItem> Edirne</asp:ListItem>
                                          <asp:ListItem> Elazığ</asp:ListItem>
                                          <asp:ListItem> Erzincan</asp:ListItem>
                                          <asp:ListItem> Erzurum</asp:ListItem>
                                          <asp:ListItem> Eskişehir</asp:ListItem>
                                          <asp:ListItem> Gaziantep</asp:ListItem>
                                          <asp:ListItem> Giresun</asp:ListItem>
                                          <asp:ListItem> Gümüşhane</asp:ListItem>
                                          <asp:ListItem> Hakkari</asp:ListItem>
                                          <asp:ListItem> Hatay</asp:ListItem>
                                          <asp:ListItem> Isparta</asp:ListItem>
                                          <asp:ListItem> İçel (Mersin)</asp:ListItem>
                                          <asp:ListItem> İstanbul</asp:ListItem>
                                          <asp:ListItem> İzmir</asp:ListItem>
                                          <asp:ListItem> Kars</asp:ListItem>
                                          <asp:ListItem> Kastamonu</asp:ListItem>
                                          <asp:ListItem> Kayseri</asp:ListItem>
                                          <asp:ListItem> Kırklareli</asp:ListItem>
                                          <asp:ListItem> Kırşehir</asp:ListItem>
                                          <asp:ListItem> Kocaeli</asp:ListItem>
                                          <asp:ListItem> Konya</asp:ListItem>
                                          <asp:ListItem> Kütahya</asp:ListItem>
                                          <asp:ListItem> Malatya</asp:ListItem>
                                          <asp:ListItem> Manisa</asp:ListItem>
                                          <asp:ListItem> K.maraş</asp:ListItem>
                                          <asp:ListItem> Mardin</asp:ListItem>
                                          <asp:ListItem> Muğla</asp:ListItem>
                                          <asp:ListItem> Muş</asp:ListItem>
                                          <asp:ListItem> Nevşehir</asp:ListItem>
                                          <asp:ListItem> Niğde</asp:ListItem>
                                          <asp:ListItem> Ordu</asp:ListItem>
                                          <asp:ListItem> Rize</asp:ListItem>
                                          <asp:ListItem> Sakarya</asp:ListItem>
                                          <asp:ListItem> Samsun</asp:ListItem>
                                          <asp:ListItem> Siirt</asp:ListItem>
                                          <asp:ListItem> Sinop</asp:ListItem>
                                          <asp:ListItem> Sivas</asp:ListItem>
                                          <asp:ListItem> Tekirdağ</asp:ListItem>
                                          <asp:ListItem> Tokat</asp:ListItem>
                                          <asp:ListItem> Trabzon</asp:ListItem>
                                          <asp:ListItem> Tunceli</asp:ListItem>
                                          <asp:ListItem> Şanlıurfa</asp:ListItem>
                                          <asp:ListItem> Uşak</asp:ListItem>
                                          <asp:ListItem> Van</asp:ListItem>
                                          <asp:ListItem> Yozgat</asp:ListItem>
                                          <asp:ListItem> Zonguldak</asp:ListItem>
                                          <asp:ListItem> Aksaray</asp:ListItem>
                                          <asp:ListItem> Bayburt</asp:ListItem>
                                          <asp:ListItem> Karaman</asp:ListItem>
                                          <asp:ListItem> Kırıkkale</asp:ListItem>
                                          <asp:ListItem> Batman</asp:ListItem>
                                          <asp:ListItem> Şırnak</asp:ListItem>
                                          <asp:ListItem> Bartın</asp:ListItem>
                                          <asp:ListItem> Ardahan</asp:ListItem>
                                          <asp:ListItem> Iğdır</asp:ListItem>
                                          <asp:ListItem> Yalova</asp:ListItem>
                                          <asp:ListItem> Karabük</asp:ListItem>
                                          <asp:ListItem> Kilis</asp:ListItem>
                                          <asp:ListItem> Osmaniye</asp:ListItem>
                                          <asp:ListItem> Düzce</asp:ListItem>
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                         
                        </ul>
                      </div>
                    </div>
                  </div>
                    <div class="row">
                 
                    <div class="col-md-6">
                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-gray">
                        <div class="pull-right">
                          
                          <asp:LinkButton ID="LinkButton1" class="btn btn-primary btn-xs" runat="server">Ekle <i class="fa fa-plus"></i></asp:LinkButton>
                        </div>
                        <i class="fa fa-book"></i> Eğitim
                      </div>
                     
                         <div class="panel-body">
                        <ul class="list-unstyled profile-about margin-none">
                         
                         
                         
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Okunan Şehir</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownListEgitimSehir" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnSelectedIndexChanged="DropDownListEgitimSehir_SelectedIndexChanged" OnTextChanged="DropDownListEgitimSehir_TextChanged">
                                
                                           <asp:ListItem>Adana</asp:ListItem>
                                          <asp:ListItem> Adıyaman</asp:ListItem>
                                          <asp:ListItem> Afyon</asp:ListItem>
                                          <asp:ListItem> Ağrı</asp:ListItem>
                                          <asp:ListItem> Amasya</asp:ListItem>
                                          <asp:ListItem> Ankara</asp:ListItem>
                                          <asp:ListItem> Antalya</asp:ListItem>
                                          <asp:ListItem> Artvin</asp:ListItem>
                                          <asp:ListItem> Aydın</asp:ListItem>
                                          <asp:ListItem> Balıkesir</asp:ListItem>
                                          <asp:ListItem> Bilecik</asp:ListItem>
                                          <asp:ListItem> Bingöl</asp:ListItem>
                                          <asp:ListItem> Bitlis</asp:ListItem>
                                          <asp:ListItem> Bolu</asp:ListItem>
                                          <asp:ListItem> Burdur</asp:ListItem>
                                          <asp:ListItem> Bursa</asp:ListItem>
                                          <asp:ListItem> Çanakkale</asp:ListItem>
                                          <asp:ListItem> Çankırı</asp:ListItem>
                                          <asp:ListItem> Çorum</asp:ListItem>
                                          <asp:ListItem> Denizli</asp:ListItem>
                                          <asp:ListItem> Diyarbakır</asp:ListItem>
                                          <asp:ListItem> Edirne</asp:ListItem>
                                          <asp:ListItem> Elazığ</asp:ListItem>
                                          <asp:ListItem> Erzincan</asp:ListItem>
                                          <asp:ListItem> Erzurum</asp:ListItem>
                                          <asp:ListItem> Eskişehir</asp:ListItem>
                                          <asp:ListItem> Gaziantep</asp:ListItem>
                                          <asp:ListItem> Giresun</asp:ListItem>
                                          <asp:ListItem> Gümüşhane</asp:ListItem>
                                          <asp:ListItem> Hakkari</asp:ListItem>
                                          <asp:ListItem> Hatay</asp:ListItem>
                                          <asp:ListItem> Isparta</asp:ListItem>
                                          <asp:ListItem> İçel (Mersin)</asp:ListItem>
                                          <asp:ListItem> İstanbul</asp:ListItem>
                                          <asp:ListItem> İzmir</asp:ListItem>
                                          <asp:ListItem> Kars</asp:ListItem>
                                          <asp:ListItem> Kastamonu</asp:ListItem>
                                          <asp:ListItem> Kayseri</asp:ListItem>
                                          <asp:ListItem> Kırklareli</asp:ListItem>
                                          <asp:ListItem> Kırşehir</asp:ListItem>
                                          <asp:ListItem> Kocaeli</asp:ListItem>
                                          <asp:ListItem> Konya</asp:ListItem>
                                          <asp:ListItem> Kütahya</asp:ListItem>
                                          <asp:ListItem> Malatya</asp:ListItem>
                                          <asp:ListItem> Manisa</asp:ListItem>
                                          <asp:ListItem> K.maraş</asp:ListItem>
                                          <asp:ListItem> Mardin</asp:ListItem>
                                          <asp:ListItem> Muğla</asp:ListItem>
                                          <asp:ListItem> Muş</asp:ListItem>
                                          <asp:ListItem> Nevşehir</asp:ListItem>
                                          <asp:ListItem> Niğde</asp:ListItem>
                                          <asp:ListItem> Ordu</asp:ListItem>
                                          <asp:ListItem> Rize</asp:ListItem>
                                          <asp:ListItem> Sakarya</asp:ListItem>
                                          <asp:ListItem> Samsun</asp:ListItem>
                                          <asp:ListItem> Siirt</asp:ListItem>
                                          <asp:ListItem> Sinop</asp:ListItem>
                                          <asp:ListItem> Sivas</asp:ListItem>
                                          <asp:ListItem> Tekirdağ</asp:ListItem>
                                          <asp:ListItem> Tokat</asp:ListItem>
                                          <asp:ListItem> Trabzon</asp:ListItem>
                                          <asp:ListItem> Tunceli</asp:ListItem>
                                          <asp:ListItem> Şanlıurfa</asp:ListItem>
                                          <asp:ListItem> Uşak</asp:ListItem>
                                          <asp:ListItem> Van</asp:ListItem>
                                          <asp:ListItem> Yozgat</asp:ListItem>
                                          <asp:ListItem> Zonguldak</asp:ListItem>
                                          <asp:ListItem> Aksaray</asp:ListItem>
                                          <asp:ListItem> Bayburt</asp:ListItem>
                                          <asp:ListItem> Karaman</asp:ListItem>
                                          <asp:ListItem> Kırıkkale</asp:ListItem>
                                          <asp:ListItem> Batman</asp:ListItem>
                                          <asp:ListItem> Şırnak</asp:ListItem>
                                          <asp:ListItem> Bartın</asp:ListItem>
                                          <asp:ListItem> Ardahan</asp:ListItem>
                                          <asp:ListItem> Iğdır</asp:ListItem>
                                          <asp:ListItem> Yalova</asp:ListItem>
                                          <asp:ListItem> Karabük</asp:ListItem>
                                          <asp:ListItem> Kilis</asp:ListItem>
                                          <asp:ListItem> Osmaniye</asp:ListItem>
                                          <asp:ListItem> Düzce</asp:ListItem>
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                             <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Okunan Üniversite</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownListEgitimUni" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnTextChanged="DropDownListEgitimUni_TextChanged">
                                       
                                
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                         <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Okunan Fakülte</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownListEgitimFakulte" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnTextChanged="DropDownListEgitimFakulte_TextChanged">
                                
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                            <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Okunan Bölüm</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownListBolum"  AutoPostBack="true" name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server">
                                
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                         
                            <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Başlangıç Tarihi</span></div>
                              <div class="col-sm-8">
                       
                          <asp:TextBox ID="TextBoxGirisTarihi" CssClass=" form-control datepicker" runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                             <li class="padding-v-5">

                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Bitiş Tarihi</span></div>
                              <div class="col-sm-8">
                       
                          <asp:TextBox ID="TextBoxCikisTarihi" CssClass=" form-control datepicker" runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                               <li>
                            <div class="row">  
                                <div class="col-md-4"> </div>
                                 <div class="col-md-4">   
                                      <asp:CheckBox ID="CheckBoxMezunDurum" runat="server" /> <span class="text-muted"> &nbsp Mezun Oldum</span>
                                 </div>
                            <div class="col-md-4"></div>

                            </div>

                            </li>
                        </ul>
                      </div>
                      
                    </div>
                  </div>
                        


                  <div class="col-md-6">
                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-gray">
                        <div class="pull-right">
                          
                          <asp:LinkButton ID="LinkButtonArkEkle" class="btn btn-primary btn-xs" runat="server">Ekle <i class="fa fa-plus"></i></asp:LinkButton>
                        </div>
                        <i class="fa fa-suitcase"></i> İş
                      </div>
                      <div class="panel-body">
                        
                          <ul class="list-unstyled profile-about margin-none">
                         
                         
                         
                          <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Çalışılan Şehir</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownSirketSehir" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnSelectedIndexChanged="DropDownListEgitimSehir_SelectedIndexChanged" OnTextChanged="DropDownSirketSehir_TextChanged">
                                
                                           <asp:ListItem>Adana</asp:ListItem>
                                          <asp:ListItem> Adıyaman</asp:ListItem>
                                          <asp:ListItem> Afyon</asp:ListItem>
                                          <asp:ListItem> Ağrı</asp:ListItem>
                                          <asp:ListItem> Amasya</asp:ListItem>
                                          <asp:ListItem> Ankara</asp:ListItem>
                                          <asp:ListItem> Antalya</asp:ListItem>
                                          <asp:ListItem> Artvin</asp:ListItem>
                                          <asp:ListItem> Aydın</asp:ListItem>
                                          <asp:ListItem> Balıkesir</asp:ListItem>
                                          <asp:ListItem> Bilecik</asp:ListItem>
                                          <asp:ListItem> Bingöl</asp:ListItem>
                                          <asp:ListItem> Bitlis</asp:ListItem>
                                          <asp:ListItem> Bolu</asp:ListItem>
                                          <asp:ListItem> Burdur</asp:ListItem>
                                          <asp:ListItem> Bursa</asp:ListItem>
                                          <asp:ListItem> Çanakkale</asp:ListItem>
                                          <asp:ListItem> Çankırı</asp:ListItem>
                                          <asp:ListItem> Çorum</asp:ListItem>
                                          <asp:ListItem> Denizli</asp:ListItem>
                                          <asp:ListItem> Diyarbakır</asp:ListItem>
                                          <asp:ListItem> Edirne</asp:ListItem>
                                          <asp:ListItem> Elazığ</asp:ListItem>
                                          <asp:ListItem> Erzincan</asp:ListItem>
                                          <asp:ListItem> Erzurum</asp:ListItem>
                                          <asp:ListItem> Eskişehir</asp:ListItem>
                                          <asp:ListItem> Gaziantep</asp:ListItem>
                                          <asp:ListItem> Giresun</asp:ListItem>
                                          <asp:ListItem> Gümüşhane</asp:ListItem>
                                          <asp:ListItem> Hakkari</asp:ListItem>
                                          <asp:ListItem> Hatay</asp:ListItem>
                                          <asp:ListItem> Isparta</asp:ListItem>
                                          <asp:ListItem> İçel (Mersin)</asp:ListItem>
                                          <asp:ListItem> İstanbul</asp:ListItem>
                                          <asp:ListItem> İzmir</asp:ListItem>
                                          <asp:ListItem> Kars</asp:ListItem>
                                          <asp:ListItem> Kastamonu</asp:ListItem>
                                          <asp:ListItem> Kayseri</asp:ListItem>
                                          <asp:ListItem> Kırklareli</asp:ListItem>
                                          <asp:ListItem> Kırşehir</asp:ListItem>
                                          <asp:ListItem> Kocaeli</asp:ListItem>
                                          <asp:ListItem> Konya</asp:ListItem>
                                          <asp:ListItem> Kütahya</asp:ListItem>
                                          <asp:ListItem> Malatya</asp:ListItem>
                                          <asp:ListItem> Manisa</asp:ListItem>
                                          <asp:ListItem> K.maraş</asp:ListItem>
                                          <asp:ListItem> Mardin</asp:ListItem>
                                          <asp:ListItem> Muğla</asp:ListItem>
                                          <asp:ListItem> Muş</asp:ListItem>
                                          <asp:ListItem> Nevşehir</asp:ListItem>
                                          <asp:ListItem> Niğde</asp:ListItem>
                                          <asp:ListItem> Ordu</asp:ListItem>
                                          <asp:ListItem> Rize</asp:ListItem>
                                          <asp:ListItem> Sakarya</asp:ListItem>
                                          <asp:ListItem> Samsun</asp:ListItem>
                                          <asp:ListItem> Siirt</asp:ListItem>
                                          <asp:ListItem> Sinop</asp:ListItem>
                                          <asp:ListItem> Sivas</asp:ListItem>
                                          <asp:ListItem> Tekirdağ</asp:ListItem>
                                          <asp:ListItem> Tokat</asp:ListItem>
                                          <asp:ListItem> Trabzon</asp:ListItem>
                                          <asp:ListItem> Tunceli</asp:ListItem>
                                          <asp:ListItem> Şanlıurfa</asp:ListItem>
                                          <asp:ListItem> Uşak</asp:ListItem>
                                          <asp:ListItem> Van</asp:ListItem>
                                          <asp:ListItem> Yozgat</asp:ListItem>
                                          <asp:ListItem> Zonguldak</asp:ListItem>
                                          <asp:ListItem> Aksaray</asp:ListItem>
                                          <asp:ListItem> Bayburt</asp:ListItem>
                                          <asp:ListItem> Karaman</asp:ListItem>
                                          <asp:ListItem> Kırıkkale</asp:ListItem>
                                          <asp:ListItem> Batman</asp:ListItem>
                                          <asp:ListItem> Şırnak</asp:ListItem>
                                          <asp:ListItem> Bartın</asp:ListItem>
                                          <asp:ListItem> Ardahan</asp:ListItem>
                                          <asp:ListItem> Iğdır</asp:ListItem>
                                          <asp:ListItem> Yalova</asp:ListItem>
                                          <asp:ListItem> Karabük</asp:ListItem>
                                          <asp:ListItem> Kilis</asp:ListItem>
                                          <asp:ListItem> Osmaniye</asp:ListItem>
                                          <asp:ListItem> Düzce</asp:ListItem>
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                             <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Şirket</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownSirket" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnSelectedIndexChanged="DropDownSirket_SelectedIndexChanged">
                                       
                                
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                         <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Departman</span></div>
                              <div class="col-sm-8">
                                      
                                    <asp:DropDownList  ID="DropDownDepartman" AutoPostBack="true"  name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" style="display: none" runat="server" OnTextChanged="DropDownListEgitimFakulte_TextChanged">
                                
                                           </asp:DropDownList></div>
                            </div>
                          </li>
                            <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Pozisyon</span></div>
                              <div class="col-sm-8">
                                      
                                     <asp:TextBox ID="TextBoxPozisyon"  type="text" class="form-control " runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                         
                            <li class="padding-v-5">
                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Başlangıç Tarihi</span></div>
                              <div class="col-sm-8">
                       
                          <asp:TextBox ID="TextBoxisBaslangicTarihi" CssClass=" form-control datepicker" runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                             <li class="padding-v-5">

                            <div class="row">
                              <div class="col-sm-4"><span class="text-muted">Bitiş Tarihi</span></div>
                              <div class="col-sm-8">
                       
                          <asp:TextBox ID="TextBoxisBitisTarihi" CssClass=" form-control datepicker" runat="server"></asp:TextBox></div>
                            </div>
                          </li>
                               <li>
                            <div class="row">  
                                <div class="col-md-4"> </div>
                                 <div class="col-md-6">   
                                    
                                 </div>
                            <div class="col-md-2"></div>

                            </div>

                            </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
  
               
            
        
        <!-- /st-content-inner -->

      


</asp:Content>
