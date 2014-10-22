<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Cinephile.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="well">
        <asp:DataPager runat="server" ID="MovieListViewDataPager"
            PageSize="8" PagedControlID="MoviesListView" QueryStringField="page">
            <Fields>
                <asp:NextPreviousPagerField
                    ShowFirstPageButton="true" FirstPageText="<<"
                    ShowPreviousPageButton="true" PreviousPageText="<"
                    ShowNextPageButton="false"
                    ShowLastPageButton="false"
                    ButtonCssClass="page-control"
                    RenderDisabledButtonsAsLabels="true"
                    RenderNonBreakingSpacesBetweenControls="false" />
                <asp:NumericPagerField ButtonCount="5"
                    CurrentPageLabelCssClass="page-control page-number-selected"
                    RenderNonBreakingSpacesBetweenControls="false"
                    NumericButtonCssClass="page-control page-number" />
                <asp:NextPreviousPagerField
                    ShowFirstPageButton="false"
                    ShowPreviousPageButton="false"
                    ShowNextPageButton="true" NextPageText=">"
                    ShowLastPageButton="true" LastPageText=">>"
                    ButtonCssClass="page-control"
                    RenderDisabledButtonsAsLabels="true"
                    RenderNonBreakingSpacesBetweenControls="false"  />
            </Fields>
        </asp:DataPager>
        <div class="col-md-4 pull-right home-page-search-container">
            <asp:Panel runat="server" DefaultButton="SearchSubmitBtn" CssClass="input-group">
                <asp:TextBox runat="server" ID="SearchBox"
                    CssClass="form-control" placeholder="Search for a movie...">
                </asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button runat="server" ID="ShowAll"
                        CssClass="btn btn-default" Text="Show all"
                        OnClick="ShowAll_Click"/>
                </span>
                <asp:Button ID="SearchSubmitBtn" runat="server"
                    Style="display: none" OnClick="SearchSubmitBtn_Click" />
            </asp:Panel>
        </div>
    </div>

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
            <div class="col-md-3 movie-poster-container">
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

</asp:Content>
