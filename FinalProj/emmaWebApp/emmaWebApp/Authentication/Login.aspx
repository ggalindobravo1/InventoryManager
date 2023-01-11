<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="emmaWebApp.Authentication.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .container1 {
            display: flex;
            justify-content: center;
            align-self: center;
            text-align: center;
            background-color: white !important;
        }

        .row, .col {
            margin-bottom: 10px;
        }

        .container2 {
            display: flex;
            justify-content: center;
            background-color: #353535;
            border: solid 1px black;
            border-radius: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            color: white;
            width: 400px;
        }

        .form-control {
            border: solid 0.5px white;
            background-color: #353535;
            color: white;
            width: 300px;
        }

        @media screen and (max-width: 600px) {
            /*  input screen less than 600px, change width to 200*/
            .form-control {
                width: 200px;
            }
        }

        input:focus {
            color: white;
        }

        .text-danger {
            font-weight: 900;
        }
    </style>
    <div class="jumbotron container1">
        <div class="container2">
            <div>
                <div class="row">
                    <%-- <h2> LOGIN </h2>--%>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/login.png" Style="width: 120px; border-radius: 60px; background-color: #fff; margin-top: 20px;" />
                </div>
                <div class="row">
                    <div class="col">
                        <label>Username: </label>
                    </div>
                    <div class="col">
                        <input type="text" id="txtUser" class="form-control form-control-lg" runat="server" placeholder="Username" />
                    </div>
                    <div class="col">
                        <label>Password: </label>
                    </div>
                    <div class="col">
                        <input type="password" id="passPass" class="form-control form-control-lg" runat="server" placeholder="Password" />
                    </div>

                </div>
                <div class="row">
                    <asp:Button ID="btnLogin" class="btn btn-warning btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </div>

                <div class="row">
                    <br />
                    <asp:Label ID="lblMessage" class="text-danger" runat="server"></asp:Label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required" class="text-danger"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passPass" ErrorMessage="Password is required" class="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
