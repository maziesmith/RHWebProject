using RHWebProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RHWebProject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "";
        }

        protected void submitbtnId_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Label1.Text = "Page is valid.";
            }
            else
            {
                Label1.Text = "Page is not valid.";
            }

            ScriptManager.RegisterOnSubmitStatement(this, this.GetType(),"myHandlerKey", "clientSideFunction()");
            string firstName = TextBox1.Text;
            string lastName = TextBox2.Text;
            DateTime dateOfBirth = Convert.ToDateTime(TextBox3.Text);
            string emailAddress = TextBox4.Text;


            // insert
            using (var db = new PeopleEntities())
            {
                var people = db.Set<Person>();
                people.Add(new Person {FirstName = firstName, LastName =lastName, DateOfBirth = dateOfBirth, EmailAddress = emailAddress});
                db.SaveChanges();
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                DateTime.ParseExact(args.Value, "m/d/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo);
                args.IsValid = true;
            }
            catch
            {
                args.IsValid = false;
            }
        }

    }
}