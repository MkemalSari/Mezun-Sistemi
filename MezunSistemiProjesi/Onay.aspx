<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Onay.aspx.cs" Inherits="MezunSistemiProjesi.Onay" %>

<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en" >


<!-- Mirrored from themekit.aws.ipv4.ro/dist/themes/social-1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Dec 2015 18:33:43 GMT -->
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>ThemeKit</title>

  
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
         <td>   
             
    <div class="panel panel-default text-center" style="width:400px;height:250px; margin-left:500px;margin-top:150px"  >
        <div class=" panel-body">
             <h3 style= "color:#3eaea8 ">E-posta Adresinize Gönderilen Onay Kodunu Giriniz.
               
            </h3>
            <br />
          
         <asp:TextBox ID="txtOnay" class="form-control" type="text" placeholder="Onay Kodu" runat="server"></asp:TextBox>
            
            <asp:Label ID="LabelOnay" runat="server" Text="Hatalı Kod !" Visible="false" ForeColor="#FF6666"></asp:Label>
            <br />
            <br />
             <asp:LinkButton ID="LinkButtonOnay" CssClass="btn btn-primary" runat="server" OnClick="LinkButton2_Click">Kodu Onayla<i class="fa fa-fw  fa-child"></i></asp:LinkButton>
        </div></div></td>
         
         
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