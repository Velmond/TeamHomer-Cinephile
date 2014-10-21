<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Lockout.aspx.cs" Inherits="Cinephile.Account.Lockout" %>

<asp:Content ID="LockOutBodyContent" ContentPlaceHolderID="BodyContent" runat="server">
    <hgroup>
        <h1>Locked out.</h1>
        <h2 class="text-danger">This account has been locked out, please try again later.</h2>
    </hgroup>
</asp:Content>
