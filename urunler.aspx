<%@ Page Title="" Language="C#" MasterPageFile="~/İndex.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="e_ticaret.urunler" %>

<%@ Import Namespace="e_ticaret" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="list">
        <%ArrayList katelistesi = new Kategorilerdao().tumkategorileri_getir();
            foreach (Kategoriler k in katelistesi)
            {%>
        <div class="liste">
            <ul>
                <h4><a href="#"><%Response.Write(k.Kateadi);%></a></h4>
                <%
                    ArrayList altkatelistesi = new Altkategorilerdao().tekaltkategetir(k.Kateno);
                    foreach (Altkategoriler a in altkatelistesi)
                    {%>
                <li><a href="#"><%Response.Write(a.Altkateadi); %></a></li>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-u">
        <%

            ArrayList urunler = new ArrayList();
            int altkateno = Convert.ToInt32(Request.QueryString["altkateno"]);
            int sayfano = 0;
            if (Request.QueryString["sayfano"] == null)
            {
                sayfano = 1;
            }
            else sayfano = Convert.ToInt32(Request.QueryString["altsayfano"]);
            int baslangicyeri = (sayfano - 1) * 9;
            urunler = new Urunlerdao().altkategore(altkateno, baslangicyeri);
            int j = 0;
            int i = 0;
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
                        <h2><a href="urun_detay.aspx?urunid=+<%Response.Write(u.Urunid);%>"><% Response.Write(u.Urunadi); %></a></h2>
                        <span><%Response.Write(u.Fiyat); %></span>
                        <p class="description">
                            <%Response.Write(u.Aciklama); %>
                        </p>
                        <div class="u-btn">
                            <a href="sepet.aspx?urunid="+<%Response.Write(u.Urunid);%>">Satın al</a>
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
    <div class="pages">
        <div class="onceki">
            <a href="#"><i class="far fa-long-arrow-alt-left"></i></a>
        </div>
        <div class="num active">
            <a href="#">1</a>
        </div>
        <div class="num">
            <a href="#">2</a>
        </div>
        <div class="num">
           <a href="#">3</a>
        </div>
        <div class="sonraki">
           <a href="#"><i class="far fa-long-arrow-alt-right"></i></a>
        </div>
    </div>
</div>
  
    <%void sayfala(int kateno, int bulundugumsayfa)
        {
            int toplamkayitsayisi = new Urunlerdao().urunsayisi(kateno);
            int toplam_sayfa_sayisi = 0;
            if (toplamkayitsayisi % 9 == 0) toplam_sayfa_sayisi = toplamkayitsayisi / 9;
            else toplam_sayfa_sayisi = toplamkayitsayisi / 9 + 1;
            String yazimiz = "";
            if (bulundugumsayfa > 1)
            {
                yazimiz += "<div class='onceki'><a href=default.aspx?kateno=" + kateno + "&sayfano=" + (bulundugumsayfa - 1) + "><i class='far fa-long-arrow-alt-left'></i></a>";
            }
            for (int i = 1; i <= toplam_sayfa_sayisi; i++)
            {
                if (bulundugumsayfa == i) yazimiz += "<div class='num'><a href='#'>" + i + "</a></div>";
                else yazimiz += "<div class='onceki'><a href=default.aspx?kateno=" + kateno + "&sayfano=" + i + ">" + i + "><i class='far fa-long-arrow-alt-left'></i></a>";
            }
            if (bulundugumsayfa < toplam_sayfa_sayisi)
            {
                yazimiz += "<div class='sonraki'><a href=default.aspx?kateno=" + kateno + "&sayfano=" + (bulundugumsayfa + 1) + "><i class='far fa-long-arrow-alt-right'></i></a>";
            }

        }  %>
</asp:Content>
