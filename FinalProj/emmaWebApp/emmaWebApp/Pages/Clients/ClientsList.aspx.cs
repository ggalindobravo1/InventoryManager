using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using emmaLibrary;

namespace emmaWebApp.Pages.Clients
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class ClientsList : System.Web.UI.Page
    {
        //private static property to store all Customers list
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
                //retrieve customer Data from memory
                dt = _Default.dsCIO.CustomerList;
                //rename columns for readability
                dt.Columns[0].ColumnName = "ID";
                dt.Columns[1].ColumnName = "LastName";
                dt.Columns[2].ColumnName = "FirstName";
                dt.Columns[3].ColumnName = "Phone";
                dt.Columns[4].ColumnName = "Email";
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

        protected void customersTable_Sorting(object sender, GridViewSortEventArgs e)
        {
            Label1.Text = "";

            //if not filtered table saved in session assign original customer table
            if (Session["dtSorted"] == null) 
                dtSorted = dt;
            else
                dtSorted = (DataTable)Session["dtSorted"]; //get the latest filtered table from session
            
            //set index page to start
            customersTable.PageIndex = 0;
            //Sort the data.
            dtSorted.DefaultView.Sort = e.SortExpression + " " + GetSortDirection(e.SortExpression);
            SetAndAssignDT();
        }

        protected void customersTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (customersTable.SelectedIndex != -1)
            {
                //save sensible information in Storage
                int custID = (int)customersTable.SelectedValue;
                Session["custID"] = custID;

                ClearSortedDT();
                //pass data using query strings
                GridViewRow row = customersTable.SelectedRow;
                Response.Redirect($"ClientDetails.aspx?Last={row.Cells[2].Text}&First={row.Cells[3].Text}");
            }
        }

        protected void btnAddCust_Click(object sender, EventArgs e)
        {
            Response.Redirect($"ClientAdd.aspx");
        }

        protected void btnSearchClient_Click(object sender, EventArgs e)
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
        protected void customersTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            customersTable.DataSource = (DataTable)Session["dtSorted"];
            customersTable.PageIndex = e.NewPageIndex;
            customersTable.DataBind();
            HideIDColumn();
        }

        private string GetCriteria()
        {
            string filters = "";

            //filters = txtSearch.Text.Length > 0 ? $" FirstName LIKE '%{txtSearch.Text}%'" : "";
            if(txtSearch.Text.Length > 0)
            {
                filters += $" LastName LIKE '%{txtSearch.Text}%'"
                    + $" OR FirstName LIKE '%{txtSearch.Text}%'"
                    + $" OR Phone LIKE '%{txtSearch.Text}%'"
                    +$" OR Email LIKE '%{txtSearch.Text}%'";
            }

            return filters;
        }
        private void HideIDColumn()
        {
            customersTable.HeaderRow.Cells[1].Visible = false;
            foreach (GridViewRow grow in customersTable.Rows)
            {
                grow.Cells[1].Visible = false;
            }

        }

        private void SetAndAssignDT()
        {
            Session["dtSorted"] = dtSorted;
            customersTable.DataSource = dtSorted;
            customersTable.DataBind();
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