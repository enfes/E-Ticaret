<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="e_ticaret.sepet" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/sb-admin-2.css" rel="stylesheet" />
    <link href="Style/sb-admin-2.min.css" rel="stylesheet" />
    <link href="Style/sepet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="list">
            <div class="liste" style="width:250px;">
                <ul>
                    <h4><a href="hesabim.aspx">Enver Yılmaz</a></h4>
                    <li><a href="siparis_detay.aspx">Siparişlerim</a></li>
                    <li><a href="favorilerim.html">Favorilerim</a></li>
                    <li><a href="#">Destek Taleplerim</a></li>
                    <li><a href="#">Değerlendirmelerim</a></li>
                    <li><a href="#">Hediye Çeklerim</a></li>
                    <li><a href="kullanici_bilgilerim.aspx">Kullanıcı Bilgilerim</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="container" style="max-height: 500px !important;">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <div class="table-responsive" style="width: 100%;">
                            <h2>Sepet</h2>
                            <table id="Urunler" class="table table-striped table-bordered" style="width: 100%;text-align:center;justify-content:center;">
                                <thead>
                                </thead>
                                <tbody>
                                    <%ArrayList urunlistesi = new Urunlerdao().urungetir();
                                        foreach (Urunler gelenu in urunlistesi)
                                        {%>
                                         <tr>
                                         <td><%Response.Write(gelenu.Urunid);%></td>
                                         <td style="width: 98px">
                                            <img src="<%Response.Write("Urunresimleri/" + gelenu.Resim);%>" style="width: 100px; height: 80px" /></td>
                                         <td><%Response.Write(gelenu.Urunadi);%></td>
                                         <td><%Response.Write(gelenu.Fiyat);%></td>
                                         <td>
                                            <%Response.Write(gelenu.Aciklama);%>
                                         </td>
                                         <td><%Response.Write(gelenu.Kategori.Kateadi);%></td>
                                         <td> <asp:TextBox ID="adettxt" runat="server" placeholder="Adet" CssClass="input" style="width:30px;"></asp:TextBox></td>
                                          </tr>
                                    <%  } %>
                                    <asp:Label ID="toplamlbl" runat="server" Text=""></asp:Label>
                                </tbody>
                            </table>
                            <asp:Button ID="Button1" runat="server" Text="Siparişi Tamamla" CssClass="btn btn-primary" style="margin-right:50px;" OnClick="Button1_Click"/>
                            <asp:Button ID="Button2" runat="server" Text="Sepeti Yenile"  CssClass="btn btn-primary" OnClick="Button2_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
