<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uye_ol.aspx.cs" Inherits="e_ticaret.uye_ol" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="Style/uye_ol.css">
    <title>Document</title>
    <style type="text/css">
        .input {
        }
    </style>
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
        <div class="user signupBx">
            <div class="formBx">
                <form id="form1" runat="server">
                    <h2>Hesap Oluştur</h2>
                    <asp:TextBox ID="kuladitxt" runat="server" placeholder="Kullanıcı Adı" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="adstxt" runat="server" placeholder="Ad Soyadı" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="emailtxt" runat="server" placeholder="Email Adresi" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="sifretxt" runat="server" placeholder="Yeni Şifre" CssClass="input" type="password"></asp:TextBox>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Şifre Onayla" CssClass="input" type="password"></asp:TextBox>
                    <asp:TextBox ID="dogtar" runat="server" CssClass="input" type="date"></asp:TextBox>
                    <asp:DropDownList ID="cinsiyet" runat="server" CssClass="input">
                        <asp:ListItem Value="0">Seçiniz</asp:ListItem>
                        <asp:ListItem Value="1">Kadın</asp:ListItem>
                        <asp:ListItem Value="2">Erkek</asp:ListItem>
                    </asp:DropDownList>
                     <asp:TextBox ID="adrestxt" runat="server" CssClass="input" placeholder="Adres"></asp:TextBox>
                    <br>
                    <asp:Button ID="Button1" runat="server" Text="Üye Ol" CssClass="submit" OnClick="Button1_Click" />
                    <p class="signup">Zaten Üye Misiniz  <a href="uye_giris.aspx" onclick='toggleForm();'>Giriş Yap.</a></p>
                </form>
            </div>
            <div class="imgBx">
                <img src="İmg/u-1.jpg" alt="">
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
