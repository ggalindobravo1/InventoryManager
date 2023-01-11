using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emmaWebApp.Pages.Inventory
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class InventoryList : System.Web.UI.Page
    {
        //private static property to store all inventoryTable list
        private static DataTable dt { get; set; }

        //private individual property to store sorted/filtered table 
        private DataTable dtSorted { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Authentication/Login.aspx");
            }
            try
            {
                //retrieve inventory Data from memory
                dt = _Default.dsCIO.InventoryList;
                //rename columns for readability
                dt.Columns[0].ColumnName = "ID";
                dt.Columns[1].ColumnName = "Product";
                dt.Columns[2].ColumnName = "Quantity";
                dt.Columns[3].ColumnName = "Brand";
                dt.Columns[4].ColumnName = "Unit Price";
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            if (!IsPostBack)
            {
                //load data in GridView only on first render, not postback reload
                dtSorted = dt;
                SetAndAssignDT();

            }
        }

        protected void inventoryTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            Label1.Text = "";

            //if not filtered table saved in session assign original inventory table
            if (Session["dtSorted"] == null)
                dtSorted = dt;
            else
                dtSorted = (DataTable)Session["dtSorted"]; //get the latest filtered table from session

            //set index page to start
            inventoryTable.PageIndex = 0;
            //Sort the data.
            dtSorted.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            SetAndAssignDT();
        }

        protected void inventoryTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (inventoryTable.SelectedIndex != -1)
            {
                //save sensible information in Storage
                int invID = (int)inventoryTable.SelectedValue;
                Session["invID"] = invID;

                ClearSortedDT();
                //pass data using query strings
                GridViewRow row = inventoryTable.SelectedRow;
                Response.Redirect($"InventoryDetails.aspx?Product={row.Cells[2].Text}&Brand={row.Cells[4].Text}");
            }
        }


        protected void btnAddInv_Click(object sender, EventArgs e)
        {
            Response.Redirect("InventoryAdd.aspx");
        }

        protected void btnSearchInv_Click(object sender, EventArgs e)
        {
            try
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
            catch (Exception ex)
            {
                Label1.Text = "Something went wrong! " + ex.InnerException ;
            }
        }
        protected void inventoryTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            inventoryTable.DataSource = (DataTable)Session["dtSorted"];
            inventoryTable.PageIndex = e.NewPageIndex;
            inventoryTable.DataBind();
            HideIDColumn();
        }

        private string GetCriteria()
        {
            string filters = "";

            //filters = txtSearch.Text.Length > 0 ? $" FirstName LIKE '%{txtSearch.Text}%'" : "";
            if (txtSearch.Text.Length > 0)
            {
                filters += $" Product LIKE '%{txtSearch.Text}%'"
                 + $" OR Brand LIKE '%{txtSearch.Text}%'";
            }

            return filters;
        }


        private void HideIDColumn()
        {
            inventoryTable.HeaderRow.Cells[1].Visible = false;
            foreach (GridViewRow grow in inventoryTable.Rows)
            {
                grow.Cells[1].Visible = false;
            }

        }

        private void SetAndAssignDT()
        {
            Session["dtSorted"] = dtSorted;
            inventoryTable.DataSource = dtSorted;
            inventoryTable.DataBind();
            HideIDColumn();
        }

        private void ClearSortedDT()
        {
            Session["dtSorted"] = null;
            Label1.Text = "";
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

    
    }
}