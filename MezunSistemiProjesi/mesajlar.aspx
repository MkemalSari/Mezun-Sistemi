<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mesajlar.aspx.cs" Inherits="MezunSistemiProjesi.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content  ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOrtaBolge"  runat="server">
    <asp:Panel runat="server" DefaultButton="LinkBtnMesajGonder">

    </asp:Panel>
   
    <asp:UpdatePanel runat="server" UpdateMode="Always" RenderMode="Inline">
    <ContentTemplate>
         <div class="st-content">

        <!-- extra div for emulating position:fixed of the menu -->
        

          <div class="container-fluid">

            <div class="media messages-container media-clearfix-xs-min media-grid">
                <div style="min-height:523px">
              <div class="media-left">
                <div class="messages-list">
                  <div class="panel panel-default">
                    <ul class="list-group">
                        
                       <asp:Repeater ID="rptrMesajKisiler" runat="server">
                     <ItemTemplate>
                     <li class="list-group-item <%#AktifMesaj(Eval("mesajID").ToString()) %>">
                        <a href="mesajlar.aspx?id=<%#Eval("mesajID").ToString() %>">
                          <div class="media">
                            <div class="media-left">
                                <asp:Image ID="Image1" ImageUrl='<%#resimDoldur(Eval("kullaniciIDAlan").ToString()) %>' class="media-object"  width="50" Height="50" runat="server" />
                            </div>
                            <div class="media-body">
                              <span class="date"><%#Convert.ToInt32(DateTime.Now.Subtract(Convert.ToDateTime(Eval("mesajZaman"))).TotalMinutes) +" Dk Önce" %></span>
                              <span class="user"><%# MesajGosterici(Eval("mesajID").ToString())  %></span>
                              <div class="message"><%#Eval("mesajIcerik") %></div>
                            </div>
                          </div>
                        </a>
                      </li>

                   
                 </ItemTemplate>
             </asp:Repeater>
                      
                    </ul>
                  </div>
                </div>
              </div>
                 
  
              
              <div class="media-body">
                <div class="panel panel-default share">
                   <div class="input-group">
                      
                    <div class="input-group-btn">
                     
                        <asp:LinkButton ID="LinkBtnMesajGonder" class="btn btn-primary" runat="server" OnClick="LinkBtnMesajGonder_Click">Gönder   <i class="fa fa-envelope"></i></asp:LinkButton>
                          
                    </div>
                      
                    <asp:TextBox ID="TextBoxMesajKutusu" type="text" class="form-control share-text" placeholder="Mesajınız..." runat="server"></asp:TextBox>

                  </div>
                </div>
                   <asp:Repeater ID="rptrMesajListele" runat="server">
                      <ItemTemplate>
               <asp:Panel Visible='<%# idBenimMi(Eval("KullaniciIDGonderen").ToString())%>' runat="server">
                  <div class="media-body message">
                    <div class="panel panel-default">
                      <div class="panel-heading panel-heading-white">
                        <div class="pull-right">
                          <small class="text-muted">10 min ago</small>
                        </div>
                        <a href="profil.aspx">Ben</a>
                      </div>
                      <div class="panel-body">
                       <%#Eval("mesajIcerik") %>
                      </div>
                    </div>
                  </div>
                  <div class="media-right">
                    <img src="images/people/110/guy-5.jpg" width="60" alt="" class="media-object" />
                  </div>
                <br />
                          </asp:Panel>
                    
               
                    <asp:Panel Visible='<%# !idBenimMi(Eval("KullaniciIDGonderen").ToString())%>' runat="server">
                     <div class="media">
                  <div class="media-left">
                    <a href="#">
                      <img src="images/people/110/woman-5.jpg" width="60" alt="woman" class="media-object" />
                    </a>
                  </div>
                      <div class="media-body message">
                        <div class="panel panel-default">
                          <div class="panel-heading panel-heading-white">
                            <div class="pull-right">
                              <small class="text-muted">2 min ago</small>
                            </div>
                            <a href="#"><%#MesajGosterici(Eval("mesajID").ToString())%></a>
                          </div>
                          <div class="panel-body">
                            
                            <%#Eval("mesajIcerik") %>

                          </div>
                        
                      </div>
                    </div>
                         <br />
                         </asp:Panel>


                
                    
                  </ItemTemplate>
                 </asp:Repeater>
               
              </div>
                    </div>
                </div>
            </div>
 
          </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <!-- /st-content-inner -->

   
        
          
</asp:Content>
