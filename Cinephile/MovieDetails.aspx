<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="Cinephile.MovieDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:Image ID="MovieImage" CssClass="col-md-3" runat="server" />
        <div class="col-md-9">
            <div class="row">
                <h1 class="text-center col-md-12 page-header">
                    <asp:Label Text="" ID="PageTitle" runat="server" /></h1>
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
                        <asp:Label Text="" ID="Genres" CssClass="label label-default" runat="server" />
                        <asp:Repeater ID="RepeaterGenres" runat="server" ItemType="Cinephile.Data.Genre">
                            <ItemTemplate><%#: Item.Name %></ItemTemplate>
                            <SeparatorTemplate>, </SeparatorTemplate>
                        </asp:Repeater>
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Release Date</span>
                        <asp:Label Text="" ID="ReleaseDate" runat="server" />
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Language</span>
                        <asp:Label Text="" ID="Language" runat="server" />
                    </li>
                    <li class="list-group-item">
                        <asp:Label Text="" ID="Countries" CssClass="label label-default" runat="server" />
                        <asp:Repeater ID="RepeaterCountries" runat="server" ItemType="Cinephile.Data.Country">
                            <ItemTemplate>
                                <%#: Item.Name %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Length</span>
                        <asp:Label Text="" ID="Length" runat="server" />
                    </li>
                </ul>
            </div>
        </div>
        <div class="md-9">
            <p class="col-md-12">
                by:
                <asp:Repeater ID="RepeaterDirectors" runat="server" ItemType="Cinephile.Data.Artist">
                    <ItemTemplate><strong><%#: Item.FullName  %></strong></ItemTemplate>
                    <SeparatorTemplate>, </SeparatorTemplate>
                </asp:Repeater>
            </p>
            <asp:GridView ID="GridViewActors" AllowPaging="true" PageSize="3" AutoGenerateColumns="false"
                AllowSorting="true" runat="server" OnPageIndexChanging="GridViewActors_PageIndexChanging" OnSorting="GridViewActors_Sorting" ItemType="Cinephile.Data.Artist">
                <Columns>
                    <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                    <%--<asp:ImageField DataImageUrlField="PicturePath"></asp:ImageField>--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
