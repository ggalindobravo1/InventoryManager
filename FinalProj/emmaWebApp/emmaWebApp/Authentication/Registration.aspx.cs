//PROG1210
//Vanscoy

//Registration Page for new users

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emmaWebApp.Authentication
{
    // NIAGARA COLLEGE CANADA
    // COMPUTER PROGRAMMING PROGRAM
    // Rapid Application Development 
    // Final Project 
    // Gustavo Galindo Bravo
    // Dec-2022
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = new IdentityUser(txtUser.Text);
            IdentityResult idResult = manager.Create(user, txtPass.Text);
            if (idResult.Succeeded)
            {
                this.lblMessage.Text = "&#x2705; &#x2705; New User " + user.UserName + " Created";
                //code for sign in a when newly created user
                //var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                //var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                //authenticationManager.SignIn(userIdentity);
                //Response.Redirect("~/Default.aspx");
                txtUser.Text = txtPass.Text = txtConfirm.Text = "";
            }
            else
            {
                this.lblMessage.Text = "Error: " + idResult.Errors.FirstOrDefault();
  
            }
        }
    }
}