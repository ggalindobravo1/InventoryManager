<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Registration.aspx.cs" Inherits="emmaWebApp.Authentication.Registration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* Login/New User Styles */
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
                    <h2>Register New User </h2>
                    <asp:Label ID="lblMessage" runat="server" class="text-success"></asp:Label>
                </div>
                <div class="row">

                    <asp:Image ID="imgSecurity" runat="server" ImageUrl="~/Images/security.png" Style="width: 180px; border-radius: 60%; background-color: #fff;" />

                </div>
                <div class="row">
                    <div class="col">
                        <label>Username: </label>
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtUser" class="form-control form-control-lg" runat="server" placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" class="text-danger" ErrorMessage="Username is required" SetFocusOnError="True"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col">
                        <label>Password: </label>
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtPass" TextMode="Password" class="form-control form-control-lg" runat="server" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" class="text-danger" ErrorMessage="Password is required" SetFocusOnError="True"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col">
                        <lablel>Confirm Password: </lablel>
                    </div>
                    <div class="col">
                        <asp:TextBox ID="txtConfirm" TextMode="Password" class="form-control form-control-lg" runat="server" placeholder="Confirm Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirm" class="text-danger" ErrorMessage="Password does not match" SetFocusOnError="True"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" class="text-danger" ErrorMessage="Must confirm password" SetFocusOnError="True"></asp:RequiredFieldValidator>

                    </div>

                </div>
                <div class="row">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" class="btn btn-warning btn-lg btn-block" />
                    
                    <br />
                </div>



            </div>
        </div>
    </div>

    <div class="row">
        <br />

        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
