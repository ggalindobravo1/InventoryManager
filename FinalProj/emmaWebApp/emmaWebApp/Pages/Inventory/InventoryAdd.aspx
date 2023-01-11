<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryAdd.aspx.cs" Inherits="emmaWebApp.Pages.Inventory.InventoryAdd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .container1 {
            display: flex;
            justify-content: center;
            align-self: center;
            text-align: left;
            background-color: #FFF !important;
        }

        table {
            width: 50% !important;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        table, th, td {
            border-collapse: separate !important;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            border: none !important;
        }

        table {
            padding: 15px
        }

        .row {
            margin-bottom: 20px;
        }

        .panel-body {
            padding-left: 20px;
            padding-right: 20px;
            background-color: #7a8288 !important;
        }

        .panel, table {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        #MainContent_Label1 {
            font-weight: bold;
            font-size: 20px;
            color: white !important;
        }
    </style>
    <div class="jumbotron container1">
        <div class="container">
            <div class="row">


                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4>Add New Inventory Item</h4>
                    </div>

                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:DetailsView ID="addInvForm" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="invInsertDS" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="addInvForm_ItemInserted">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="Quantity" SortExpression="invQuantity">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("invQuantity") %>'></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="text-danger" runat="server" ErrorMessage="Only Integers Accepted" ControlToValidate="txtQty" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Size" SortExpression="invSize">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtSize" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="text-danger" runat="server" ControlToValidate="txtSize" ErrorMessage="Invalid Size (Ex. 5.2)" ValidationExpression="(^(\d*\.?\d*)$)"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="invMeasure" HeaderText="Measure/Unit" SortExpression="invMeasure" />
                                <asp:TemplateField HeaderText="Price" SortExpression="invPrice">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("invPrice") %>'></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" class="text-danger" runat="server" ControlToValidate="txtPrice" ErrorMessage="Invalid Price (Ex. 45.99)" ValidationExpression="(^(\d*\.?\d*)$)"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product to Link" SortExpression="productID">

                                    <InsertItemTemplate>
                                        <strong>Please select a product from list</strong><br />
                                        <asp:TextBox ID="txtProdLink" Enabled="false" runat="server" Text='<%# Bind("productID") %>'></asp:TextBox>

                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtProdLinkName" Enabled="false" runat="server" Text=''></asp:TextBox>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <br />
                                        <asp:Button ID="btnConfirmAddInv" class="btn btn-success" Enabled="false" runat="server" CausesValidation="True" CommandName="Insert" Text="Accept & Create"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;<asp:Button ID="btnCancelInv" class="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;
                                        <asp:Button ID="btnBack" class="btn btn-default" runat="server" CausesValidation="False" Text="Back" OnClick="btnBack_Click"></asp:Button>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <br />
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4>Assign Product To Inventory</h4>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <asp:Button ID="btnAddProd" class="btn btn-success" runat="server" Text="&#10133; Create New Prod" OnClick="btnAddProd_Click" />
                        </div>
                        <div class="row" runat="server" id="addProdRow" visible="false">

                            <div class="col-sm-3">
                                <asp:Label ID="lblProdName" runat="server" Text="Product Name"></asp:Label><br />
                                <asp:TextBox ID="txtProdName" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-sm-3">
                                <asp:Label ID="lblProdDesc" runat="server" Text="Description"></asp:Label><br />
                                <asp:TextBox ID="txtProdDesc" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-sm-3">
                                <asp:Label ID="lblProdBrand" runat="server" Text="Brand"></asp:Label><br />
                                <asp:TextBox ID="txtProdBrand" runat="server"></asp:TextBox>

                            </div>
                            <div class="col-sm-3">
                                <asp:Button ID="btnConfirmAddProd" class="btn btn-success" runat="server" Text="&#10133; Confirm New Prod" OnClick="btnConfirmAddProd_Click" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="nav nav-pills">
                                    <li><a>Products Not in Inventory<span class="badge">!</span></a></li>
                                </ul>
                            </div>
                            <div class="col-md-6 text-right">
                                <asp:Label runat="server" class="label label-default">Items per page: </asp:Label>

                                <asp:DropDownList ID="ddlItems" Style="color: #000" runat="server" OnSelectedIndexChanged="ddlItems_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="15">15</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="row">


                            <asp:GridView ID="prodGdVw" runat="server" class="table table-striped table-hover" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ProdNotinInvDS" OnSelectedIndexChanged="prodGdVw_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="Product No." InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
                                    <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                                    <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                                </Columns>
                            </asp:GridView>


                        </div>
                    </div>
                    <asp:ObjectDataSource ID="invInsertDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.InvByIDCRUDTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="Param1" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="invQuantity" Type="Int32" />
                            <asp:Parameter Name="invSize" Type="Decimal" />
                            <asp:Parameter Name="invMeasure" Type="String" />
                            <asp:Parameter Name="invPrice" Type="Decimal" />
                            <asp:Parameter Name="productID" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ProdNotinInvDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasReadDSTableAdapters.ProductNotInInvTableAdapter"></asp:ObjectDataSource>
                </div>



            </div>
        </div>
    </div>
</asp:Content>
