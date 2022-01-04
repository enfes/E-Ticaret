u<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="urun_detay.aspx.cs" Inherits="e_ticaret.urun_detay" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/urun-detay.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="u-detay">
            <% 
                int urunid = Convert.ToInt32(Request.QueryString["urunid"]);
                Urunler urun = new Urunlerdao().tekurun(urunid);
            %>
            <div class="imgBX">
                <img src="<%Response.Write("Urunresimleri/" + urun.Resim);%>" alt="">
            </div>
            <div class="aciklama">
                <h2><%Response.Write(urun.Urunadi);%></h2>
                <p class="description">
                    <%Response.Write(urun.Aciklama); %>
                </p>
                <div class="u-btn">
                    <a href="sepet.aspx?urunid=+<%Response.Write(urun.Urunid);%>">Sepete Ekle</a>
                </div>
            </div>
        </div>
    </div>
    <div class="u-alt">
        <div class="u-left">
        </div>
        <div class="u-middle">
        </div>
        <div class="u-right">
        </div>
        <%        %>
</asp:Content>
