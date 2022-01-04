<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="e_ticaret._default" %>

<%@ Import Namespace="e_ticaret" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="list">
        <%ArrayList katelistesi = new Kategorilerdao().tumkategorileri_getir();
            foreach (Kategoriler k in katelistesi)
            {%>
        <div class="liste">
            <ul>
                <h4><a href="urunler.aspx?kateno=+<%Response.Write(k.Kateno);%>"><%Response.Write(k.Kateadi);%></a></h4>
                <%
                    ArrayList altkatelistesi = new Altkategorilerdao().tekaltkategetir(k.Kateno);
                    foreach (Altkategoriler a in altkatelistesi)
                    {%>
                <li><a href="urunler.aspx?altkateno=+<%Response.Write(a.Altkateno);%>"><%Response.Write(a.Altkateadi); %></a></li>
                <%  } %>
            </ul>
        </div>
        <%  } %>
    </div>
    <div class="content">
        <!-- Image Slider Start-->
        <div class="slider">
            <div class="slides">
                <!-- Radio button start-->
                <input type="radio" name="radio-btn" id="radio1" />
                <input type="radio" name="radio-btn" id="radio2" />
                <input type="radio" name="radio-btn" id="radio3" />
                <!-- Radio button end-->
                <!-- Slide images start-->
                <div class="slide first">
                    <img src="İmg/1.jpg" alt="" />
                </div>
                <div class="slide">
                    <img src="İmg/2.jpg" alt="" />
                </div>
                <div class="slide">
                    <img src="İmg/3.jpg" alt="" />
                </div>
                <!-- Slide images end-->
                <!-- automatic navigation start-->
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                </div>
                <!-- automatic navigation end-->


                <!-- Slide images end-->
            </div>
        </div>
        <!-- Manuel navigation start-->
        <div class="navigation-manuel">
            <label for="radio1" class="manual-btn"></label>
            <label for="radio2" class="manual-btn"></label>
            <label for="radio3" class="manual-btn"></label>
        </div>
        <!-- Manuel navigation end-->
        <div class="reklam-place">
            <img src="İmg/reklam.jpg" alt="" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-u">
        <% 
            ArrayList urunler = new Urunlerdao().urungetir();
            foreach (Urunler u in urunler)
            {
        %>
        <div class="u">
            <div class="u-box">
                <div class="imgbox">
                    <img src="<%Response.Write("Urunresimleri/" + u.Resim); %>" />
                </div>
                <div class="details">
                    <div class="u-content">
                        <h2><a href="urun_detay.aspx?urunid=<%Response.Write(u.Urunid);%>"><% Response.Write(u.Urunadi); %></a></h2>
                        <span><%Response.Write(u.Fiyat); %></span>
                        <p class="description">
                            <%Response.Write(u.Aciklama); %>
                        </p>
                        <div class="u-btn">
                            <a href="sepet.aspx?urunid=<%Response.Write(u.Urunid);%>">Satın al</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <div class="page-num">
        <%  int urunsayi = new Urunlerdao().urunler();
            int toplamkayitsayisi = Convert.ToInt32(urunsayi);
            int toplam_sayfa_sayisi = 0;
            int bulundugumsayfa = 0;
            if (toplamkayitsayisi % 9 == 0) toplam_sayfa_sayisi = toplamkayitsayisi / 9;
            else toplam_sayfa_sayisi = toplamkayitsayisi / 9 + 1;
        %>
        <div class="pages">
            <div class="onceki">
                <%  if (bulundugumsayfa > 1)
                    {

                %>
                <a href="urunler.aspx?sayfano=<%Response.Write(bulundugumsayfa - 1); %>"><i class="far fa-long-arrow-alt-left"></i></a>
                <%  } %>
            </div>
                <%   for (int i = 1; i <= toplam_sayfa_sayisi; i++)
                    {
                    %>
            <div class="num active">
            
                       <%  if (bulundugumsayfa == i)
                           {%>
                              <a href="urunler.aspx?sayfano=<%Response.Write(i);%>"><%Response.Write("<b>" + i + "</b>");%></a>
                        <% } %>
                       <%  else %>   <a href="urunler.aspx?sayfano=<%Response.Write(i);%>"><%Response.Write(i);%></a><%; %>
             
            </div>
               <%    }%>
            <div class="sonraki">
                <%if (bulundugumsayfa < toplam_sayfa_sayisi)
                  {

                %>
                <a href="urunler.aspx?sayfano=<%Response.Write(bulundugumsayfa + 1);%>"><i class="far fa-long-arrow-alt-right"></i></a>
                <%} %>
            </div>
        </div>
        <% %>
    </div>
</asp:Content>
