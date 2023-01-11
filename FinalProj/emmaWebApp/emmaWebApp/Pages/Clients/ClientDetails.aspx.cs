using emmaLibrary;
using emmaLibrary.EmmasReadDSTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emmaWebApp.Pages.Clients
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class ClientDetails : System.Web.UI.Page
    {
        private int custID { get;set;}
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Authentication/Login.aspx");
            }

            //Obtain query strings pass to the page
            this.custID = Convert.ToInt32(Session["custID"]);
                //Label1.Text = this.custID.ToString();
                //custName.InnerText = Request.QueryString["Last"] + ", " + Request.QueryString["First"];

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
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

        protected void OrderdByCustTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Label1.Text = OrderdByCustTable.SelectedValue.ToString();
            GridViewRow row = OrderdByCustTable.SelectedRow;
            //pass data using query strings  
            Session["orderID"] = OrderdByCustTable.SelectedValue;
            Response.Redirect($"~/Pages/Orders/OrderDetails.aspx?OrderNo={row.Cells[2].Text}&Total={row.Cells[7].Text}");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect($"ClientsList.aspx");
        }

        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Pages/Orders/OrderAdd.aspx");
        }
    }
}