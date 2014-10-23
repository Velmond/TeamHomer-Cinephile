using Cinephile.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cinephile
{
    public partial class ArtistDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CinephileDbEntities db = new CinephileDbEntities();

            string artistId;
            var artist = db.Artists.FirstOrDefault();

            if (Request.Params["Id"] != null)
            {
                artistId = Request.Params["Id"];

                artist = db.Artists
                           .Where(a => a.Id == new Guid(artistId))
                           .FirstOrDefault();
                
            }

            this.ArtistName.Text = artist.FullName;
            this.HeaderArtistName.Text = artist.FullName;
            this.ArtistImage.ImageUrl = artist.PicturePath;
            this.ArtistBirthDate.Text = string.Format("{0:dd MMMMMMMMM yyyy}", artist.BirthDate.Value);
            this.ArtistCountry.Text = artist.Country.Name;

            this.MoviesListView.DataSource = artist.MoviesPlayedIn;

            this.DataBind();
        }
    }
}