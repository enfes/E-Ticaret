<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="Kategori_guncelle.aspx.cs" Inherits="e_ticaret.Kategori_guncelle" %>
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
                                            <th>Kategori Adı</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList kate = new Kategorilerdao().tumkategorileri_getir();
                                            if (Page.IsPostBack == false)
                                                foreach (Kategoriler gkat in kate)
                                                {%>
                                        <tr>
                                            <td><%Response.Write(gkat.Kateno); %></td>
                                            <td><%Response.Write(gkat.Kateadi); %></td>
                                        </tr>
                                        <%   } %>
                                    </tbody>
                                </table>
                                <div class="span3" style="text-align: center;">
                                    <h3 style="margin-right: 115px;">Kategori Güncelle</h3>
                                    <div>
                                        <asp:TextBox ID="katenot" runat="server" CssClass="span3" placeholder="Kategori No"></asp:TextBox>
                                        <asp:TextBox ID="katead" runat="server" CssClass="span3" placeholder="Kategori Adı"></asp:TextBox>
                                        <asp:Button ID="Button1" runat="server" Text="Güncelle" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                                    </div>
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
