using emmaWebApp.Pages.Clients;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emmaWebApp.Pages.Orders
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class OrdersList : System.Web.UI.Page
    {
        //private static property to store all orders list
        private static DataTable dt { get; set; }

        //private individual property to store sorted/filtered table 
        private DataTable dtSorted { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Authentication/Login.aspx");
            }

            dt = _Default.dsCIO.ReceiptList;
            //rename columns for readability
            dt.Columns[0].ColumnName = "ID";
            dt.Columns[1].ColumnName = "Date";
            dt.Columns[2].ColumnName = "Customer";
            dt.Columns[3].ColumnName = "Employee";
            dt.Columns[4].ColumnName = "Payment";
            dt.Columns[5].ColumnName = "OrderNo";
            dt.Columns[6].ColumnName = "Totals";

            if (!IsPostBack)
            {
                //load data in GridView only on first render, not by postback reload
                dtSorted = dt;
                SetAndAssignDT();
            }
        }

        protected void OrdersTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            Label1.Text = "";

            //if not filtered table saved in session assign original customer table
            if (Session["dtSorted"] == null)
                dtSorted = dt;
            else
                dtSorted = (DataTable)Session["dtSorted"]; //get the latest filtered table from session

            //set index page to start
            OrdersTable.PageIndex = 0;
            //Sort the data.
            dtSorted.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            SetAndAssignDT();

        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (OrdersTable.SelectedIndex != -1)
            {
                //save sensible information in Storage
                int orderID = (int)OrdersTable.SelectedValue;
                Session["orderID"] = orderID;

                ClearSortedDT();
                //pass data using query strings
                GridViewRow row = OrdersTable.SelectedRow;
                Response.Redirect($"OrderDetails.aspx?OrderNo={row.Cells[6].Text}&Total={row.Cells[7].Text}");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (dt != null)
            {
                string criteria = GetCriteria();
                DataRow[] rows = criteria.Length > 0 ? dt.Select(criteria) : dt.Select();
                Label1.Text = $"{rows.Length} Results Found!";
                //If search result is 0, use main table
                dtSorted = rows.Length > 0 ? rows.CopyToDataTable() : dt;
                SetAndAssignDT();
            }
        }
        protected void OrdersTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            OrdersTable.DataSource = (DataTable)Session["dtSorted"];
            OrdersTable.PageIndex = e.NewPageIndex;
            OrdersTable.DataBind();
            HideIDColumn();

        }
        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect($"OrderAdd.aspx");
        }

        private string GetCriteria()
        {
            string filters = "";

            
            if (txtSearch.Text.Length > 0)
            {
                filters += $" Customer LIKE '%{txtSearch.Text}%'"
                        + $" OR Employee LIKE '%{txtSearch.Text}%'"
                        + $" OR Payment LIKE '{txtSearch.Text}'"
                        + $" OR OrderNo LIKE '{txtSearch.Text}'";
            }

            return filters;
        }

        private string GetSortDirection(string column)
        {

            // By default, set the sort direction to ascending.
            string sortDirection = "ASC";

            // Retrieve the last column that was sorted.
            string sortExpression = ViewState["SortExpression"] as string;

            if (sortExpression != null)
            {
                // Check if the same column is being sorted.
                // Otherwise, the default value can be returned.
                if (sortExpression == column)
                {
                    string lastDirection = ViewState["SortDirection"] as string;
                    if ((lastDirection != null) && (lastDirection == "ASC"))
                    {
                        sortDirection = "DESC";
                    }
                }
            }

            // Save new values in ViewState.
            ViewState["SortDirection"] = sortDirection;
            ViewState["SortExpression"] = column;

            return sortDirection;
        }

        private void SetAndAssignDT()
        {
           
            Session["dtSorted"] = dtSorted;
            OrdersTable.DataSource = dtSorted;
            OrdersTable.DataBind();
            HideIDColumn();
        }

        private void HideIDColumn()
        {
            OrdersTable.HeaderRow.Cells[1].Visible = false;
            foreach (GridViewRow grow in OrdersTable.Rows)
            {
                grow.Cells[1].Visible = false;
            }

        }

        private void ClearSortedDT()
        {
            Session["dtSorted"] = null;
            Label1.Text = "";
        }



    }
}