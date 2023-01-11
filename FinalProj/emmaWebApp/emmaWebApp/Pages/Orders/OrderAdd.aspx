<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderAdd.aspx.cs" Inherits="emmaWebApp.Pages.Orders.OrderAdd" %>

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

        select {
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
                        <h4>Add New Order</h4>
                    </div>

                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:DetailsView ID="OrderDetVw" class="table table-striped table-hover" runat="server" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="ReceiptByIDDS" Height="136px" Width="572px" OnItemInserted="OrderDetVw_ItemInserted">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                                <asp:TemplateField HeaderText="ordDate" SortExpression="ordDate">
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtDateOrder" Enabled="False" runat="server" Text='<%# Bind("ordDate") %>'></asp:TextBox>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ordPaid" SortExpression="ordPaid">
                                    <InsertItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ordPaid") %>' />
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payment" SortExpression="paymentID">

                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PaymentDS" DataTextField="payType" DataValueField="id" Height="23px" SelectedValue='<%# Bind("paymentID") %>' Width="187px">
                                        </asp:DropDownList>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer" SortExpression="custID">

                                    <InsertItemTemplate>
                                        <asp:Button ID="btnAddCust" class="btn btn-success" runat="server" Visible="true" OnClick="btnAddCust_Click" Text="&#10133; Create New Client" Width="200px" />
                                        <br />
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CustDS" DataTextField="custFull" DataValueField="id" Height="40px" SelectedValue='<%# Bind("custID") %>' Width="200px">
                                        </asp:DropDownList>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee" SortExpression="empID">

                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="EmpDS" DataTextField="empFull" DataValueField="id" Height="31px" SelectedValue='<%# Bind("empID") %>' Width="210px">
                                        </asp:DropDownList>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:BoundField DataField="paymentID" HeaderText="paymentID" SortExpression="paymentID" Visible="False" />
                                <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" Visible="False" />
                                <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" Visible="False" />
                                <asp:TemplateField ShowHeader="False"></asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="LinkButton1" class="btn btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Accept & Create"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;
                                <asp:Button ID="LinkButton2" class="btn btn-default" runat="server" CausesValidation="False" Text="Cancel" OnClick="LinkButton2_Click"></asp:Button>
                                        &nbsp; &nbsp; &nbsp;
                                <asp:Button ID="btnBack" class="btn btn-default" runat="server" CausesValidation="False" Text="Back" OnClick="btnBack_Click"></asp:Button>

                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
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
                        <asp:Parameter Name="Param1" Type="Int32" />
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

                <asp:ObjectDataSource ID="PaymentDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.paymentTableAdapter"></asp:ObjectDataSource>

                <asp:ObjectDataSource ID="EmpDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.employeeTableAdapter"></asp:ObjectDataSource>

                <asp:ObjectDataSource ID="CustDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.CustByRecTableAdapter"></asp:ObjectDataSource>

            </div>
        </div>
    </div>
</asp:Content>
