using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

       
        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("login.aspx");
        }
        
    }
}