using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

using Cinephile.Data;

namespace Cinephile
{
    public partial class Movies : Page
    {
        private const int ItemsPerPage = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Text = "";

            if(!IsPostBack)
            {
                string searched = Request.Params["search"];
                SearchBox.Text = Request.Params["search"] != null ? Request.Params["search"] : string.Empty;
                
                CinephileDbEntities db = new CinephileDbEntities();

                if(!string.IsNullOrEmpty(searched))
                {
                    MoviesListView.DataSource = db.Movies
                        .Where(m => m.Title.ToLower().IndexOf(searched.ToLower()) >= 0)
                        .OrderBy(m => m.Title.ToLower())
                        .ToList();
                }
                else
                {
                    MoviesListView.DataSource = db.Movies
                        .OrderBy(m => m.Title.ToLower())
                        .ToList();
                }

                MoviesListView.DataBind();
            }
        }

        protected void SearchSubmitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Movies.aspx?search=" + SearchBox.Text);
        }

        protected void ShowAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Movies");
        }

        public IQueryable<Movie> MoviesAdminListView_GetData()
        {
            CinephileDbEntities db = new CinephileDbEntities();
            string searched = string.IsNullOrEmpty(Request.Params["search"]) ? string.Empty : Request.Params["search"].ToLower();
            string page = Request.Params["page"];
            var pageNum = page != null ? int.Parse(page) : 1;

            SearchBox.Text = searched;

            var adminMovies = db.Movies
                .OrderBy(m => m.Title.ToLower())
                .ToList()
                .Where(m => m.Title.ToLower().IndexOf(searched) >= 0)
                .Skip((pageNum - 1) * ItemsPerPage)
                .Take(ItemsPerPage);

            return adminMovies.AsQueryable<Movie>();
        }

        protected void MoviesAdminListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            MoviesAdminListView.SelectedIndex = e.NewSelectedIndex;
        }

        protected void MoviesAdminListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            MoviesAdminListView.SelectedIndex = -1;
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/CreateMovie");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            if(MoviesAdminListView.SelectedIndex >= 0)
            {
                string id = MoviesAdminListView.SelectedDataKey.Value.ToString();
                Response.Redirect("~/Admin/CreateMovie?id=" + id);
                MoviesAdminListView.DeleteItem(MoviesAdminListView.SelectedIndex);

                MoviesAdminListView.SelectedIndex = -1;
            }
            else
            {
                Message.Text = "No movie was selected.";
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if(MoviesAdminListView.SelectedIndex >= 0)
            {
                MoviesAdminListView.DeleteItem(MoviesAdminListView.SelectedIndex);
                MoviesAdminListView.SelectedIndex = -1;
            }
            else
            {
                Message.Text = "No movie was selected.";
            }
        }

        public void MoviesAdminListView_DeleteItem(string id)
        {
            CinephileDbEntities db = new CinephileDbEntities();

            var movie = db.Set<Movie>().Include(m => m.Actors).Include(m => m.Directors).Include(m => m.Countries)
                .Include(m => m.Genres).Include(m => m.Language).Include(m => m.Ratings).Include(m => m.Reviews)
                .FirstOrDefault(m => m.Id.ToString() == id);

            db.Set<Movie>().Remove(movie);
            db.SaveChanges();
        }
    }
}
