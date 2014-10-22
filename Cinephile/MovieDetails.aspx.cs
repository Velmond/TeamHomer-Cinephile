using Cinephile.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cinephile
{
    public partial class MovieDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();
            var movieId = Request.Params["Id"];
            // Warning: Possible n+1 queries problem
            var movie = db.Movies
                .Where(m => m.Id.ToString() == movieId)
                .Select(m => new 
                {
                    PosterPath = m.PosterPath,
                    Title = m.Title,
                    Storyline = m.Storyline,
                    ReleaseDate = m.ReleseDate,
                    TimeLength = m.RunningTime,
                    Language = m.Language,
                    Genres = m.Genres,
                    Directors = m.Directors,
                    Actors = m.Actors,
                    Reviews = m.Reviews,
                    Ratings = m.Ratings
                })
                .FirstOrDefault();

            //var movie = db.Movies.Find(movieId);

            this.PageTitle.Text = movie.Title;
            this.MovieImage.ImageUrl = movie.PosterPath;
            this.StoryLine.Text = movie.Storyline;
            this.ReleaseDate.Text = movie.ReleaseDate.ToShortDateString();
            this.Language.Text = movie.Language.Name;
            this.Length.Text = movie.TimeLength.ToString() + " min";
            var rating = 4.56;

            this.AddRating(rating);
        }

        private void AddRating(double rating)
        {
            for (int i = 0; i < Math.Floor(rating); i++)
            {
                var rateStar = new Image();
                rateStar.ImageUrl = "~/Images/star.png";
                this.Rating.Controls.Add(rateStar);
            }

            if (Math.Floor(rating) != Math.Round(rating))
            {
                var halfStar = new Image();
                halfStar.ImageUrl = "~/Images/star-half.png";
                this.Rating.Controls.Add(halfStar);
            }
        }
    }
}