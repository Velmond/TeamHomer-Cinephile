<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistDetails.aspx.cs" Inherits="Cinephile.ArtistDetails" %>
<asp:Content ID="ArtistDitailsContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-3">
            <div class="row">
                <asp:Image ID="ArtistImage" CssClass="col-md-12" runat="server" />
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Additional Info</strong>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <asp:Label Text="Name" ID="LabelArtistName" CssClass="label label-default" runat="server" />
                                <asp:Label Text="" runat="server" ID="ArtistName" />
                            </li>
                            <li class="list-group-item">
                                <asp:Label Text="Born on" ID="LabelArtistBirthDate" CssClass="label label-default" runat="server" />
                                <asp:Label Text="" ID="ArtistBirthDate" runat="server" />
                            </li>
                            <li class="list-group-item">
                                <asp:Label Text="Born in" ID="LabelArtistCountry" CssClass="label label-default" runat="server" />
                                <asp:Label Text="" ID="ArtistCountry" runat="server" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row">
                <h1 class="text-center col-md-12 page-header">
                    <asp:Label Text="" ID="HeaderArtistName" runat="server" />
                </h1>
            </div>
            <hr />
            <div class="row">
                <asp:ListView runat="server" ID="MoviesListView"
                              ItemType="Cinephile.Data.Movie">
                    <LayoutTemplate>
                        <div id="DataContainer" runat="server" class="row">
                            <div id="ItemPlaceholder" runat="server">
                            </div>
                        </div>
                    </LayoutTemplate>

                    <EmptyDataTemplate>
                        <div id="DataContainer" runat="server">
                            <div id="ItemPlaceholder" runat="server">
                                <h3>No movies were found.</h3>
                            </div>
                        </div>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <div class="col-md-1 movie-poster-container">
                            <asp:ImageButton runat="server" ID="MovieDetailsImageBtn"
                                             ImageUrl="<%#: Item.PosterPath %>"
                                             CssClass="movie-poster"
                                             PostBackUrl='<%#: "~/MovieDetails.aspx?id=" + Item.Id %>'
                                             Width="95%"
                                             ImageAlign="AbsMiddle"
                                             AlternateText="<%#: Item.Title %>" />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

</asp:Content>
