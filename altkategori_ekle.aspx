<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="altkategori_ekle.aspx.cs" Inherits="e_ticaret.altkategori_ekle" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="container" style="max-height: 500px !important;">
            <br />
            <br />
            <div class="container">
                <div class="table-responsive">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <div class="table-responsive" style="width: 100%;">

                                <table id="Urunler" class="table table-striped table-bordered" style="margin-right: 10px; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Altkategori Adı</th>
                                            <th>Anakategori Adı</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList altkate = new Altkategorilerdao().alttumu();
                                            if (Page.IsPostBack == false)
                                                foreach (Altkategoriler altk in altkate)
                                                {%>
                                        <tr>
                                            <td><%Response.Write(altk.Altkateno); %></td>
                                            <td><%Response.Write(altk.Altkateadi); %></td>
                                            <td><%Response.Write(altk.Kategori.Kateadi); %></td>
                                        </tr>
                                        <%   } %>
                                    </tbody>
                                </table>
                                <div class="span3" style="text-align: center;">
                                    <h3 style="margin-right: 115px;">Altkategori Ekle</h3>
                                    <div>
                                        <asp:TextBox ID="altkatetxt" runat="server" CssClass="span3" placeholder="Altkategori Adı"></asp:TextBox>
                                        <asp:DropDownList ID="katedliste" runat="server" CssClass="form-control" Style="width: 200px">
                                            <asp:ListItem Value="0">Seçiniz</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="Button1" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
