<%@ Page Title="ClientDetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientDetails.aspx.cs" Inherits="emmaWebApp.Pages.Clients.ClientDetails" %>

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
    </style>

    <div class="jumbotron container1">
        <div class="container">
            <div class="row">

                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4>Customer Details:  <%=Request.QueryString["Last"]%>, <%=Request.QueryString["First"] %> </h4>
                    </div>
                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:DetailsView class="table table-striped table-hover" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="clientCRUDDS" OnItemUpdated="DetailsView1_ItemUpdated">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="custFirst" HeaderText="First Name" SortExpression="custFirst" />
                                <asp:BoundField DataField="custLast" HeaderText="Last Name" SortExpression="custLast" />
                                <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                                <asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
                                <asp:BoundField DataField="custCity" HeaderText="City" SortExpression="custCity" />
                                <asp:BoundField DataField="custPostal" HeaderText="Postal" SortExpression="custPostal" />
                                <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:Button ID="LinkButton1" class="btn btn-success" runat="server" CausesValidation="True" CommandName="Update" Text="Save Changes &#x2705;"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;<asp:Button ID="LinkButton2" class="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:Button>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="LinkButton1" runat="server" class="btn btn-warning" CausesValidation="False" CommandName="Edit" Text="Edit Customer &#9997;"></asp:Button>
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
                        <h4 class="float-sm-start">Orders Related </h4>
                    </div>
                    <div class="panel-body">
                        <asp:Button ID="btnAddOrder" class="btn btn-success" runat="server" Text="&#10133; Create Order" OnClick="btnAddOrder_Click" />
                        <br />
                        <br />
                        <asp:GridView class="table table-striped table-hover" ID="OrderdByCustTable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ReceiptByCustIdDS" OnSelectedIndexChanged="OrderdByCustTable_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="ordNumber" HeaderText="Order #" SortExpression="ordNumber" />
                                <asp:BoundField DataField="ordDate" HeaderText="Date" SortExpression="ordDate" />
                                <asp:CheckBoxField DataField="ordPaid" HeaderText="is Paid? " SortExpression="ordPaid" />
                                <asp:BoundField DataField="payType" HeaderText="Pay Type" SortExpression="payType" />
                                <asp:BoundField DataField="empName" HeaderText="Employee " ReadOnly="True" SortExpression="empName" />
                                <asp:BoundField DataField="Total" HeaderText="Total Order" ReadOnly="True" SortExpression="Total" />
                                <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>



            <asp:ObjectDataSource ID="clientCRUDDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.customerCRUDTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Param1" SessionField="custID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="custFirst" Type="String" />
                    <asp:Parameter Name="custLast" Type="String" />
                    <asp:Parameter Name="custPhone" Type="String" />
                    <asp:Parameter Name="custAddress" Type="String" />
                    <asp:Parameter Name="custCity" Type="String" />
                    <asp:Parameter Name="custPostal" Type="String" />
                    <asp:Parameter Name="custEmail" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>

            <asp:ObjectDataSource ID="ReceiptByCustIdDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasReadDSTableAdapters.ReceiptByCustIDTableAdapter">
                <SelectParameters>
                    <asp:SessionParameter Name="Param1" SessionField="custID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>

    </div>


</asp:Content>


