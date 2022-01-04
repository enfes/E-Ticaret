<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="siparis_detay.aspx.cs" Inherits="e_ticaret.siparis_detay" %>
<%@ Import Namespace="e_ticaret" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/siparis_detay.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <div class="container" style="height:auto !important;">
        <div class="list">
            <div class="liste">
                <ul>
                    <h4><a href="hesabim.html">Enver Yılmaz</a></h4>
                    <li><a href="siparis.html">Siparişlerim</a></li>
                    <li><a href="favorilerim.html">Favorilerim</a></li>
                    <li><a href="#">Destek Taleplerim</a></li>
                    <li><a href="#">Değerlendirmelerim</a></li>
                    <li><a href="#">Hediye Çeklerim</a></li>
                    <li><a href="kullanici_bilgileri.html">Kullanıcı Bilgilerim</a></li>
                </ul>
            </div>
        </div>
        <div class="content">
            <%  int uyeid = Convert.ToInt32(Session["uyeid"]);
                Siparisler sip = new Siparislerdao().teksip(uyeid);
               
               %>
            <div class="table">

                <div class="sip-bilgi">
                    <p><%Response.Write(sip.Sipno); %></p>
                    <p><%Response.Write(sip.Sip_tarihi); %></p>
                    <p>Sipariş Durumu</p>
                </div>
                <div class="s-left">
                    <div class="imgbx">
                        <img src="<%Response.Write("Urunresimleri/" + sip.Urun.Resim);%>" alt="">
                    </div>
                    <div class="msgbx">
                        <p class="tp">Lorem ipsum dolor sit amet consectetur.</p>
                        <p class="tp">849 Tl</p>
                        <div class="u-btn">
                            <a href="#" class="tp">Tekrar al</a>
                        </div>
                        <p class="tp"><a href="#">Ürünü Değerlendir</a></p>
                    </div>
                </div>
                <div class="s-right">
                    <div class="s-box-1">
                        <p><a href="#">
                            <img src="İmg/truck.png" alt="Kargo Takibi"></a></p>
                    </div>
                    <div class="s-box-2">
                        <p><a href="#">
                            <img src="İmg/file.png" alt="Faturayı Görüntüle" /></a></p>
                    </div>
                    <div class="s-box-3">
                        <p><a href="#">
                            <img src="İmg/holding-hand.png" alt="Kolay İade Et"></a></p>
                    </div>
                    <div class="s-box-4">
                        <p><a href="#">
                            <img src="İmg/envelope.png" alt="Talep Oluştur"></a></p>
                    </div>
                </div>
            </div>
            <%   %>
        </div>
    </div>
</asp:Content>

