<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uye_giris.aspx.cs" Inherits="e_ticaret.uye_giris" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="Style/uye_giris.css">
    <title>Üye Girişi</title>
</head>
<body>
    <div class="wrapper">
        <div class="navbar">
            <div class="logo">
                <a href="index.html">LOGO</a>
            </div>
            <div class="search-box">
                <input type="search" name="search" placeholder="Search..">
            </div>
            <div class="btn">
             </div>
        </div>
    </div>
    <div class="box">
        <div class="box-1">
            <div class="box-2">
                <a href="#">Mağazanı Aç</a>
                <a href="#">Talepte Bulun</a>
            </div>
            <div class="box-3">
                <a href="#">Ücretsiz İlan Ver</a>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="user siginBx">
            <div class="imgBx">
                <img src="İmg/u-3.jpg" alt="">
            </div>
            <div class="formBx">
                <form id="form1" runat="server">
                    <h2>Giriş Yap</h2>
                     <asp:TextBox ID="kuladitxt" runat="server" placeholder="Kullanıcı Adı" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="sifretxt" runat="server" placeholder="Şifre Giriniz" CssClass="input" type="password"></asp:TextBox>
                     <asp:Button ID="Button1" runat="server" Text="Giriş Yap" CssClass="submit" OnClick="Button1_Click" />
                    <p class="signup">Üye Değil Misiniz ?<a href="uye_ol.aspx" onclick='toggleForm();'>Kayıt Ol.</a></p>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot-cont">
          <div class="left">
              <ul>
                  <h4><a href="#">Elektronik</a></h4>
                  <li><a href="#">Cep Telefonu</a></li>
                  <li><a href="#">Tablet</a></li>
                  <li><a href="#">Bilgisayar</a></li>
                  <li><a href="#">Ev Aletleri</a></li>
                  <li><a href="#">Diğer</a></li>
              </ul>
              <ul>
                  <h4><a href="#">2.El Yedek Parçalar</a></h4>
                  <li><a href="#">Araç & Vasıta Parçaları</a></li>
                  <li><a href="#">Elektirik/Elektronik Parçaları</a></li>
                  <li><a href="#">Beyaz Eşya Parçaları</a></li>
                  <li><a href="#">Makine Parçaları</a></li>
                  <li><a href="#">Diğer</a></li>
              </ul>
              <ul>
                  <h4><a href="#">2.El Yedek Parçalar</a></h4>
                  <li><a href="#">Araç & Vasıta Parçaları</a></li>
                  <li><a href="#">Elektirik/Elektronik Parçaları</a></li>
                  <li><a href="#">Beyaz Eşya Parçaları</a></li>
                  <li><a href="#">Makine Parçaları</a></li>
                  <li><a href="#">Diğer</a></li>
              </ul>
          </div>
          <div class="mid">
    
          </div>
          <div class="right">
            <div class="search-box-2">
              <input type="search" name="search" placeholder="Search..">
            </div>
            
          </div>
        </div>
     </div>
</body>
</html>