using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using emmaLibrary;
using emmaLibrary.EmmasReadDSTableAdapters;
using System.Security.Principal;
using Microsoft.AspNet.Identity;

namespace emmaWebApp
{
    public partial class SiteMaster : MasterPage
    {
  
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["User"] != null)
            {
                lnkLogout.Text = $"Logout {Session["User"]}";
            }
            else
            {
                lnkLogout.Text = "Login";
                custLnk.Visible = invLnk.Visible = ordLnk.Visible = false;
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            
            if (Session["User"] != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                authenticationManager.SignOut();
                Session["User"] = null;
                Response.Redirect("~/Default.aspx");
            }
            else
                Response.Redirect("~/Authentication/Login.aspx");
        }


    }
}