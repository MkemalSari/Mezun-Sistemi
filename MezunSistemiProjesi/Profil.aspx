<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="MezunSistemiProjesi.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolderOrtaBolge">

    <!-- extra div for emulating position:fixed of the menu -->



    <div class="media media-grid media-clearfix-xs">
        <div class="media-left">

            <div class="width-250 width-auto-xs">
                <div class="panel panel-default widget-user-1 text-center">
                    <div class="avatar">
                        <asp:Image ID="Image1" CssClass=" img-circle" Width="120px" Height="120px" runat="server" />

                        <h3>
                            <asp:Label ID="LabelKullaniciİsim" runat="server" Text=""></asp:Label></h3>

                        <asp:LinkButton CssClass="" ID="LinkBtnArkadasEkle" runat="server" OnClick="LinkBtnArkadasEkle_Click">Arkadaşlıktan Çıkar <i class="fa fa-check-circle fa-fw"></i></asp:LinkButton>


                    </div>
                    <div class="profile-icons margin-none">

                        <span><i class="fa fa-users"></i>
                            <asp:Label ID="LabelArkadasSayisi" runat="server" Text="372"></asp:Label>
                        </span>
                        <span><i class="fa fa-photo"></i>
                            <asp:Label ID="LabelResimSayisi" runat="server" Text="53"></asp:Label></span>
                        <span><i class="fa fa-video-camera"></i>
                            <asp:Label ID="LabelVideoSayisi" runat="server" Text="15"></asp:Label></span>
                    </div>
                    <div class="panel-body">
                        <div class="expandable expandable-indicator-white expandable-trigger">
                            <div class="expandable-content">

                                <p>
                                    <asp:Label ID="LabelKullaniciHakımda" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        İletişim
                    </div>
                    <ul class="icon-list icon-list-block">
                        <li><i class="fa fa-envelope fa-fw"></i>
                            <asp:HyperLink ID="HyperLinkMail" runat="server">Mail Adresi</asp:HyperLink>
                        </li>
                        <li><i class="fa fa-facebook fa-fw"></i>
                            <asp:HyperLink ID="HyperLinkFace" runat="server">Facebook</asp:HyperLink>
                        </li>
                        <li><i class="fa fa-behance fa-fw"></i>
                            <asp:HyperLink ID="HyperLinkTwitter" runat="server">Twitter</asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="media-body">
            <asp:Panel ID="panelMesaj" runat="server">
                <div class="panel panel-default share">


                    <div class="input-group">

                        <div class="input-group-btn">

                            <asp:LinkButton ID="LinkBtnMesajGonder" class="btn btn-primary" runat="server" OnClick="LinkBtnMesajGonder_Click">Gönder   <i class="fa fa-envelope"></i></asp:LinkButton>

                        </div>

                        <asp:TextBox ID="TextBoxMesajKutusu" type="text" class="form-control share-text" placeholder="Mesajınız..." runat="server"></asp:TextBox>

                    </div>
                </div>
            </asp:Panel>
           
            

            <div class="tabbable">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab"><i class="fa fa-fw fa-picture-o"></i>Fotoğraflar</a></li>
                    <li class=""><a href="#profile" data-toggle="tab"><i class="fa fa-fw fa-folder"></i>Albümler</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active in" id="home">
                        <img src="images/place1.jpg" alt="image" />
                        <img src="images/place2.jpg" alt="image" />
                        <img src="images/food1.jpg" alt="image" />
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <p>
                            Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo
                        booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente
                        labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed
                        echo park.
                        </p>
                    </div>
                    <div class="tab-pane fade" id="dropdown1">
                        <p>
                            Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles
                        etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred
                        you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.
                        </p>
                    </div>
                    <div class="tab-pane fade" id="dropdown2">
                        <p>
                            Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life
                        echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan,
                        sartorial keffiyeh echo park vegan.
                        </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-gray">

                            <asp:LinkButton ID="LinkButtonDuzenle" class="btn btn-primary btn-xs pull-right" runat="server" OnClick="LinkButtonDuzenle_Click">Düzenle <i class="fa fa-pencil"></i></asp:LinkButton>
                            <i class="fa fa-fw fa-info-circle"></i>Hakımda
                        </div>
                        <div class="panel-body">
                            <ul class="list-unstyled profile-about margin-none">
                                <li class="padding-v-5">
                                    <div class="row">
                                        <div class="col-sm-4"><span class="text-muted">Doğum Tarihi</span></div>
                                        <div class="col-sm-8">
                                            <asp:Label ID="LabelKullanıcıDogumTarihi" runat="server" Text="12 Ocak 1990"></asp:Label>
                                            <asp:TextBox ID="TextBoxDogumTarihi" Visible="false" CssClass=" form-control datepicker" runat="server" Height="30px"></asp:TextBox>
                                        </div>
                                    </div>
                                </li>
                                <li class="padding-v-5">
                                    <div class="row">
                                        <div class="col-sm-4"><span class="text-muted">İş</span></div>
                                        <div class="col-sm-8">
                                            <asp:Label ID="LabelKullaniciİs" runat="server" Text="Öğrenci"></asp:Label>
                                            <asp:TextBox ID="TextBoxis" Visible="false" type="text" class="form-control " runat="server" Height="30px"></asp:TextBox>
                                        </div>
                                    </div>
                                </li>
                                <li class="padding-v-5">
                                    <div class="row">
                                        <div class="col-sm-4"><span class="text-muted">Cinsiyet</span></div>
                                        <div class="col-sm-8">
                                            <asp:Label ID="LabelKullaniciCinsiyet" runat="server" Text="Erkek"></asp:Label>
                                            <asp:DropDownList Visible="false" ID="DropDownListCinsiyet" Height="30px" name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="false" data-size="6" Style="display: none" runat="server">

                                                <asp:ListItem>Erkek</asp:ListItem>
                                                <asp:ListItem>Kadın</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </li>
                                <li class="padding-v-5">
                                    <div class="row">
                                        <div class="col-sm-4"><span class="text-muted">Yaşadığı Yer</span></div>
                                        <div class="col-sm-8">
                                            <asp:Label ID="LabelKullaniciSehir" runat="server" Text="Isparta"></asp:Label>
                                            <asp:DropDownList Visible="false" ID="DropDownListIller" Height="30px" name="select" CssClass="selectpicker" data-style="btn-white" data-live-search="true" data-size="6" Style="display: none" runat="server">

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
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="panelArkList" runat="server">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-gray">
                            <div class="pull-right">

                                <%--<asp:LinkButton ID="LinkButtonArkEkle" class="btn btn-primary btn-xs" runat="server">Ekle <i class="fa fa-plus"></i></asp:LinkButton>--%>
                            </div>
                            <i class="icon-user-1"></i>Arkadaşlar
                        </div>
                        <div class="panel-body">
                            <ul class="img-grid">
                                <asp:Repeater  ID="rptrARK" runat="server">
                                    <ItemTemplate>
                                <li>
                                    <a href="profil.aspx?id=<%#kullaniciIDdondur(Eval("arkadasID").ToString()) %>">
                                        <asp:Image Width="80px" Height="80px" CssClass=" img-circle" ID="ImageArkadas" ImageUrl=' <%#ResimGosterici(Eval("arkadasID").ToString()) %>' runat="server" />
                                        
                                    </a>
                                </li>
                                        </ItemTemplate>
                                </asp:Repeater>
                                
                              
                            </ul>
                        </div>
                    </div>
                </div>
                    </asp:Panel>
            </div>
             <div class="row">   
                    <asp:Panel ID="PanelEgitim" Visible="false" runat="server">
           <div class="col-md-6" >
                <div class="timeline-block">
                  <div class="panel panel-default profile-card clearfix-xs">
                    <div class="panel-body">
                      <div class="profile-card-icon">
                        <i class="fa fa-graduation-cap"></i>
                      </div>
                      <h4 class="text-center">
                          <asp:Label ID="lblOkulAdi" runat="server" /></h4>
                       


                         <ul class="icon-list icon-list-block">
                        <li><i class="fa fa-map-marker"></i>
                            <asp:HyperLink Font-Size="10" ID="lblEgitimSehir" runat="server" />  </li>
                        <li><i class="fa fa-university"></i> <asp:HyperLink Font-Size="10"  ID="lblOkul" runat="server" />  </li>
                        <li><i class="fa fa-calendar"></i><asp:HyperLink Font-Size="10" ID="lblTarih" runat="server" />  </li>
                      </ul>


                     <%--   font-family: RobotoDraft, sans-serif;
font-size: 13px;
                      <ul class="icon-list icon-list-block">
                        <li><i class="fa fa-map-marker"></i>  <asp:Label ID="lblEgitimSehir" runat="server" /></li>
                        <li><i class="fa fa-trophy"></i> <asp:Label ID="lblOkul" runat="server" /></li>
                        <li><i class="fa fa-calendar"></i> <asp:Label ID="lblTarih" runat="server" /></li>
                      </ul>--%>
                    </div>
                  </div>
                </div>
              </div>
                        </asp:Panel>
                   <asp:Panel ID="PanelIs" Visible="false" runat="server">   
                                      <div class="col-md-6" >
                <div class="timeline-block">
                  <div class="panel panel-default profile-card clearfix-xs">
                    <div class="panel-body">
                      <div class="profile-card-icon">
                        <i class="fa fa-briefcase"></i>
                      </div>
                      <h4 class="text-center">
                          <asp:Label ID="lblSirketAd" runat="server" /></h4>
                      
                        <ul class="icon-list icon-list-block">
                       
                        <li ><i class="fa fa-map-marker"></i>
                            <asp:HyperLink Font-Size="10" ID="lblSirketSehir" runat="server" /></li>
                        <li><i class="fa fa-group"></i> <asp:HyperLink Font-Size="10" ID="lblPozisyon" runat="server" /></li>
                        <li><i class="fa fa-calendar"></i>   <asp:HyperLink Font-Size="10" ID="lblisGirisT" runat="server" /></li>
                      </ul>
                      <%--<ul class="icon-list icon-list-block">
                       
                        <li ><i class="fa fa-map-marker"></i><asp:Label ID="lblSirketSehir" runat="server" /></li>
                        <li><i class="fa fa-trophy"></i>   <asp:Label ID="lblPozisyon" runat="server" /></li>
                        <li><i class="fa fa-calendar"></i>   <asp:Label ID="lblisGirisT" runat="server" /></li>
                      </ul>--%>
                    </div>
                  </div>
                </div>
              </div>
                       </asp:Panel>
 
                </div>
        </div>


    </div>


    <!-- /st-content-inner -->







</asp:Content>

