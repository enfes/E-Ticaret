<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="uye_goster.aspx.cs" Inherits="e_ticaret.uye_goster" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <div class="container" style="max-height: 500px !important;">
            <br />
            <br />
            <div class="container">
                <div class="table-responsive" style="width:100%;">
                    <div class="card shadow mb-4" style="width:100%;">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="width:100%;">
                            <div class="table-responsive" style="width: 100%;">

                                <table id="Urunler" class="table table-striped table-bordered" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kullanıcı Adı</th>
                                            <th>Adı Soyadı</th>
                                            <th>Doğum Tarihi</th>
                                            <th>Cinsiyet</th>
                                            <th>Adres</th>
                                            <th>E-mail</th>
                                            <th>Onay</th>
                                            <th>Güncelle</th>
                                            <th>Sil</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%ArrayList uyelistesi = new Uyelerdao().tumuyeler(); %>
                                        <%foreach (Uyeler gelenuye in uyelistesi)
                                            {%>
                                        <tr>


                                            <td><%Response.Write(gelenuye.Uyeid.ToString()); %></td>
                                            <td><%Response.Write(gelenuye.Kuladi); %></td>
                                            <td><%Response.Write(gelenuye.Adsoyad); %></td>
                                            <td><%Response.Write(gelenuye.Dogtar.ToShortDateString()); %></td>
                                            <td><%Response.Write(gelenuye.Cinsiyet); %></td>
                                            <td><%Response.Write(gelenuye.Adres); %></td>
                                            <td><%Response.Write(gelenuye.Email); %></td>
                                            <td><%String onay;
                                                    if (gelenuye.Onay == true) onay = "Onaylandı";
                                                    else onay = "Onay Bekliyor";
                                                    Response.Write(onay); %></td>
                                            <td>
                                                <a class="btn btn-primary btn-sm" href="uye_guncelle.aspx?uyeid=+<%Response.Write(gelenuye.Uyeid);%>">Güncelle</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-primary" href="uye_sil.aspx?uyeid= +<%Response.Write(gelenuye.Uyeid);%>" onclick="return confirm('Kategori silmek istiyormusunuz')">Sil</a>
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
        </div>
    </div>
</asp:Content>
