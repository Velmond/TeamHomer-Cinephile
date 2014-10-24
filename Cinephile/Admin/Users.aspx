<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Cinephile.Admin.Users" %>

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
                            PageSize="5" PagedControlID="UsersListView" QueryStringField="page">
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
                </div>
            </div>
        </div>
        <div class="row">
            <p></p>
        </div>
        <div class="row">
            <div class="input-group col-md-12">
                <div class="col-md-3">
                    <asp:DropDownList ID="SortList" runat="server"
                        CssClass="form-control">
                        <asp:ListItem Selected="true">UserName</asp:ListItem>
                        <asp:ListItem>Email</asp:ListItem>
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

    <div class="well text-center">
        <div class="row">
            <div class="col-md-4">
                <h4 class="text-center">Administrator's page</h4>
            </div>
            <div class="col-md-8">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <asp:DropDownList runat="server" ID="RolesDropDownList"
                        SelectMethod="RolesDropDownList_GetData"
                        DataTextField="Name"
                        DataValueField="Id"
                        ItemType="Cinephile.Data.AspNetRole"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" ID="NewRoleButton"
                        Text="Assign Role"
                        CssClass="btn btn-default btn-block"
                        OnClick="NewRoleButton_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <asp:Label ID="Message"
            ForeColor="Red"
            runat="server" />
        <br />
    </div>

    <div class="row">
        <div class="col-md-6">
            <asp:ListView runat="server" ID="UsersListView"
                ItemType="Cinephile.Data.AspNetUser"
                SelectMethod="UsersListView_GetData"
                OnSelectedIndexChanged="UsersListView_SelectedIndexChanged"
                OnPagePropertiesChanging="UsersListView_PagePropertiesChanging"
                DataKeyNames="Id">
                <LayoutTemplate>
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div id="DataContainer" runat="server" class="row">
                            <table class="table table-striped table-hover ">
                                <thead>
                                    <tr>
                                        <td>Username</td>
                                        <td>Email</td>
                                        <td>Phone number</td>
                                    </tr>
                                </thead>
                                <tbody id="ItemPlaceholder" runat="server">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </LayoutTemplate>

                <EmptyDataTemplate>
                    <div id="DataContainer" runat="server">
                        <div id="ItemPlaceholder" runat="server">
                            <h3>No users were found.</h3>
                        </div>
                    </div>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Item.UserName %></td>
                        <td><%# Item.Email %></td>
                        <td><%# Item.PhoneNumber %></td>
                        <td>
                            <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
                                CssClass="btn btn-default" />
                        </td>
                    </tr>
                </ItemTemplate>

                <SelectedItemTemplate>
                    <tr class="active">
                        <td><%# Item.UserName %></td>
                        <td><%# Item.Email %></td>
                        <td><%# Item.PhoneNumber %></td>
                        <td>
                            <asp:LinkButton ID="SelectButton" runat="server"
                                Enabled="false"
                                CommandName="Select" Text="Select"
                                CssClass="btn btn-default" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>

        <div class="col-md-6">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>User information</strong>
                    </div>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <span class="label label-default">Id</span>
                            <asp:Label runat="server" ID="UserId" Text="" />
                        </li>
                        <li class="list-group-item">
                            <span class="label label-default">Username</span>
                            <asp:Label runat="server" ID="UserName" Text="" />
                        </li>
                        <li class="list-group-item">
                            <span class="label label-default">Email</span>
                            <asp:Label runat="server" ID="UserEmail" Text="" />
                        </li>
                        <li class="list-group-item">
                            <span class="label label-default">Current role</span>
                            <asp:Label runat="server" ID="UserRole" Text="" />
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>

</asp:Content>
