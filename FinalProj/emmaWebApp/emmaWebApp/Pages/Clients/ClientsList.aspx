<%@ Page Title="ClientsList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientsList.aspx.cs" Inherits="emmaWebApp.Pages.Clients.ClientsList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .container1 {
            display: flex;
            justify-content: center;
            align-self: center;
            text-align: center;
            background-color: #FFF !important;
        }

        h2 {
            color: #272b30 !important;
            font-weight: 900;
        }

        table, th, td {
            border-collapse: separate !important;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: none !important;
            padding: 5px;
            text-align: center;
        }

        table {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 100% !important;
            padding: 15px
        }

        .row {
            margin-bottom: 20px;
        }

        section {
            padding: 10px;
        }

        #MainContent_btnSearchClient {
            margin-top: 15px;
            width: 75%;
        }

        #MainContent_txtSearch {
            border-radius: 10px;
            margin-top: 15px;
            height: 35px;
            width: 100% !important;
            max-width: 550px !important;
        }

        @media screen and (max-width: 600px) {
            /*  input screen less than 600px, change width*/
            #MainContent_txtSearch {
                width: 250px;
            }

            td:nth-child(5), th:nth-child(5) {
                display: none;
            }
        }
    </style>


    <div class="jumbotron container1">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2>Customer List</h2>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Button ID="btnAddCust" class="btn btn-success" runat="server" OnClick="btnAddCust_Click" Text="&#10133; Add New Customer" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="btnSearchClient" runat="server" Text="Search &#128270;" class="btn btn-primary" OnClick="btnSearchClient_Click" />
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtSearch" class="form-control form-control-sm" placeholder="Search By Last, First, Email or Phone" runat="server"></asp:TextBox>
                </div>
            </div>
            
            <div class="row">
                <div class="col">
                    <asp:Label ID="Label1" runat="server" class="text-success" Text=""></asp:Label>
                    <br />
                    <section>

                        <asp:GridView ID="customersTable" class="table table-striped table-hover" PageSize="5" runat="server" DataKeyNames="ID" AllowPaging="True" AllowSorting="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="customersTable_SelectedIndexChanged" OnSorting="customersTable_Sorting" OnPageIndexChanging="customersTable_PageIndexChanging">
                        </asp:GridView>

                    </section>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
