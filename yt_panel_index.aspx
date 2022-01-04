<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim_paneli.Master" AutoEventWireup="true" CodeBehind="yt_panel_index.aspx.cs" Inherits="e_ticaret.yt_panel_index" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="row">
        <!-- Area Chart -->
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive">
                        <h2>Üyeler</h2>
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

                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive">
                        <h2>Ürünler</h2>
                        <table id="Urunler" class="table table-striped table-bordered table-wrapper-scroll-y my-custom-scrollbar" style="width: 100%;">
                            <thead>

                                <tr>
                                    <th>No</th>
                                    <th>Resim</th>
                                    <th>Adi</th>
                                    <th>Fiyat</th>
                                    <th>Açıklama</th>
                                    <th>Kategori</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%ArrayList urunlistesi = new Urunlerdao().urungetir();
                                    foreach (Urunler gelenurun in urunlistesi)
                                    {%>
                                <tr>

                                    <td><%Response.Write(gelenurun.Urunid.ToString()); %></td>
                                    <td>
                                        <img src="<%Response.Write("Urunresimleri/" + gelenurun.Resim); %>" style="width: 100px; height: 80px" /></td>
                                    <td><%Response.Write(gelenurun.Urunadi); %></td>
                                    <td><%Response.Write(gelenurun.Fiyat.ToString()); %></td>
                                    <td>
                                        <!-- Button trigger modal -->
                                        <button type="button" data-placement="top" data-toggle="modal"
                                            title="Görüntüle" class="btn btn-primary btn-xs"
                                            style="font-size: x-small" data-target="#exampleModalCenter">
                                            Açıklama Oku
                                        </button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModalCenter" tabindex="-1"
                                            role="dialog" aria-labelledby="exampleModalCenterTitle"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Açıklama</h5>
                                                        <button type="button" class="close"
                                                            data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <%Response.Write(gelenurun.Aciklama); %>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">
                                                            Kapat</button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td><%Response.Write(gelenurun.Kategori.Kateadi); %></td>
                                </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="max-height: 500px !important;">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <div class="table-responsive" style="width: 100%;">
                        <h2>Kategoriler</h2>
                        <table id="Urunler" class="table table-striped table-bordered" style="margin-right: 10px; width: 90%;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kategori Adı</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%ArrayList kate = new Kategorilerdao().tumkategorileri_getir();
                                    foreach (Kategoriler gkat in kate)
                                    {%>
                                <tr>
                                    <td><%Response.Write(gkat.Kateno); %></td>
                                    <td><%Response.Write(gkat.Kateadi); %></td>
                                </tr>
                                <%   } %>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive" style="width: 100%;">
                        <h2>Altkategoriler</h2>
                        <table id="Urunler" class="table table-striped table-bordered" style="width: 90%;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Alt Kategori Adı</th>
                                    <th>Ana Kategori Adı</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%ArrayList altkat = new Altkategorilerdao().alttumu();
                                    foreach (Altkategoriler gelenalt in altkat)
                                    {%>
                                <tr>

                                    <td><%Response.Write(gelenalt.Altkateno); %></td>
                                    <td><%Response.Write(gelenalt.Altkateadi); %></td>
                                    <td><%Response.Write(gelenalt.Kategori.Kateadi); %></td>
                                </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
     <!-- /.row -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Fixed Header Table</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 300px;">
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>User</th>
                      <th>Date</th>
                      <th>Status</th>
                      <th>Reason</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>183</td>
                      <td>John Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-success">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>Alexander Pierce</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-warning">Pending</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>Bob Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-primary">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>Mike Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-danger">Denied</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>134</td>
                      <td>Jim Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-success">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>494</td>
                      <td>Victoria Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-warning">Pending</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>832</td>
                      <td>Michael Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-primary">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>982</td>
                      <td>Rocky Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-danger">Denied</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
</asp:Content>
