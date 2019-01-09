<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Grup.aspx.cs" Inherits="MezunSistemiProjesi.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOrtaBolge" runat="server">




    <!-- extra div for emulating position:fixed of the menu -->




    <div class="cover overlay cover-menu cover-image-full height-300-lg">

        <ul class="cover-nav">
            <li class="active"><a href="#"><i class="fa fa-clock-o"></i><span>Zaman Tüneli</span></a></li>
            <li><a href="#"><i class="fa fa-user"></i><span>Hakında</span></a></li>
            <li><a href="#"><i class="fa fa-camera"></i><span>Fotoğraflar</span> <small>(102)</small></a></li>
            <li><a href="#"><i class="fa fa-group"></i><span>Arkadaşlar </span><small>(19)</small></a></li>
            <li><a href="#"><i class="fa fa-envelope"></i><span>Mesajlar</span> <small>(2)</small></a></li>
        </ul>

        <img src="image/gbg1.jpg" alt="cover" style="align-items: stretch">
        <div class="overlay overlay-full">
            <div class="v-left">
                <a href="http://w3.sdu.edu.tr/" class="btn btn-cover padding-top-none" style="padding-bottom: 15px">
                    <h3>
                        <asp:Label ID="LabelUniBaslik" runat="server" Text="Süleyman Demirel Üniversitesi"></asp:Label>
                    </h3>
                </a>
                <br />
                <br />
                <asp:Panel ID="panelOkulBaslik" Visible="false" runat="server">
                    <a href="http://w3.sdu.edu.tr/" class="btn btn-cover padding-top-none " style="padding-bottom: 10px">
                        <h4>
                            <asp:Label ID="LabelOkulBaslik" runat="server" Text="Süleyman Demirel Üniversitesi"></asp:Label>
                        </h4>
                    </a>
                </asp:Panel>

                <br />
                <asp:Panel ID="panelBolumBaslik" Visible="false" runat="server">
                    <a href="http://w3.sdu.edu.tr/" class="btn btn-cover  padding-top-none" style="padding-bottom: 7px">
                        <h5>
                            <asp:Label ID="LabelBolumBaslik" runat="server" Text="Süleyman Demirel Üniversitesi"></asp:Label>
                        </h5>
                    </a>
                </asp:Panel>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-9">
            <ul class="timeline-list">
                <li class="media media-clearfix-xs">
                    <div class="media-left">
                        <div class="user-wrapper">

                            <asp:Image ID="ImageAnaKullanici" ImageUrl="" alt="people" class="img-circle" Width="80" Height="80" runat="server" />
                            <div>
                                <asp:HyperLink ID="HyperLinkAnaKulaniciAd" runat="server">HyperLink</asp:HyperLink>
                            </div>
                            <div class="date">
                                <asp:Label ID="LabelMesajTarih" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="media-body">
                        <div class="media-body-wrapper">
                            <div class="row">
                                <div class="col-md-10 col-lg-8">
                                    <div class="panel panel-default share clearfix-xs">
                                        <div class="panel-heading panel-heading-gray title">
                                            Ne düşünüyorusun?
                                        </div>
                                        <div class="panel-body">
                                            <asp:TextBox Style="height: 100px" ID="TextBoxKullaniciYorum" type="text" class="form-control share-text " TextMode="multiline" Rows="3" placeholder="Durum Paylaşın..." runat="server" Columns="2"></asp:TextBox>

                                        </div>
                                        <div class="panel-footer share-buttons">
                                            <%--<a href="#"><i class="fa fa-map-marker"></i></a>
                                <a href="#"><i class="fa fa-photo"></i></a>
                                <a href="#"><i class="fa fa-video-camera"></i></a>--%>
                                            <asp:Button ID="ButtonPaylasim" class="btn btn-primary  pull-right " runat="server" Text="Gönder" OnClick="ButtonPaylasim_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </li>




                <asp:HiddenField runat="server" ID="hfYorum" />
                <asp:Repeater ID="rptrPaylasim" OnItemCommand="rptrPaylasim_ItemCommand" runat="server">
                    <ItemTemplate>
                        <li class="media media-clearfix-xs">
                            <div class="media-left">
                                <div class="user-wrapper">

                                    <asp:Image ID="ImageAnaKul" ImageUrl='<%#resimDoldur(Eval("KullaniciID").ToString())%>' class="img-circle" Height="80" Width="80" runat="server" />
                                    <div>
                                        <asp:HyperLink ID="HyperLinkAnaKulaniciAd" NavigateUrl='<%#"~/Profil.aspx?id="+Eval("KullaniciID").ToString()%>' runat="server"><%#isimDondur(Eval("KullaniciID").ToString())%></asp:HyperLink>

                                    </div>
                                    <div class="date">
                                        <asp:Label ID="LabelDrumGonderenTarih" runat="server" Text='<%#tarihDoldur(Eval("paylasimID").ToString())%>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body ">
                                <div class="media-body-wrapper">
                                    <div class="panel panel-default">

                                        <div class="panel-body">
                                            <p class="v-cell" style="width: 650px">
                                                <asp:Label ID="LabelDrumPaylasanMetin" runat="server" Text='<%#Eval("icerik").ToString() %>'></asp:Label>
                                            </p>
                                        </div>
                                        <div class="view-all-comments">
                                            <a href="#">
                                                <i class="fa fa-comments-o"></i>View all
                                            </a>
                                            <span>10 comments</span>
                                        </div>
                                        <ul class="comments">
                                            <asp:Repeater ID="rptrYorum" DataSource='<%#yorumDondurucu(Eval("paylasimID").ToString())%>' OnItemCommand="rptrYorum_ItemCommand" runat="server">
                                                <ItemTemplate>
                                                    <li class="media">
                                                        <div class="media-left">
                                                          
                                                                <asp:Image ID="Image2" ImageUrl='<%#resimDoldur(Eval("KullaniciID").ToString())%>' Width="50px" Height="50px" class="media-object" runat="server" />

                                                            </a>
                                                        </div>
                                                        <div class="media-body">
                                                            <div class="pull-right dropdown" data-show-hover="li" style="display: none;">
                                                                <a href="#" data-toggle="dropdown" class="toggle-button">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <li><a href="#">Edit</a></li>
                                                                    <li><a href="#">Delete</a></li>
                                                                </ul>
                                                            </div>
                                                            <a href="#" class="comment-author pull-left">
                                                                 
                                                                <asp:Label ID="LabelYorumYapanisim" runat="server" Text='<%#isimDondur(Eval("KullaniciID").ToString())%>'></asp:Label></a>
                                                            <span>
                                                                <asp:Label ID="LabelYorum" CssClass="text-left" runat="server" Text='<%#Eval("icerik")%>'></asp:Label></span>
                                                            <div class="comment-date">
                                                                <asp:Label ID="LabelYorumTarihi" runat="server" Text="5 Ocak"></asp:Label>
                                                            </div>
                                                        </div>

                                                    </li>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                        <%--     <div class="input-group">
                              <input type="text" class="form-control">
                              <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">Yorum Yap</button>
                                    </span>
                            </div>
                                        --%>
                                       <%-- <div class="panel-footer share-buttons">
                                            <div>
                                                <div class="col-md-10">
                                                    <input type="text" id="TextBoxKullaniYorum" class="form-control" name='<%#"txtYorum"+Eval("paylasimID").ToString() %>' />
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:LinkButton ID="LinkButton1" CommandName="linkbtn" CommandArgument='<%#Eval("paylasimID").ToString() %>' runat="server">Yorum</asp:LinkButton>
                                                </div>
                                            </div>


                                        </div>--%>
                                        <div class="form-group">
                       
                      <asp:Panel ID="PanelYorum" runat="server" DefaultButton="linkbtnYorum" >
                            <div class="input-group">
                               <input type="text" id="TextBoxKullaniYorum" class="form-control" name='<%#"txtYorum"+Eval("paylasimID").ToString() %>' />
                              <span class="input-group-btn">
                                  <asp:LinkButton ID="linkbtnYorum" class="btn btn-primary" CommandName="linkbtn" CommandArgument='<%#Eval("paylasimID").ToString() %>' runat="server">Yorum Yap</asp:LinkButton>
                                       
                                    </span>
                            </div>
                          </asp:Panel>
                            <!-- /input-group -->
                          
                        </div>

                                    </div>
                                </div>
                            </div>
                        </li>

                    </ItemTemplate>
                </asp:Repeater>

            </ul>
        </div>
        <div class="col-md-3 table-responsive panel panel-heading-gray clearfix" style="background-color: white; margin-top: 20px; width: 250px; margin-left: 17px">
            <table class="table v-cell">
                <thead>
                    <tr>
                        <th>Grup Üyelerimiz</th>


                    </tr>
                </thead>
                <asp:Repeater ID="rptrUyeList" runat="server">
                    <ItemTemplate>
                        <tr>

                            <td><a href="Profil.aspx?id=<%#Eval("kullaniciID")%>">
                                <asp:Image ID="ImageListeResim" ImageUrl='<%#resimDoldur(Eval("kullaniciID").ToString())%>' class="img-circle" Width="40" Height="40" runat="server" /></a>
                                <asp:Label ID="LabelListeisim" runat="server" Text='<%#isimDondur(Eval("kullaniciID").ToString())%>'></asp:Label>

                            </td>


                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

        </div>
    </div>




    <!-- /st-content-inner -->



</asp:Content>
