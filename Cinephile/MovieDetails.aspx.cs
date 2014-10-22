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
                    Ratings = m.Ratings,
                    Countries = m.Countries
                })
                .FirstOrDefault();

            //var movie = db.Movies.Find(movieId);

            this.PageTitle.Text = movie.Title;
            this.MovieImage.ImageUrl = movie.PosterPath;
            this.StoryLine.Text = movie.Storyline;
            this.ReleaseDate.Text = movie.ReleaseDate.ToShortDateString();
            this.Language.Text = movie.Language.Name;
            this.Length.Text = movie.TimeLength.ToString() + " min";
            double rating = 0;

            foreach (var rate in movie.Ratings)
            {
                rating += rate.RatingValue;
            }

            rating = rating / movie.Ratings.Count;
            if (double.IsNaN(rating))
            {
                rating = 0;
            }
            this.AddRating(rating);

            if (movie.Countries.Count > 1)
            {
                this.Countries.Text = "Countries";
            }
            else
            {
                this.Countries.Text = "Country";
            }
            this.RepeaterCountries.DataSource = movie.Countries;

            if (movie.Genres.Count > 1)
            {
                this.Genres.Text = "Genres";
            }
            else
            {
                this.Genres.Text = "Genre";
            }
            this.RepeaterGenres.DataSource = movie.Genres;
            this.RepeaterDirectors.DataSource = movie.Directors;
            this.GridViewActors.DataSource = movie.Actors.ToList();
            
            Page.DataBind();
        }

        private void AddRating(double rating)
        {
            var fullStars = Math.Floor(rating);
            var emptyStars = Math.Floor(10 - rating);

            for (int i = 0; i < fullStars; i++)
            {
                var rateStar = new Image();
                rateStar.ImageUrl = "~/Images/star.png";
                this.Rating.Controls.Add(rateStar);
            }

            if (emptyStars + fullStars != 10)
            {
                var halfStar = new Image();
                halfStar.ImageUrl = "~/Images/star-half.png";
                this.Rating.Controls.Add(halfStar);
            }

            for (int i = 0; i < emptyStars; i++)
            {
                var rateStar = new Image();
                rateStar.ImageUrl = "~/Images/star-empty.png";
                this.Rating.Controls.Add(rateStar);
            }
        }

        protected void GridViewActors_Sorting(object sender, GridViewSortEventArgs e)
        {
        }
    }
}