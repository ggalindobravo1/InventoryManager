<%@ Page Title="ClientAdd" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientAdd.aspx.cs" Inherits="emmaWebApp.Pages.Clients.ClientAdd" %>

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
        .panel-body{
            padding-left: 20px;
            padding-right: 20px;
            background-color: #7a8288 !important;
        }
        .panel, table{
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
                        <h4>Add New Customer</h4>
                    </div>

                    <div class="panel-body">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:DetailsView class="table table-striped table-hover" ID="addCustForm" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="customerInsertDS" DefaultMode="Insert" OnItemInserted="addCustForm_ItemInserted">
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="First Name" SortExpression="custFirst">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtFirst" runat="server" Text='<%# Bind("custFirst") %>'></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" class="text-danger" ControlToValidate="txtFirst" ErrorMessage="Customer First Name is required"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name" SortExpression="custLast">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtLast" runat="server" Text='<%# Bind("custLast") %>'></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" class="text-danger" ControlToValidate="txtLast" ErrorMessage="Customer Last Name is required"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" SortExpression="custPhone">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("custPhone") %>' Placeholder="10 digits"></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" class="text-danger" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address" SortExpression="custAddress">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtAddr" runat="server" Text='<%# Bind("custAddress") %>'></asp:TextBox>
                                        <br />
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="City" SortExpression="custCity">


                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("custCity") %>'></asp:TextBox>
                                        <br />
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Postal" SortExpression="custPostal">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtPostal" runat="server" Text='<%# Bind("custPostal") %>' Placeholder="6 characters"></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPostal" class="text-danger" ErrorMessage="Invalid Postal Code (L#L#L#)" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"></asp:RegularExpressionValidator>
                                        <br />
                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" SortExpression="custEmail">

                                    <InsertItemTemplate>
                                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("custEmail") %>'></asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" class="text-danger" ErrorMessage="E-mail not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" class="text-danger" ErrorMessage="E-mail required"></asp:RequiredFieldValidator>

                                    </InsertItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:Button ID="LinkButton1" class="btn btn-success" runat="server" CausesValidation="True" CommandName="Insert" Text="Accept & Create"></asp:Button>
                                        &nbsp; &nbsp; &nbsp; <asp:Button ID="LinkButton2" class="btn btn-default" runat="server" CausesValidation="False" Text="Cancel" OnClick="LinkButton2_Click"></asp:Button>
                                        &nbsp; &nbsp; &nbsp; <asp:Button ID="btnBack" class="btn btn-default" runat="server" CausesValidation="False" Text="Back" OnClick="btnBack_Click"></asp:Button>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>

                    </div>
                </div>
            </div>

            <asp:ObjectDataSource ID="customerInsertDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasCRUDDSTableAdapters.customerCRUDTableAdapter" UpdateMethod="Update">
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
                    <asp:Parameter Name="Param1" Type="Int32" DefaultValue="0" />
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

        </div>
    </div>

</asp:Content>
