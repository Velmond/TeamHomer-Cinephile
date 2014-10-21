<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cinephile._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cinephile</h1>
        <p class="lead">The place for all your favorite movies information.</p>
    </div>

    <div class="row">
        <asp:Repeater ID="HomeMoviesRepeater" runat="server"
            ItemType="Cinephile.Data.Movies">
            <ItemTemplate>
                <div class="col-md-4 bordered" style='<%# "background: url('" + Item.PosterPath + "') no-repeat top center; resize: both; width: 100%" %>'>
                    <h2 class="homePageMovieTitle"><%# Item.Title %></h2>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
