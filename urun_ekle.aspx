<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="urun_ekle.aspx.cs" Inherits="e_ticaret.urun_ekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">

        <div class="col-md-12 col-sm-12">
            <div class="container">
                <div class="x_title">
                    <h2>Ürün Ekle</h2>
                    <div class="form-group">
                        <label>Urun Adi</label>
                        <asp:TextBox ID="urunadtxt" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Kategoriler</label>
                        <asp:DropDownList ID="katedliste" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="katedliste_SelectedIndexChanged">
                            <asp:ListItem Value="0">Seçiniz</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Alt Kategori</label>
                        <asp:DropDownList ID="altkatedliste" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Seçiniz</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Fiyat</label>
                        <asp:TextBox ID="fiyattxt" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Resim</label>
                        <asp:FileUpload ID="picturfile" runat="server" Height="52px" CssClass="form-control" />
                        <asp:Image ID="Image1" runat="server" Style="width: 100px" />
                    </div>
                    <div class="form-group">
                        <label>Açıklama</label>
                        <asp:TextBox ID="aciklamatxt" runat="server" Rows="5" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Kaydet" Style="margin-bottom: 50px;" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
