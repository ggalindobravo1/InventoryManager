using emmaLibrary;
using emmaLibrary.EmmasReadDSTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emmaWebApp
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022

    // 
    // Project Developed using Object Data Source and disconnected architecture with Data Sets.
    // login info: ggalindo pass:123456
    // Last code Update: Dec 14th, 2022
    public partial class _Default : Page
    {
        //create static DS for lookup tables for Cust, Inv and Orders
        public static EmmasReadDS dsCIO;
        static _Default()
        {
            LoadTablesinMemory();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated && Session["User"] != null)
            {
                btnLog.Text = $"Logout";
                //Enable access to the business links
                btnRegister.Visible = true;
                rowCards.Visible = true;
                if (!IsPostBack)
                {
                    topCustTable.Sort("Total Sale", SortDirection.Ascending);
                }
            }
            
        }

        public static void LoadTablesinMemory()
        {
            try
            {
                dsCIO = new EmmasReadDS();
                dsCIO.Clear();
                CustomerListTableAdapter custList = new CustomerListTableAdapter();
                InventoryListTableAdapter invList = new InventoryListTableAdapter();
                ReceiptListTableAdapter ordList = new ReceiptListTableAdapter();

                custList.Fill(dsCIO.CustomerList);
                invList.Fill(dsCIO.InventoryList);
                ordList.Fill(dsCIO.ReceiptList);

                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message); ;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            if (btnLog.Text == "Logout")
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                authenticationManager.SignOut();
                btnLog.Text = "Start Session";
                Session["User"] = null;
                Response.Redirect("~/Default.aspx");
            }
            else
                Response.Redirect("~/Authentication/Login.aspx");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Authentication/Registration.aspx");
        }

        protected void topCustTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (topCustTable.SelectedIndex != -1)
            {
                //save sensible information in Storage
                int custID = (int)topCustTable.SelectedValue;
                Session["custID"] = custID;

                //pass data using query strings
                GridViewRow row = topCustTable.SelectedRow;
                string name = row.Cells[2].Text.Split(' ')[0];
                string lname = row.Cells[2].Text.Split(' ')[1];
                Response.Redirect($"~/Pages/Clients/ClientDetails.aspx?Last={lname}&First={name}");
            }
        }

  
    }
}