using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Threading.Tasks;
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
    public partial class ClientAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Authentication/Login.aspx");
            }
            Label1.Visible = false;
           // addCustForm.ChangeMode(DetailsViewMode.Insert); // adding default mode in html

        }

        protected void addCustForm_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Label1.Visible = true;
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            //cancel button to refresh page
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

      

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect($"ClientsList.aspx");
        }
    }
}