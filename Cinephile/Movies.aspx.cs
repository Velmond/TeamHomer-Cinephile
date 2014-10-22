using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

using Cinephile.Data;

namespace Cinephile
{
    public partial class Movies : Page
    {
        const int ItemsPerPage = 8;

        List<Movie> movies = new List<Movie>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CinephileDbEntities db = new CinephileDbEntities();
                string searched = Request.Params["search"];
                //string page = Request.Params["page"];
                //var pageNum = page != null ? int.Parse(page) : 1;

                if(!string.IsNullOrEmpty(searched))
                {
                    SearchBox.Text = searched;
                    movies = db.Movies
                        .Where(m => m.Title.ToLower().IndexOf(searched.ToLower()) >= 0)
                        .OrderBy(m => m.Title)
                        //.Skip((pageNum - 1) * ItemsPerPage)
                        //.Take(ItemsPerPage)
                        .ToList();
                }
                else
                {
                    movies = db.Movies
                        .OrderBy(m => m.Title)
                        //.Skip((pageNum - 1) * ItemsPerPage)
                        //.Take(ItemsPerPage)
                        .ToList();
                }

                MoviesListView.DataSource = movies;
                MoviesListView.DataBind();
            }
        }

        protected void SearchSubmitBtn_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(SearchBox.Text))
            {
                string searched = SearchBox.Text;
                Response.Redirect("~/Movies?search=" + searched);
            }
            else
            {
                Response.Redirect("~/Movies");
            }
        }

        protected void ShowAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Movies");
        }
    }
}
