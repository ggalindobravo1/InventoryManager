using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using emmaLibrary;
using emmaLibrary.EmmasCRUDDSTableAdapters;
using System.Data.SqlClient;

namespace emmaWebApp.Pages.Inventory
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022

    public partial class InventoryAdd : System.Web.UI.Page
    {
        private EmmasCRUDDS dsCRUD = new EmmasCRUDDS();
 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProd_Click(object sender, EventArgs e)
        {
            addProdRow.Visible = true;
            btnAddProd.Visible = false;

        }

        protected void btnConfirmAddProd_Click(object sender, EventArgs e)
        {
            try
            {
                // Create product Mannually
                ProductCRUDTableAdapter daProduct = new ProductCRUDTableAdapter();
                daProduct.Fill(dsCRUD.ProductCRUD);
                string prodName = txtProdName.Text;
                int count = daProduct.Insert(txtProdName.Text, txtProdDesc.Text, txtProdBrand.Text);
                dsCRUD.AcceptChanges();
                Label1.Text = $"&#x2705;  {count} Product Created!";
                
                //Dsiplay the last inserted objects at the top of the table
                prodGdVw.PageIndex = 0;
                prodGdVw.Sort("id", SortDirection.Descending);

                //hide insert inputs
                txtProdName.Text = txtProdDesc.Text = txtProdBrand.Text = "";
                addProdRow.Visible = false;
                btnAddProd.Visible = true;

            }
            catch (Exception ex)
            {   
                Label1.Text = ex.Message;
            }
        }

        protected void prodGdVw_SelectedIndexChanged(object sender, EventArgs e)
        {
           // Write the selected product ID to the inventory form
            TextBox prodID = (TextBox)addInvForm.FindControl("txtProdLink");
            prodID.Text = prodGdVw.SelectedValue.ToString();
            TextBox prodName = (TextBox)addInvForm.FindControl("txtProdLinkName");
            prodName.Text = prodGdVw.SelectedRow.Cells[2].Text;
            Button btnConfirmInv = (Button)addInvForm.FindControl("btnConfirmAddInv");
            btnConfirmInv.Enabled = true;


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect($"InventoryList.aspx");
        }

        protected void addInvForm_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
           
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Label1.Text = "&#9940; Unable to Save record" + e.Exception.InnerException;
            }
            else
            {
                Label1.Text = "&#x2705; &#x2705; Record Succesfully Saved";

                //reload fresh tables in memory
                _Default.LoadTablesinMemory();
                prodGdVw.Sort("id", SortDirection.Ascending);

            }
        }

        protected void ddlItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            prodGdVw.PageSize = int.Parse(ddlItems.SelectedValue);
          
            
        }
    }
}