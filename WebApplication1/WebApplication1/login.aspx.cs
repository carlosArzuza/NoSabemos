using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            String adPath = "LDAP://190.109.185.139/DC=TECNO,DC=local"; //direccion del dominio
            FormsAuth.LdapAuthentication adAuth = new FormsAuth.LdapAuthentication(adPath);
            try
            {
                if (true == adAuth.IsAuthenticated(TextUser.Text, TextPass.Text))
                {
                    String groups = adAuth.GetGroups();

                    //Create the ticket, and add the groups.
                    //bool isCookiePersistent = chkPersist.Checked;
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, TextUser.Text,
                    DateTime.Now, DateTime.Now.AddMinutes(60), false, groups);

                    //Encrypt the ticket.
                    String encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                    //Create a cookie, and then add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    //if(true == isCookiePersistent)
                    authCookie.Expires = authTicket.Expiration;

                    //Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    //You can redirect now.
                    Response.Redirect(FormsAuthentication.GetRedirectUrl(TextUser.Text, false));

                }
                else
                {
                    errorLabel.Text = "Verifique porfavor el usuario y contraseña";
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = "" + ex.Message;
            }
        }
         

        
       }
    }
