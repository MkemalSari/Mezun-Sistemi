<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Login.aspx.cs" Inherits="MezunSistemiProjesi.Login" %>

<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en" >


<!-- Mirrored from themekit.aws.ipv4.ro/dist/themes/social-1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Dec 2015 18:33:43 GMT -->
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Code Tech</title>

  
  <link href="css/vendor/all.css" rel="stylesheet">

 
  <link href="css/app/app.css" rel="stylesheet">

 
  <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body class="login">
    <form id="form1" runat="server">
    <table runat="server">
        <tr>
         <td style="padding-top:100px; padding-left:300px;">   
    <div class="panel panel-default text-center" style="width:300px;height:435px;" >
            <h1 style= "color:#3eaea8 ">Üye Ol
               
            </h1>
          
          <div class="panel-body">
               <asp:TextBox ID="kayitAd" CssClass="form-control" type="text" placeholder="İsim" runat="server" MaxLength="50" ></asp:TextBox>
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kayitAd" ErrorMessage="İsim Alanı Boş Geçilemez  !" Display="Dynamic" ForeColor="#FF6666" ValidationGroup="uyeolkontrol"></asp:RequiredFieldValidator>
            
              <br />
              <asp:TextBox ID="kayitSoyad" class="form-control" type="text" placeholder="Soyisim" runat="server" MaxLength="50"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kayitSoyad" ErrorMessage="Soyisim Alanı Boş Geçilemez  !" Display="Dynamic" ForeColor="#FF6666" ValidationGroup="uyeolkontrol"></asp:RequiredFieldValidator>
              <br />
             <asp:TextBox ID="kayitEmail" class="form-control" type="text" placeholder="E-posta" runat="server" MaxLength="50"></asp:TextBox>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="kayitEmail" Display="Dynamic" ErrorMessage="Uyuşmayan E-posta Adresi  !" ForeColor="#FF6666" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="uyeolkontrol"></asp:RegularExpressionValidator>
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="kayitEmail" ErrorMessage="E-posta Alanı Boş Geçilemez  !" Display="Dynamic" ForeColor="#FF6666" ValidationGroup="uyeolkontrol"></asp:RequiredFieldValidator>
            
              <br />
            <asp:TextBox ID="kayitPassword1" class="form-control" type="password" placeholder="Şifre" runat="server" MaxLength="50"></asp:TextBox>
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="kayitPassword1" ErrorMessage="Şifre Alanı Boş Geçilemez  !" Display="Dynamic" ForeColor="#FF6666" ValidationGroup="uyeolkontrol"></asp:RequiredFieldValidator>
            
              <br />
           <asp:TextBox ID="kayitPassword2" class="form-control" type="password" placeholder="Şifre Tekrar" runat="server" MaxLength="50"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="kayitPassword2" ErrorMessage="Şifre Alanı Boş Geçilemez  !" Display="Dynamic" ForeColor="#FF6666" ValidationGroup="uyeolkontrol"></asp:RequiredFieldValidator>
               <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="kayitPassword1" ControlToValidate="kayitPassword2" Display="Dynamic" ErrorMessage="Şifreler Uyuşmuyor  !" ForeColor="#FF6666"></asp:CompareValidator>
              <br />
                <asp:CheckBox ID="CheckBoxSozlesme" Text="" runat="server" />
            &nbsp;<a href="#" class="forgot-password">Kullanım Sözleşmesini
&nbsp;Kabul Ediyorum.</a>
              <asp:Label ID="LabelSozlesmeKontrol" runat="server" ForeColor="#FF6666"></asp:Label>
               <br> 
            
            
                   
              <asp:LinkButton ID="LinkButton2" CssClass="btn btn-primary" ValidationGroup="uyeolkontrol" runat="server" OnClick="LinkButton2_Click">Üye Ol <i class="fa fa-fw  fa-child"></i></asp:LinkButton>
           
               
          </div>
        </div>
             

         </td>
            <td style="padding-top:100px;padding-left:150px;height:435px;">
     <div class="panel panel-default text-center" style="width:300px; height: 427px;" >
            <h1 style= "color:#3eaea8 ">Üye Girişi</h1>
         <br />
         <br />
          <img src="images/people/110/guy-5.jpg" class="img-circle">
         <br />
         <br />
         <asp:Panel runat="server" ID="PanelLogin" DefaultButton="LinkButton1">
          <div class="panel-body">
            <asp:TextBox ID="girisEmail" class="form-control" type="text" placeholder="E-posta" runat="server" MaxLength="50"></asp:TextBox>
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="girisEmail" ErrorMessage="E-posta Alanı Boş Geçilemez  !" ForeColor="#FF6666" ValidationGroup="giriskontrol"></asp:RequiredFieldValidator>
            
              <br />
            <asp:TextBox ID="girisPassword" class="form-control" type="password" placeholder="Şifre" runat="server" MaxLength="50"></asp:TextBox>
            
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="girisPassword" ErrorMessage="Şifre Alanı Boş Geçilemez  !" ForeColor="#FF6666" ValidationGroup="giriskontrol"></asp:RequiredFieldValidator>
            
              <asp:Label ID="LabelGirisHataMesaji" runat="server" ForeColor="#FF0066" Text="Hatalı ! E-Posta Veya Şifre " Visible="False"></asp:Label>
              <br /> 
              <br /> 
               <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" ValidationGroup="giriskontrol" OnClick="LinkButton3_Click">Giriş <i class="fa fa-fw fa-unlock-alt"></i></asp:LinkButton>
               
            
              	&nbsp;	&nbsp;
            <a href="SifremiUnuttum.aspx" class="forgot-password">Şifremi unuttum</a>
          </div>
             </asp:Panel>
        </div>

            </td>
        </tr>
</table>
  <!-- Footer -->
  <footer class="footer">
              

    <strong>CodeTe
      ch</strong> v1.0.0 Beta &copy; Copyright 2016
  </footer>
  <!-- // Footer -->
  <!-- Inline Script for colors and config objects; used by various external scripts; -->
  <script>
      var colors = {
          "danger-color": "#e74c3c",
          "success-color": "#81b53e",
          "warning-color": "#f0ad4e",
          "inverse-color": "#2c3e50",
          "info-color": "#2d7cb5",
          "default-color": "#6e7882",
          "default-light-color": "#cfd9db",
          "purple-color": "#9D8AC7",
          "mustard-color": "#d4d171",
          "lightred-color": "#e15258",
          "body-bg": "#f6f6f6"
      };
      var config = {
          theme: "social-1",
          skins: {
              "default": {
                  "primary-color": "#16ae9f"
              },
              "orange": {
                  "primary-color": "#e74c3c"
              },
              "blue": {
                  "primary-color": "#4687ce"
              },
              "purple": {
                  "primary-color": "#af86b9"
              },
              "brown": {
                  "primary-color": "#c3a961"
              }
          }
      };
  </script>

 
  <script src="js/vendor/all.js"></script>

  
  <script src="js/app/app.js"></script>

  
    </form>

  
</body>


<!-- Mirrored from themekit.aws.ipv4.ro/dist/themes/social-1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Dec 2015 18:33:43 GMT -->
</html>
