<%@ Page Title="OrdersList" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersList.aspx.cs" Inherits="emmaWebApp.Pages.Orders.OrdersList" %>

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

        table {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            width: 100% !important;
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
            padding: 15px
        }

        .row {
            margin-bottom: 20px;
        }

        section {
            padding: 10px;
        }

        #MainContent_btnSearch {
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
                    <h2>Orders List</h2>
                    <hr />
                </div>


                <div class="row">
                    <div class="col">
                        <asp:Button ID="btnAddOrder" class="btn btn-success" runat="server" Text="&#10133; Add New Order" OnClick="btnAddOrder_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="btnSearch" runat="server" Text="Search &#128270;" class="btn btn-primary" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtSearch" class="form-control form-control-sm" placeholder="Search By Customer, Employee" runat="server"></asp:TextBox>
                    </div>
                </div>

               
                <div class="row">
                    <div class="col">
                        <asp:Label ID="Label1" runat="server" class="text-success" Text=""></asp:Label>
                        <br />
                        <section>
                            <asp:GridView ID="OrdersTable" class="table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" DataKeyNames="ID" AutoGenerateSelectButton="True" OnPageIndexChanging="OrdersTable_PageIndexChanging" OnSorting="OrdersTable_Sorting">
                            </asp:GridView>
                        </section>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
