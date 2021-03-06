﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KayitAdim2.aspx.cs" Inherits="MezunSistemiProjesi.KayitAdim2" %>

<!DOCTYPE html>
<html class="hide-sidebar ls-bottom-footer" lang="en">


<!-- Mirrored from themekit.aws.ipv4.ro/dist/themes/social-1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Dec 2015 18:33:43 GMT -->
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>ThemeKit</title>

  <!-- Vendor CSS BUNDLE
    Includes styling for all of the 3rd party libraries used with this module, such as Bootstrap, Font Awesome and others.
    TIP: Using bundles will improve performance by reducing the number of network requests the client needs to make when loading the page. -->
  <link href="css/vendor/all.css" rel="stylesheet">

  <!-- Vendor CSS Standalone Libraries
        NOTE: Some of these may have been customized (for example, Bootstrap).
        See: src/less/themes/{theme_name}/vendor/ directory -->
  <!-- <link href="css/vendor/bootstrap.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/font-awesome.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/picto.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/material-design-iconic-font.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/datepicker3.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/jquery.minicolors.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/bootstrap-slider.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/jquery-jvectormap.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/owl.carousel.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/slick.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/morris.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/ui.fancytree.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/daterangepicker-bs3.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/jquery.bootstrap-touchspin.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/select2.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/bootstrap-select2.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/bootstrap-select.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/bootstrap-checkbox.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/bootstrap-switch.css" rel="stylesheet"> -->
  <!-- <link href="css/vendor/summernote.css" rel="stylesheet"> -->

  <!-- APP CSS BUNDLE [css/app/app.css]
INCLUDES:
    - The APP CSS CORE styling required by the "social-1" module, also available with main.css - see below;
    - The APP CSS STANDALONE modules required by the "social-1" module;
NOTE:
    - This bundle may NOT include ALL of the available APP CSS STANDALONE modules;
      It was optimised to load only what is actually used by the "social-1" module;
      Other APP CSS STANDALONE modules may be available in addition to what's included with this bundle.
      See src/less/themes/social-1/app.less
TIP:
    - Using bundles will improve performance by greatly reducing the number of network requests the client needs to make when loading the page. -->
  <link href="css/app/app.css" rel="stylesheet">

  <!-- App CSS CORE
    This variant is to be used when loading the separate styling modules -->
  <!-- <link href="css/app/main.css" rel="stylesheet"> -->

  <!-- App CSS Standalone Modules
    As a convenience, we provide the entire UI framework broke down in separate modules
    Some of the standalone modules may have not been used with the current theme/module
    but ALL modules are 100% compatible -->

  <!-- <link href="css/app/essential-all.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-core.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-cover.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-expandable.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-forms.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-nestable.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-tables.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-tree.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/essential-rtl.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/material.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/layout.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/sidebar.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/sidebar-skins.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/navbar.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/media.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/player.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/timeline.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/cover.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/chat.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/charts.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/maps.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-alerts.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-background.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-buttons.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-calendar.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-progress-bars.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/colors-text.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/ui.css" rel="stylesheet" /> -->
  <!-- <link href="css/app/animated-weather-icons.css" rel="stylesheet" /> -->

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!-- If you don't need support for Internet Explorer <= 8 you can safely remove these -->
  <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

</head >
    
<body class="login">
    <form runat="server">
        <div style="width:500px; height: 450px; margin-left:30%;margin-right:40%;margin-top:20%">   
        <div class="panel panel-default text-center" >
            <h3 style="color:#3eaea8 ">Lütfen Bilgilerinizi Adımları Takip Ederek Giriniz.</h3>
      
             <h1 style="color:#3eaea8 ">2.Adım</h1>
       
          <div class="panel-body"> <div class="progress">
                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:20%">
                          
                           </div>
              </div>
                       
              <div class="row">
                 
                     

              <div class="col-md-4">
                   <h4 style="color:#3eaea8 ">Mesleğiniz:</h4>
              </div>
               <div class="col-md-8">
                    <asp:TextBox ID="TextBoxIsbilgisi" CssClass=" form-control" runat="server"></asp:TextBox>
               </div>
              </div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxIsbilgisi" Display="Dynamic" ErrorMessage="Doldurulmadan İlerlenemez Geç Diyerek Daha Sonra Doldurabilirisiniz." ForeColor="#FF0066" ValidationGroup="ileri"></asp:RequiredFieldValidator>
              <br />
          <div class="row">
              <div class="col-md-3">
                  <asp:LinkButton ID="LinkButtonGec" class="btn btn-danger" runat="server" OnClick="LinkButtonGec_Click1">Geç <i class="fa fa-fw fa-times-circle"></i></asp:LinkButton>
                  
              </div>
              <div class="col-md-6"> 
                  
              </div>
               <div class="col-md-3">
                   <asp:LinkButton ID="LinkButtonİleri"  class="btn btn-primary" runat="server" OnClick="LinkButtonİleri_Click" ValidationGroup="ileri" >İleri <i class="fa fa-fw fa-arrow-circle-right"></i> </asp:LinkButton>

               </div>
             
               </div>
            
          
          </div>
        </div>

</div>

  

















<!----------------------------------------------------->
  <!-- Footer -->
  <footer class="footer">
    <strong>ThemeKit</strong> v4.0.0 &copy; Copyright 2015
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

  <!-- Vendor Scripts Bundle
    Includes all of the 3rd party JavaScript libraries above.
    The bundle was generated using modern frontend development tools that are provided with the package
    To learn more about the development process, please refer to the documentation.
    Do not use it simultaneously with the separate bundles above. -->
  <script src="js/vendor/all.js"></script>

  <!-- Vendor Scripts Standalone Libraries -->
  <!-- <script src="js/vendor/core/all.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.js"></script> -->
  <!-- <script src="js/vendor/core/bootstrap.js"></script> -->
  <!-- <script src="js/vendor/core/breakpoints.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.nicescroll.js"></script> -->
  <!-- <script src="js/vendor/core/isotope.pkgd.js"></script> -->
  <!-- <script src="js/vendor/core/packery-mode.pkgd.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.grid-a-licious.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.cookie.js"></script> -->
  <!-- <script src="js/vendor/core/jquery-ui.custom.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.hotkeys.js"></script> -->
  <!-- <script src="js/vendor/core/handlebars.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.hotkeys.js"></script> -->
  <!-- <script src="js/vendor/core/load_image.js"></script> -->
  <!-- <script src="js/vendor/core/jquery.debouncedresize.js"></script> -->
  <!-- <script src="js/vendor/core/modernizr.js"></script> -->
  <!-- <script src="js/vendor/core/velocity.js"></script> -->
  <!-- <script src="js/vendor/tables/all.js"></script> -->
  <!-- <script src="js/vendor/tables/jquery.dataTables.js"></script> -->
  <!-- <script src="js/vendor/tables/dataTables.bootstrap.js"></script> -->
  <!-- <script src="js/vendor/forms/all.js"></script> -->
  <!-- <script src="js/vendor/forms/bootstrap-slider.js"></script> -->
  <!-- <script src="js/vendor/forms/bootstrap-select.js"></script> -->
  <!-- <script src="js/vendor/forms/bootstrap-switch.js"></script> -->
  <!-- <script src="js/vendor/forms/bootstrap-datepicker.js"></script> -->
  <!-- <script src="js/vendor/forms/moment.js"></script> -->
  <!-- <script src="js/vendor/forms/daterangepicker.js"></script> -->
  <!-- <script src="js/vendor/forms/jquery.minicolors.js"></script> -->
  <!-- <script src="js/vendor/forms/jquery.bootstrap-touchspin.js"></script> -->
  <!-- <script src="js/vendor/forms/select2.js"></script> -->
  <!-- <script src="js/vendor/forms/summernote.js"></script> -->
  <!-- <script src="js/vendor/media/all.js"></script> -->
  <!-- <script src="js/vendor/player/all.js"></script> -->
  <!-- <script src="js/vendor/charts/all.js"></script> -->
  <!-- <script src="js/vendor/charts/flot/all.js"></script> -->
  <!-- <script src="js/vendor/charts/easy-pie/jquery.easypiechart.js"></script> -->
  <!-- <script src="js/vendor/charts/morris/all.js"></script> -->
  <!-- <script src="js/vendor/charts/sparkline/all.js"></script> -->
  <!-- <script src="js/vendor/maps/vector/all.js"></script> -->
  <!-- <script src="js/vendor/tree/jquery.fancytree-all.js"></script> -->
  <!-- <script src="js/vendor/nestable/jquery.nestable.js"></script> -->
  <!-- <script src="js/vendor/angular/all.js"></script> -->

  <!-- App Scripts Bundle
    Includes Custom Application JavaScript used for the current theme/module;
    Do not use it simultaneously with the standalone modules below. -->
  <script src="js/app/app.js"></script>

  <!-- App Scripts Standalone Modules
    As a convenience, we provide the entire UI framework broke down in separate modules
    Some of the standalone modules may have not been used with the current theme/module
    but ALL the modules are 100% compatible -->

  <!-- <script src="js/app/essential-all.js"></script> -->
  <!-- <script src="js/app/essential-core.js"></script> -->
  <!-- <script src="js/app/essential-cover.js"></script> -->
  <!-- <script src="js/app/essential-expandable.js"></script> -->
  <!-- <script src="js/app/essential-forms.js"></script> -->
  <!-- <script src="js/app/essential-nestable.js"></script> -->
  <!-- <script src="js/app/essential-tables.js"></script> -->
  <!-- <script src="js/app/essential-tree.js"></script> -->
  <!-- <script src="js/app/material.js"></script> -->
  <!-- <script src="js/app/layout.js"></script> -->
  <!-- <script src="js/app/sidebar.js"></script> -->
  <!-- <script src="js/app/media.js"></script> -->
  <!-- <script src="js/app/player.js"></script> -->
  <!-- <script src="js/app/timeline.js"></script> -->
  <!-- <script src="js/app/chat.js"></script> -->
  <!-- <script src="js/app/maps/vector.js"></script> -->
  <!-- <script src="js/app/maps/google.js"></script> -->
  <!-- <script src="js/app/charts/all.js"></script> -->
  <!-- <script src="js/app/charts/flot.js"></script> -->
  <!-- <script src="js/app/charts/easy-pie.js"></script> -->
  <!-- <script src="js/app/charts/morris.js"></script> -->
  <!-- <script src="js/app/charts/sparkline.js"></script> -->
    </form>
</body>


<!-- Mirrored from themekit.aws.ipv4.ro/dist/themes/social-1/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Dec 2015 18:33:43 GMT -->
</html>