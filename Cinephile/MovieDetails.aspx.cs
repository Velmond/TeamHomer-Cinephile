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
            var movie = db.Movies.Find(movieId);
        }
    }
}