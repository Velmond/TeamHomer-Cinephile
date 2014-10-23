<%@ Page Title="Review" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReviewMovie.aspx.cs" Inherits="Cinephile.ReviewMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Your review on 
                        <strong>
                            <asp:Label Text="" ID="MovieName" runat="server" />
                        </strong>
                    </legend>
                    <div class="form-group">
                        <label for="inputEmail" class="col-lg-2 control-label">Title</label>
                        <div class="col-lg-10">
                            <ext:TextBox runat="server" ID="UserTitle" CssClass="form-control input-large" PlaceHolder="Title"></ext:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="textArea" class="col-lg-2 control-label">Review</label>
                        <div class="col-lg-10">
                            <ext:TextBox runat="server" TextMode="MultiLine"
                                 Rows="5" ID="UserReview" CssClass="form-control"
                                 PlaceHolder="Your review goes here...">
                            </ext:TextBox>
                            <span class="help-block text-justified">You can share you opinion on the movie subject, 
                                actors' play and the feelings you had when the film ended. 
                                Would you recommend the movie to a friend?
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="select" class="col-lg-2 control-label">Rating</label>
                        <div class="col-lg-10">
                            <asp:DropDownList ID="DropDownListRating" runat="server">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                <asp:ListItem Value="6">6</asp:ListItem>
                                <asp:ListItem Value="7">7</asp:ListItem>
                                <asp:ListItem Value="8">8</asp:ListItem>
                                <asp:ListItem Value="9">9</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <button disabled class="btn btn-default">Cancel</button>
                            <asp:Button Text="Submit" ID="ButtonSubmit" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" runat="server" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

</asp:Content>
