<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="altkategoriler.aspx.cs" Inherits="e_ticaret.altkategoriler" %>
<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
      <div class="row">
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive" style="width: 100%;">
                        <table id="Urunler" class="table table-striped table-bordered" style="margin-right: 10px; width: 100%;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Altkategori Adı</th>
                                    <th>Anakategori Adı</th>
                                    <th>Güncelle</th>
                                    <th>Sil</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    ArrayList alt = new Altkategorilerdao().alttumu();
                                    foreach (Altkategoriler altkate in alt)
                                    {%>
                                <tr>

                                    <td><%Response.Write(altkate.Altkateno.ToString()); %></td>
                                    <td><%Response.Write(altkate.Altkateadi); %></td>
                                    <td><%Response.Write(altkate.Kategori.Kateadi); %></td>
                                     <td>
                                        <a class="btn btn-primary" href="altkategori_guncelle.aspx?altkateno= +<%Response.Write(altkate.Altkateno);%>">Güncelle</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="altkategori_sil.aspx?altkateno= +<%Response.Write(altkate.Altkateno);%>" onclick="return confirm('Altkategoriyi silmek istiyormusunuz')">Sil</a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
