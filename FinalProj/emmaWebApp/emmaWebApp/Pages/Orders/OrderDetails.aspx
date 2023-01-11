<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="emmaWebApp.Pages.Orders.OrderDetails" %>

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
                        <h4>Order No.:  <%=Request.QueryString["OrderNo"]%> </h4>
                        <h4>Order Total: <%=Request.QueryString["Total"]%></h4>
                    </div>

                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:DetailsView ID="OrderDetVw" class="table table-striped table-hover" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ReceiptByIDDS" Height="136px" OnItemUpdated="OrderDetVw_ItemUpdated" Width="414px">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:TemplateField HeaderText="Order No." SortExpression="ordNumber">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" Enabled="false" runat="server" Text='<%# Bind("ordNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ordNumber") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ordNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date" SortExpression="ordDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" Enabled="false" runat="server" Text='<%# Bind("ordDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ordDate") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ordDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="ordPaid" HeaderText="Is Paid?" SortExpression="ordPaid" />
                                <asp:TemplateField HeaderText="Payment" SortExpression="paymentID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PaymentDS" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("paymentID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList Enabled="false" ID="DropDownList1" runat="server" DataSourceID="PaymentDS" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer" SortExpression="custID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CustDS" DataTextField="custFull" DataValueField="id" Height="37px" SelectedValue='<%# Bind("custID") %>' Width="203px">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("custID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="CustDS" DataTextField="custFull" DataValueField="id" Height="37px" SelectedValue='<%# Bind("custID") %>' Width="203px">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="EmpDS" DataTextField="empFull" DataValueField="id" Height="31px" SelectedValue='<%# Bind("empID") %>' Width="210px">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("empID") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList Enabled="false" ID="DropDownList3" runat="server" DataSourceID="EmpDS" DataTextField="empFull" DataValueField="id" Height="31px" SelectedValue='<%# Bind("empID") %>' Width="210px">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="paymentID" HeaderText="paymentID" SortExpression="paymentID" Visible="False" />
                                <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" Visible="False" />
                                <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="LinkButton1" class="btn btn-success" runat="server" CausesValidation="True" CommandName="Update" Text="Save Changes &#x2705;"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;<asp:Button ID="LinkButton2" class="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="LinkButton1" runat="server" class="btn btn-warning" CausesValidation="False" CommandName="Edit" Text="Edit Order &#9997;"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;
                                <asp:Button ID="btnBack" class="btn btn-default" runat="server" CausesValidation="False" Text="Back" OnClick="btnBack_Click"></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4 class="float-sm-start">Order Line</h4>
                    </div>
                    <div class="panel-body">

                        <asp:GridView ID="OrdLineGrid" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="RecpDetailsDS">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" Visible="False" />
                                <asp:CheckBoxField DataField="orlOrderReq" HeaderText="Order Req" SortExpression="orlOrderReq" />
                                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                                <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                                <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                                <asp:BoundField DataField="orlQuantity" HeaderText="Quantity" SortExpression="orlQuantity" />
                                <asp:BoundField DataField="orlPrice" HeaderText="Unit Price" ReadOnly="True" SortExpression="orlPrice" />
                                <asp:BoundField DataField="lineTotal" HeaderText="Line Total" ReadOnly="True" SortExpression="lineTotal" />
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>


                <asp:ObjectDataSource ID="ReceiptByIDDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.ReceiptByIDCRUDTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ordNumber" Type="String" />
                        <asp:Parameter Name="ordDate" Type="DateTime" />
                        <asp:Parameter Name="ordPaid" Type="Boolean" />
                        <asp:Parameter Name="paymentID" Type="Int32" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="empID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Param1" SessionField="orderID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ordNumber" Type="String" />
                        <asp:Parameter Name="ordDate" Type="DateTime" />
                        <asp:Parameter Name="ordPaid" Type="Boolean" />
                        <asp:Parameter Name="paymentID" Type="Int32" />
                        <asp:Parameter Name="custID" Type="Int32" />
                        <asp:Parameter Name="empID" Type="Int32" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="PaymentDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.paymentTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="EmpDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.employeeTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="CustDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.CustByRecTableAdapter"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="RecpDetailsDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.ReceiptDetailsTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="Param1" SessionField="orderID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
