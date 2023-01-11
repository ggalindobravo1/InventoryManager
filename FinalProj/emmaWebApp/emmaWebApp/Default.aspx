<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="emmaWebApp._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
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
    </style>


    <div class="jumbotron">
        <h2>Emma Small Engines</h2>
        <p class="lead">Manage your Customers, Sales Orders, Inventory and Products from one system!</p>
       <div style="display: flex; justify-content: center;">
            <asp:Image ID="Image1" runat="server" Style="width: 350px; margin: auto auto;" ImageUrl="~/Images/analysis.png" />
        </div>
        
        <br />
        <asp:Button runat="server" ID="btnLog" class="btn btn-primary btn-lg" Visible="True" OnClick="Logout_Click" Text="Start Session" />
        <asp:Button runat="server" ID="btnRegister" class="btn btn-default btn-lg" Visible="False" CausesValidation="False" Text="Register New" OnClick="btnRegister_Click" />
    </div>
    <div class="equal">
        <div class="row" runat="server" id="rowCards" visible="false">
            <div class="col-md-6">
                <h2>Top 3 Customers</h2>
                <p>
                    Find your most loyal customers ever.
                </p>
               <div>

                    <asp:Chart ID="topCustChart" runat="server" DataSourceID="TopCustomersDS" Width="484px">
                        <Series>
                            <asp:Series ChartType="Bar" Name="Series1" XValueMember="Customer" YValueMembers="Total Sale" Legend="Customer">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisY Title="Sale ($)" TitleForeColor="#000000" Interval="20">
                                    <MajorGrid Enabled="true" />
                                </AxisY>
                                <AxisX Title="Customer" IsLabelAutoFit="True" TitleForeColor="#000000">
                                    <MajorGrid Enabled="true" />
                                </AxisX>
                            </asp:ChartArea>
                        </ChartAreas>

                    </asp:Chart>


                </div>
            </div>
            <div class="col-md-6">
                <h2>View Details</h2>
                <p>
                    Find out more about your most valuable customers.
                </p>
                <br />
                <asp:GridView ID="topCustTable" DataKeyNames="Customer ID" class="table table-striped table-hover" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="TopCustomersDS" OnSelectedIndexChanged="topCustTable_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Total Sale" HeaderText="Total Sale" ReadOnly="True" SortExpression="Total Sale" />
                        <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" />
                        <asp:BoundField DataField="Customer ID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="Customer ID" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
    <div>

        <asp:ObjectDataSource ID="TopCustomersDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasReadDSTableAdapters.Top3CustomerTableAdapter"></asp:ObjectDataSource>

        <asp:ObjectDataSource ID="InventoryChartDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="emmaLibrary.EmmasReadDSTableAdapters.InventoryListTableAdapter"></asp:ObjectDataSource>

    </div>

</asp:Content>
