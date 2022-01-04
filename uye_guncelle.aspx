<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="uye_guncelle.aspx.cs" Inherits="e_ticaret.uye_guncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
      <div class="row">

    <div class="col-md-12 col-sm-12">
        <div class="container">
            <div class="x_title">
                <h2>Üye Güncelle</h2>
                  <div class="form-group">
                    <label>Üye Adı</label>
                    <asp:TextBox ID="uyeadtxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Kullanıcı Adı</label>
                    <asp:TextBox ID="kuladtxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Şifre</label>
                    <asp:TextBox ID="sifretxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Doğum Tarihi</label>
                    <asp:TextBox ID="dogtartxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Cinsiyet</label>
                    <asp:TextBox ID="cinstxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="emailtxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Adres</label>
                    <asp:TextBox ID="adrestxt" runat="server" Rows="5" TextMode="MultiLine"  CssClass="form-control"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <label>Onay Durumu</label>
                    <asp:TextBox ID="onaytxt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Güncelle" style="margin-bottom:50px;" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
