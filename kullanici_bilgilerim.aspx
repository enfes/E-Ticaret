<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="kullanici_bilgilerim.aspx.cs" Inherits="e_ticaret.kullanici_bilgilerim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/kullanici_bilgiler.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <div class="container">
        <div class="list">
            <div class="liste">
                <ul>
                    <h4><a href="hesabim.aspx">Enver Yılmaz</a></h4>
                    <li><a href="siparis.aspx">Siparişlerim</a></li>
                    <li><a href="favorilerim.html">Favorilerim</a></li>
                    <li><a href="#">Destek Taleplerim</a></li>
                    <li><a href="#">Değerlendirmelerim</a></li>
                    <li><a href="#">Hediye Çeklerim</a></li>
                    <li><a href="kullanici_bilgilerim.aspx">Kullanıcı Bilgilerim</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="table">
                <div class="s-left">
                    <div class="user signupBx">
                        <div class="formBx">
                            <form>
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
                                <asp:Button ID="Button1" runat="server" Text="Güncelle" CssClass="submit" OnClick="Button1_Click" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

