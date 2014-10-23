<%@ Page Title="Movie Details" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="Cinephile.MovieDetails" %>

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
            <div class="row">
                <p class="col-md-12">
                    by:
                    <asp:Repeater ID="RepeaterDirectors" runat="server" ItemType="Cinephile.Data.Artist">
                        <ItemTemplate><strong><%#: Item.FullName  %></strong></ItemTemplate>
                        <SeparatorTemplate>, </SeparatorTemplate>
                    </asp:Repeater>
                </p>
            </div>
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
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title gold"><strong>Cast</strong></h1>
                        </div>
                        <div class="panel-body">
                            <asp:GridView ID="GridViewActors" AllowPaging="true" PageSize="3" AutoGenerateColumns="false"
                                AllowSorting="true" runat="server" OnPageIndexChanging="GridViewActors_PageIndexChanging"
                                OnSorting="GridViewActors_Sorting" GridLines="None" CellPadding="2">
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
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title gold"><strong>Reviews</strong></h1>
                        </div>
                        <div class="panel-body">
                            <asp:ListView ID="ListViewReviews" runat="server"
             DataKeyNames="UserId,MovieId" DataSourceID="EntityDataSourceReviews" ItemType="Cinephile.Data.Review">   
            <EmptyDataTemplate>
                <span class="alert alert-warning">No reviews for this movie.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                UserId:
                <asp:Label Text='<%#:Eval("UserId") %>' runat="server" />
                <span style="">
                    Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    Body:
                <asp:Label ID="BodyLabel" runat="server" Text='<%# Eval("Body") %>' />
                    <br />
                    DatePosted:
                <asp:Label ID="DatePostedLabel" runat="server" Text='<%# Eval("DatePosted") %>' />
                    <br />
                    AspNetUser:
                <asp:Label ID="AspNetUserLabel" runat="server" Text='<%# Item.AspNetUser == null %>' />
                    <br />
                    <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                    <asp:DataPager PageSize="1" ID="DataPagerReviews" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="False" ShowNextPageButton="False" ShowPreviousPageButton="True" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="False" ShowNextPageButton="True" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>            
        </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField runat="server" ID="RequestId" Value='<%# Request.Params["Id"] %>' />
        <asp:EntityDataSource ID="EntityDataSourceReviews" runat="server" 
            ConnectionString="name=CinephileDbEntities" DefaultContainerName="CinephileDbEntities"
             EnableFlattening="False" EntitySetName="Reviews">
           <%-- <WhereParameters>
                <asp:ControlParameter Name="MovId" ControlID="RequestId" DbType="Guid" />
            </WhereParameters>--%>
        </asp:EntityDataSource>
        
    </div>
</asp:Content>
