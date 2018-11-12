using RHWebProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RHWebProject
{
    public partial class About : Page
    {
        public List<Person> GetPeople()
        {
            using (PeopleEntities entities = new PeopleEntities())
            {
                return (from pers in entities.People
                        select pers)
                            .OrderBy(pers => pers.PersonId)
                            .ToList();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Person> allPerson = GetPeople();
            GridView1.DataSource = allPerson;
            GridView1.DataBind();
        }
    }
}