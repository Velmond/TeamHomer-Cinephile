<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="Cinephile.MovieDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:Image ID="MovieImage" CssClass="col-md-3" runat="server" />
        <div class="col-md-9">
            <div class="row">
                <h1 class="text-center col-md-12 page-header">
                    <asp:Label Text="" ID="PageTitle" runat="server" />
                </h1>
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
                            <ItemTemplate><%#: Item.Name %></ItemTemplate>
                            <SeparatorTemplate>, </SeparatorTemplate>
                        </asp:Repeater>
                    </li>
                    <li class="list-group-item">
                        <span class="label label-default">Length</span>
                        <asp:Label Text="" ID="Length" runat="server" />
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-md-5">
            <div class="row">
                <p class="col-md-12">
                    by:
                    <asp:Repeater ID="RepeaterDirectors" runat="server" ItemType="Cinephile.Data.Artist">
                        <ItemTemplate><strong><%#: Item.FullName  %></strong></ItemTemplate>
                        <SeparatorTemplate>, </SeparatorTemplate>
                    </asp:Repeater>
                </p>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title gold"><strong>Cast</strong></h1>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="GridViewActors" AllowPaging="true" PageSize="3" AutoGenerateColumns="false"
                                AllowSorting="true" runat="server" OnPageIndexChanging="GridViewActors_PageIndexChanging"
                                OnSorting="GridViewActors_Sorting" GridLines="None" CellPadding="2" >
                                <Columns>                                   
                                    <asp:ImageField DataImageUrlField="PicturePath"></asp:ImageField>
                                    <asp:HyperLinkField DataTextField="FullName" HeaderText="Name"
                                         SortExpression="FullName" DataNavigateUrlFields="PicturePath" />
                                    <asp:TemplateField HeaderText="Country" SortExpression="CounryId">
                                        <ItemTemplate>
                                            <%# Eval("Country.Name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="BirthDate" DataFormatString="{0:d}" HeaderText="Born" SortExpression="BirthDate" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
