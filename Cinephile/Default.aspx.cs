using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cinephile.Data;

namespace Cinephile
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinephileDbEntities dbContext = new CinephileDbEntities();
            var homwpageMovies = dbContext.Movies.OrderBy(m => new Guid()).Take(3).ToList();

            HomeMoviesRepeater.DataSource = homwpageMovies;
            HomeMoviesRepeater.DataBind();
        }
    }
}