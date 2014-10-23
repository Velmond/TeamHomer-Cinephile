<%@ Page Title="Review" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReviewMovie.aspx.cs" Inherits="Cinephile.ReviewMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="input-group input-group-lg">
                <ext:TextBox runat="server" ID="ReviewTitle" PlaceHolder="Title" CssClass="form-control" />
            </div>
        </div>
    </div>
</asp:Content>
