<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="urun_goster.aspx.cs" Inherits="e_ticaret.urun_goster" %>
<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
   <div class="row">
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive" style="width: 100%;">
                        u<table id="Urunler" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Resim</th>
                        <th>Adi</th>
                        <th>Fiyat</th>
                        <th>Açıklama</th>
                        <th>Kategori</th>
                        <th>Güncelle</th>
                        <th>Sil</th>
                    </tr>
                </thead>
                <tbody>
                    <%ArrayList urunlistesi = new Urunlerdao().urungetir();
                        foreach (Urunler gelenu in urunlistesi)
                        {%>
                    <tr>
                        <td><%Response.Write(gelenu.Urunid);%></td>
                        <td>
                            <img src="<%Response.Write("Urunresimleri/"+gelenu.Resim); %>" style="width: 100px; height: 80px" /></td>
                        <td><%Response.Write(gelenu.Urunadi);%></td>
                         <td><%Response.Write(gelenu.Fiyat);%></td>
                        <td>
                            <!-- Button trigger modal -->
                            <button type="button" data-placement="top" data-toggle="modal" title="Görüntüle" class="btn btn-primary btn-xs" style="font-size: x-small" data-target="#exampleModalCenter">
                                Açıklama Oku
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Açıklama</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                             <%Response.Write(gelenu.Aciklama);%>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td> <%Response.Write(gelenu.Kategori.Kateadi);%></td>
                         <td>
                            <a class="btn btn-primary btn-sm" href="urun_guncelle.aspx?urunid=+<%Response.Write(gelenu.Urunid);%>">Güncelle</a>
                        </td>
                        <td>
                            <a class="btn btn-primary btn-sm" href="urun_sil.aspx?urunid=+<%Response.Write(gelenu.Urunid);%>" onclick="return confirm('Urun Silmek İstediğinize Eminmisiniz?')">Sİl</a>
                        </td>
                    </tr>
                    <%  } %>
                </tbody>
            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
