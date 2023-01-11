using System;
using System.Collections.Generic;
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
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = "Order ID = " + Session["orderID"].ToString();
            //Label1.Text += " Order No. = " + Request.QueryString["OrderNo"].ToString();
        }

        protected void OrderDetVw_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
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
            Response.Redirect($"OrdersList.aspx");
        }
    }
}