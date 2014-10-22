<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="Cinephile.MovieDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:Image ID="MovieImage" CssClass="col-md-3" runat="server" />
        <div class="col-md-9">
            <div class="row">
                <h1 class="text-center col-md-12 page-header"><asp:Label Text="" ID="PageTitle" runat="server" /></h1>
            </div>
            <div class="row text-center">
                <asp:Label Text="" ID="Rating" CssClass="col-md-12" runat="server" />
            </div>
            <hr />
            <div class="row well well-lg">
                <asp:Label Text="" ID="StoryLine" CssClass="col-md-12" runat="server" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading"><strong>Additional Info</strong></div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="label label-default">Release Date</span>
                        <asp:Label Text="" ID="ReleaseDate" runat="server" />
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Language</span>
                        <asp:Label Text="" ID="Language" runat="server" />
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Length</span>
                        <asp:Label Text="" ID="Length" runat="server" />
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
