using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cinephile.Data;

namespace Cinephile.Admin
{
    public partial class CreateMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonCreateMovie_Click(object sender, EventArgs e)
        {
            string title = this.TextBoxMovieTitle.Text;

            if (string.IsNullOrWhiteSpace(title))
            {
                Response.Write("Correct Title is required");
                return;
            }

            string storyline = this.TextBoxMovieStoryline.Text;

            if (string.IsNullOrWhiteSpace(storyline))
            {
                Response.Write("Correct Storyline is required");
                return;
            }

            string releaseDateString = this.TextBoxMovieReleaseDate.Text;
            DateTime releaseDate = new DateTime();
            if (DateTime.TryParse(releaseDateString, out releaseDate) == false)
            {
                Response.Write("Correct Release date is required");
                return;
            }

            string runningTimeString = this.TextBoxMovieRunningTime.Text;
            int runningTime;
            if (int.TryParse(runningTimeString, out runningTime) == false)
            {
                Response.Write("Correct Running time is required");
                return;
            }

            int languageId;
            if (int.TryParse(this.DropDownListMovieLanguages.SelectedValue, out languageId) == false)
            {
                Response.Write("Correct Language is required");
                return;
            }

            CinephileDbEntities db = new CinephileDbEntities();
            var language = db.Languages.FirstOrDefault(lang => lang.Id == languageId);
            if (language == null)
            {
                Response.Write("Correct Language is required");
                return;
            }

            int[] selectedCountriesIndeces = this.ListBoxMovieCountries.GetSelectedIndices();
            if (selectedCountriesIndeces.Length < 1)
            {
                Response.Write("Correct Country is required");
                return;
            }

            int[] selectedGenresIndeces = this.ListBoxMovieGenres.GetSelectedIndices();
            if (selectedGenresIndeces.Length < 1)
            {
                Response.Write("Correct Gener is required");
                return;
            }

            var newMovie = new Movie();
            newMovie.LanguageId = languageId;
            newMovie.ReleseDate = releaseDate;
            newMovie.RunningTime = runningTime;
            newMovie.Storyline = storyline;
            newMovie.Title = title;

            var allCountries = this.ListBoxMovieCountries.Items;
            string currSelectedCountry = string.Empty;
            Country currCountry;
            foreach (int country in selectedCountriesIndeces)
            {
                currSelectedCountry = allCountries[country].Value;
                currCountry = db.Countries.FirstOrDefault(c => c.Id.ToString() == currSelectedCountry);

                if (currCountry == null)
                {
                    Response.Write("Invalid Country entered");
                    return;
                }

                newMovie.Countries.Add(currCountry);
            }

            var allGenres = this.ListBoxMovieGenres.Items;
            string currSelectedGener = string.Empty;
            Genre currGenre;
            foreach (int gener in selectedGenresIndeces)
            {
                currSelectedGener = allGenres[gener].Value;
                currGenre = db.Genres.FirstOrDefault(g => g.Id.ToString() == currSelectedGener);

                if (currGenre == null)
                {
                    Response.Write("Invalid Genre entered");
                    return;
                }

                newMovie.Genres.Add(currGenre);
            }

            if (FileUploadMoviePoster.HasFile)
            {
                try
                {
                    if (FileUploadMoviePoster.PostedFile.ContentType == "image/*")
                    {
                        string filename = Path.GetFileName(FileUploadMoviePoster.FileName);
                        FileUploadMoviePoster.SaveAs(Server.MapPath("~/Images/") + filename);
                    }
                    else
                    {
                        Response.Write("Upload status: Only Image files are accepted!");
                        return;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                }
            }

            newMovie.PosterPath = "~/Images/" + this.FileUploadMoviePoster.FileName;

            db.Movies.Add(newMovie);
            db.SaveChanges();

            Response.Redirect("~/MovieDetails.aspx?id=" + newMovie.Id);
        }
    }
}using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cinephile.Admin
{
    public partial class CreateMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}