<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="e_ticaret.kategoriler" %>
<%@ Import Namespace="e_ticaret" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive" style="width: 100%;">
                        <table id="Urunler" class="table table-striped table-bordered" style="margin-right: 10px; width: 100%;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kategori Adı</th>
                                    <th>Güncelle</th>
                                    <th>Sil</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    ArrayList kate = new Kategorilerdao().tumkategorileri_getir();
                                    foreach (Kategoriler gkat in kate)
                                    {%>
                                <tr>

                                    <td><%Response.Write(gkat.Kateno.ToString()); %></td>
                                    <td><%Response.Write(gkat.Kateadi); %></td>
                                    <td>

                                        <a class="btn btn-primary" href="Kategori_guncelle.aspx">Güncelle</a>

                                    </td>
                                    <td>
                                        <a class="btn btn-primary" href="Kategori_sil.aspx?kateno=+<%Response.Write(gkat.Kateno);%>" onclick="return confirm('Kategori silmek istiyormusunuz')">Sil</a>
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
