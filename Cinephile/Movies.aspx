<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="Cinephile.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="well">
        <div class="row">
            <div class="col-md-12">
            <div class="col-md-3">
                <asp:Panel runat="server" DefaultButton="SearchSubmitBtn">
                    <asp:TextBox runat="server" ID="SearchBox"
                        CssClass="form-control"
                        placeholder="Search for a movie...">
                    </asp:TextBox>
                    <asp:Button ID="SearchSubmitBtn" runat="server"
                        Style="display: none"
                        OnClick="SearchSubmitBtn_Click" />
                </asp:Panel>
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-3">
                    <div class="text-right">
                    <asp:DataPager runat="server" ID="ListViewDataPager"
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
                                RenderNonBreakingSpacesBetweenControls="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div></div>
        </div>
        <div class="row">
            <p></p>
        </div>
        <div class="row">
            <div class="input-group col-md-12">
                <div class="col-md-3">
                    <asp:DropDownList ID="SortList" runat="server"
                        CssClass="form-control">
                        <asp:ListItem Selected="true">Title</asp:ListItem>
                        <asp:ListItem>ReleseDate</asp:ListItem>
                        <asp:ListItem>RunningTime</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="SortDirectionList" runat="server"
                        CssClass="form-control">
                        <asp:ListItem Value="ASC" Text="Ascending" Selected="True" />
                        <asp:ListItem Value="DESC" Text="Descending" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="SortButton"
                        Text="Sort"
                        OnClick="SortButton_Click"
                        runat="server"
                        CssClass="btn btn-default btn-block" />
                </div>
                <div class="col-md-3">
                    <span class="input-group-btn">
                        <asp:Button runat="server" ID="ShowAll"
                            CssClass="btn btn-default btn-block"
                            Text="Show all"
                            OnClick="ShowAll_Click" />
                    </span>
                </div>
            </div>
        </div>
    </div>

    <% if(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("admin"))
       { %>
    <div class="well">
        <div class="row">
            <div class="col-md-4">
                <h4 class="text-center">Administrator's page</h4>
            </div>
            <div class="col-md-8">
                <div class="col-md-4">
                    <asp:Button runat="server" ID="CreateButton"
                        Text="Add"
                        OnClick="CreateButton_Click"
                        CssClass="btn btn-default btn-block" />
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" ID="EditButton"
                        Text="Edit"
                        OnClick="EditButton_Click"
                        CssClass="btn btn-default btn-block" />
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" ID="DeleteButton"
                        Text="Delete"
                        OnClick="DeleteButton_Click"
                        CssClass="btn btn-default btn-block" />
                </div>
            </div>
        </div>
    </div>
    <% } %>

    <div class="row text-center">
        <asp:Label ID="Message"
            ForeColor="Red"
            runat="server" />
        <br />
    </div>

    <asp:ListView runat="server" ID="MoviesListView"
        ItemType="Cinephile.Data.Movie"
        SelectMethod="MoviesListView_GetData"
        DeleteMethod="MoviesListView_DeleteItem"
        OnSelectedIndexChanging="MoviesListView_SelectedIndexChanging"
        DataKeyNames="Id">
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
                <% if(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("admin"))
                   { %>
                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
                    CssClass="btn btn-default" />
                <% } %>
                <asp:ImageButton runat="server" ID="MovieDetailsImageBtn"
                    ImageUrl="<%#: Item.PosterPath %>"
                    CssClass="movie-poster"
                    PostBackUrl='<%#: "~/MovieDetails.aspx?id=" + Item.Id %>'
                    Width="95%"
                    ImageAlign="AbsMiddle"
                    AlternateText="<%#: Item.Title %>" />
            </div>
        </ItemTemplate>

        <SelectedItemTemplate>
            <div class="col-md-3 movie-poster-container-selected">
                <% if(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("admin"))
                   { %>
                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
                    CssClass="btn btn-default" />
                <% } %>
                <asp:ImageButton runat="server" ID="MovieDetailsImageBtn"
                    ImageUrl="<%#: Item.PosterPath %>"
                    CssClass="movie-poster-selected"
                    PostBackUrl='<%#: "~/MovieDetails.aspx?id=" + Item.Id %>'
                    Width="95%"
                    ImageAlign="AbsMiddle"
                    AlternateText="<%#: Item.Title %>" />
            </div>
        </SelectedItemTemplate>
    </asp:ListView>

</asp:Content>
