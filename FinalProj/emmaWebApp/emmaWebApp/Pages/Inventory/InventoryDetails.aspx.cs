using System;
using System.Collections.Generic;
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
    public partial class InventoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void invDetVw_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Label1.Text = "&#9940; Unable to Update record" + e.Exception.InnerException;
            }
            else
            {
                Label1.Text = "&#x2705; &#x2705; Record Succesfully Updated";

                _Default.LoadTablesinMemory();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect($"InventoryList.aspx");
        }

        protected void btnSubQty_Click(object sender, EventArgs e)
        {
            TextBox txtQty = (TextBox)invDetVw.FindControl("txtQty");

            if(txtQty != null)
            {
                int qty = int.Parse(txtQty.Text);
                txtQty.Text = (qty - 1).ToString();
            }
        }

        protected void btnPlusQty_Click(object sender, EventArgs e)
        {
            TextBox txtQty = (TextBox)invDetVw.FindControl("txtQty");

            if (txtQty != null)
            {
                int qty = int.Parse(txtQty.Text);
                txtQty.Text = (qty + 1).ToString();
            }

        }

      




        //etrieve the return value of the invoked insert method on a objectdatasource
        //protected void ObjDS_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        //{
        //    int retvalue = Convert.ToInt32(e.ReturnValue);
        //}
    }
}