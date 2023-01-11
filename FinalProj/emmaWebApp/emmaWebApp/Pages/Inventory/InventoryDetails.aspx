<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryDetails.aspx.cs" Inherits="emmaWebApp.Pages.Inventory.InventoryDetails" %>

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
            width: 75% !important;
            margin-left: auto;
            margin-right: auto;
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

        .panel, table {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .row {
            margin-bottom: 20px;
        }

        .panel-body {
            padding-left: 20px;
            padding-right: 20px;
            background-color: #7a8288 !important;
        }

        #MainContent_Label1 {
            font-weight: bold;
            font-size: 20px;
            color: white !important;
        }
        select{
            background-color: #FFF;
            color: #000000;
            width: 200px;

        }
    </style>
       
    <div class="jumbotron container1">
        <div class="container">
            <div class="row">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4>Product:  <%=Request.QueryString["Product"]%> </h4>
                        <h4>Brand: <%=Request.QueryString["Brand"]%></h4>
                    </div>

                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                         <br />
                      
                                <asp:DetailsView ID="invDetVw" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="InvDetailsDS" Height="50px" Width="527px" OnItemUpdated="invDetVw_ItemUpdated">
                                    <Fields>
                                        <asp:BoundField DataField="id" HeaderText="Inventory ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:TemplateField HeaderText="Quantity" SortExpression="invQuantity">
                                            <EditItemTemplate>
                                                <asp:Button ID="btnSubQty" class="btn btn-warning" runat="server" Text="&#10134;" OnClick="btnSubQty_Click" />
                                                <asp:TextBox Enabled="false" ID="txtQty" runat="server" Text='<%# Bind("invQuantity") %>'></asp:TextBox>
                                                <asp:Button ID="btnPlusQty" class="btn btn-warning" runat="server" Text="&#10133;" OnClick="btnPlusQty_Click" />
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invQuantity") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("invQuantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" SortExpression="invSize">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="tztSize" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" class="text-danger" ControlToValidate="tztSize" ErrorMessage="Not a Valid Number" ValidationExpression="(^(\d*\.?\d*)$)"></asp:RegularExpressionValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("invSize") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("invSize") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Measure" SortExpression="invMeasure">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtMeasure" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                                                <br />
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("invMeasure") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("invMeasure") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit Sales Price" SortExpression="invPrice">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("invPrice") %>'></asp:TextBox>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="text-danger" runat="server" ControlToValidate="txtPrice" ErrorMessage="Not a Valid Number" ValidationExpression="(^(\d*\.?\d*)$)"></asp:RegularExpressionValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("invPrice") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("invPrice") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product ID" SortExpression="productID">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblProdIDEdit" runat="server" Text='<%# Bind("productID") %>'></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblProdIDView" runat="server" Text='<%# Bind("productID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product" SortExpression="productID">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                      
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodName" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Brand" SortExpression="productID">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList3" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodBrand" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropDownList4" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodBrand" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prod. Description" SortExpression="productID">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList5" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodDescription" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropDownList6" Enabled="false" runat="server" DataSourceID="ProductDS" DataTextField="prodDescription" DataValueField="id" SelectedValue='<%# Bind("productID") %>'>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:Button ID="LinkButton1" class="btn btn-success" runat="server" CausesValidation="True" CommandName="Update" Text="Save Changes &#x2705;"></asp:Button>
                                                &nbsp; &nbsp; &nbsp;<asp:Button ID="LinkButton2" class="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="btnEdit" runat="server" class="btn btn-warning" CausesValidation="False" CommandName="Edit" Text="Edit Inventory &#9997;"></asp:Button>
                                                &nbsp; &nbsp; &nbsp;
                                                <asp:Button ID="btnBack" runat="server" CausesValidation="False" class="btn btn-default" OnClick="btnBack_Click" Text="Back" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <br />
                        
                        <br />

                    </div>
                </div>

            </div>

            <div class="row" runat="server" id="browseProduct" visible="false">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4 class="float-sm-start">Product List</h4>
                    </div>
                    <div class="panel-body">

                      

                    </div>
                    <asp:ObjectDataSource ID="InvDetailsDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.InvByIDCRUDTableAdapter" UpdateMethod="Update">
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
                            <asp:SessionParameter Name="Param1" SessionField="invID" Type="Int32" />
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
                    <asp:ObjectDataSource ID="ProductDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.ProductCRUDTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="prodName" Type="String" />
                            <asp:Parameter Name="prodDescription" Type="String" />
                            <asp:Parameter Name="prodBrand" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="prodName" Type="String" />
                            <asp:Parameter Name="prodDescription" Type="String" />
                            <asp:Parameter Name="prodBrand" Type="String" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>


               

               
            </div>
        </div>
    </div>

</asp:Content>
