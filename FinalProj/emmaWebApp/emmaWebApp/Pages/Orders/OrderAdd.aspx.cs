using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace emmaWebApp.Pages.Orders
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class OrderAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox txtDate = (TextBox)OrderDetVw.FindControl("txtDateOrder");
                if (txtDate != null)
                {
                    DateTime today = DateTime.Today; // As DateTime
                    txtDate.Text = today.ToString("yyyy/MM/dd");
                }


            }

        }

        protected void OrderDetVw_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Label1.Visible = true;

           // Label1.Text = $"PayID={ddl1.SelectedValue} custID={ddl2.SelectedValue}  empID={ddl3.SelectedValue} ";

            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Label1.Text += "&#9940; Unable to Save record" + e.Exception.InnerException;
            }
            else
            {
                Label1.Text += "&#x2705; &#x2705; Record Succesfully Saved";

                _Default.LoadTablesinMemory();

            }
        }

        protected void btnAddCust_Click(object sender, EventArgs e)
        {
            Response.Redirect($"~/Pages/Clients/ClientAdd.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //cancel button to refresh page
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect($"OrdersList.aspx");
        }
    }
}