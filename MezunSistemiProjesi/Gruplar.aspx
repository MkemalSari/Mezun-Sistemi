<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gruplar.aspx.cs" Inherits="MezunSistemiProjesi.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOrtaBolge" runat="server">


    <div class="container-fluid" style="height:550px">

    <%--    <div id="filter">
            <form class="form-inline">
                <label>Filter:</label>
                <select name="users-filter" id="users-filter-select" class="selectpicker" data-style="btn-primary" data-width="auto" style="display: none;">
                    <option value="all">All</option>
                    <option value="friends">Friends of Friends</option>
                    <option value="name">by Name</option>
                </select>
               
                <div id="users-filter-trigger">
                    <div class="select-friends hidden">
                        <select name="users-filter-friends" class="selectpicker" data-style="btn-primary" data-live-search="true" style="display: none;">
                            <option value="0">Select Friend</option>
                            <option value="1">Mary D.</option>
                            <option value="2">Michelle S.</option>
                            <option value="3">Adrian Demian</option>
                        </select><div class="btn-group bootstrap-select" style="width: 100%;">
                            <button type="button" class="btn dropdown-toggle btn-primary" data-toggle="dropdown" title="Select Friend"><span class="filter-option pull-left">Select Friend</span>&nbsp;<span class="caret"></span></button><div class="dropdown-menu open">
                                <div class="bs-searchbox">
                                    <input type="text" class="form-control" autocomplete="off"></div>
                                <ul class="dropdown-menu inner" role="menu">
                                    <li data-original-index="0" class="selected"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Select Friend</span>" data-tokens="null"><span class="text">Select Friend</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
                                    <li data-original-index="1"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Mary D.</span>" data-tokens="null"><span class="text">Mary D.</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
                                    <li data-original-index="2"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Michelle S.</span>" data-tokens="null"><span class="text">Michelle S.</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
                                    <li data-original-index="3"><a tabindex="0" class="" data-normalized-text="<span class=&quot;text&quot;>Adrian Demian</span>" data-tokens="null"><span class="text">Adrian Demian</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="search-name hidden">
                        <input type="text" class="form-control" name="user-first" placeholder="First Last Name" id="name">
                        <a href="#" class="btn btn-default hidden" id="user-search-name"><i class="fa fa-search"></i>Search</a>
                    </div>

                </div>
            </form>
        </div>--%>

        <div class="row" data-toggle="isotope" style="position: relative; height: 1016px;">
         <%--   <asp:Repeater runat="server">
                <ItemTemplate>  --%>
            <asp:Panel ID="panelOkulGruplari" Visible="false" runat="server">
            <%--ÜNİ--%>
            <div class="col-md-6 col-lg-4 item" style="position: absolute; left: 0px; top: 0px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="media">
                            <div class="pull-left">
                             
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading margin-v-5"><a href="#">
                                    <asp:HyperLink  ID="lblUniAdi" runat="server" />
                                    </a></h4>
                                <div class="profile-icons">
                             <%--       <span><i class="fa fa-users"></i>372</span>
                                    <span><i class="fa fa-photo"></i>43</span>
                                    <span><i class="fa fa-video-camera"></i>3</span>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <p class="common-friends">Üniversite Öğrencileri</p>
                        <div class="user-friend-list">
                           
                           <%-- RPTR--%>
                            <asp:Repeater ID="rptrUniGrp" runat="server">
                                <ItemTemplate>
                               <a href="Profil.aspx?id=<%#Eval("kullaniciID")%>">
                                <asp:Image ID="ImageBolumListeResim" ImageUrl='<%#resimDoldur(Eval("kullaniciID").ToString())%>' class="img-circle" Width="40" Height="40" runat="server" /></a>
                                    
                                    </ItemTemplate>
                            </asp:Repeater>
                            
                        &nbsp;&nbsp;</div>
                    </div>
                    <div class="panel-footer">
                        <%--<a href="#" class="btn btn-default btn-sm">Follow <i class="fa fa-share"></i></a>--%>
                    </div>
                </div>
            </div>
          <%--  OKUL--%>
              <div class="col-md-6 col-lg-4 item" style="position: absolute; left: 0px; top: 0px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="media">
                            <div class="pull-left">
                             
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading margin-v-5"><a href="#">
                                    <asp:HyperLink ID="lblOkulAdi" runat="server" />
                                   </a></h4>
                                <div class="profile-icons">
                             <%--       <span><i class="fa fa-users"></i>372</span>
                                    <span><i class="fa fa-photo"></i>43</span>
                                    <span><i class="fa fa-video-camera"></i>3</span>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <p class="common-friends">Fakulte Öğrencileri</p>
                        <div class="user-friend-list">
                           
                           <%-- RPTR--%>
                            <asp:Repeater ID="rptrOkulGrp" runat="server">
                                <ItemTemplate>
                               <a href="Profil.aspx?id=<%#Eval("kullaniciID")%>">
                                <asp:Image ID="ImageBolumListeResim" ImageUrl='<%#resimDoldur(Eval("kullaniciID").ToString())%>' class="img-circle" Width="40" Height="40" runat="server" /></a>
                                    
                                    </ItemTemplate>
                            </asp:Repeater>
                            
                        &nbsp;&nbsp;</div>
                    </div>
                    <div class="panel-footer">
                        <%--<a href="#" class="btn btn-default btn-sm">Follow <i class="fa fa-share"></i></a>--%>
                    </div>
                </div>
            </div>
            <%--BOLUM--%>
             <div class="col-md-6 col-lg-4 item" style="position: absolute; left: 0px; top: 0px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="media">
                            <div class="pull-left">
                             
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading margin-v-5"><a href="#">
                                    <asp:HyperLink ID="lblBolumAdi" runat="server" /></a></h4>
                                <div class="profile-icons">
                             <%--       <span><i class="fa fa-users"></i>372</span>
                                    <span><i class="fa fa-photo"></i>43</span>
                                    <span><i class="fa fa-video-camera"></i>3</span>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <p class="common-friends">Bölüm Öğrencileri</p>
                        <div class="user-friend-list">
                           
                           <%-- RPTR--%>
                            <asp:Repeater ID="rptrBolumGrp" runat="server">
                                <ItemTemplate>
                           <a href="Profil.aspx?id=<%#Eval("kullaniciID")%>">
                                <asp:Image ID="ImageBolumListeResim" ImageUrl='<%#resimDoldur(Eval("kullaniciID").ToString())%>' class="img-circle" Width="40" Height="40" runat="server" /></a>
                                    </ItemTemplate>
                            </asp:Repeater>
                            
                        &nbsp;&nbsp;</div>
                    </div>
                    <div class="panel-footer">
                        <%--<a href="#" class="btn btn-default btn-sm">Follow <i class="fa fa-share"></i></a>--%>
                    </div>
                </div>
            </div>
            <%--    </ItemTemplate>
            </asp:Repeater>--%>
            </asp:Panel>
            
        </div>

    </div>

</asp:Content>
