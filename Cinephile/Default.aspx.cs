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
            var homepageMovies = dbContext.Movies.OrderBy(m => new Guid()).Take(3).ToList();

            //List<Movie> homepageMovies = new List<Movie>() { 
            //    new Movie()
            //    {
            //        Title = "Gone girl",
            //        PosterPath = "~/Images/gone-girl-poster.jpg"
            //    },
            //    new Movie()
            //    {
            //        Title = "Airplane",
            //        PosterPath = "~/Images/airplane-poster.png"
            //    },
            //    new Movie()
            //    {
            //        Title = "The Dark Knight",
            //        PosterPath = "~/Images/the-dark-knight-poster.jpg"
            //    }
            //};

            HomeMoviesRepeater.DataSource = homepageMovies;
            HomeMoviesRepeater.DataBind();
        }

        protected void SearchSubmitBtn_Click(object sender, EventArgs e)
        {
            //... Go to movies page and display only ones matching searched pattern from HomeSearchBox
            Response.Redirect("~/Movies.aspx?search=" + HomeSearchBox.Text);
        }
    }
}