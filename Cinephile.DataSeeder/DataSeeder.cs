namespace Cinephile.DataSeeder
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    using Cinephile.Data;

    public class DataSeeder
    {
        static Random rand = new Random();

        public static void Main()
        {
            CinephileDbEntities dbContext = new CinephileDbEntities();

            if(dbContext.AspNetRoles.Count() == 0)
            {
                SeedRoles(dbContext);
            }

            if(dbContext.Countries.Count() == 0)
            {
                SeedCoutries(dbContext);
            }

            if(dbContext.Languages.Count() == 0)
            {
                SeedLanguages(dbContext);
            }

            if(dbContext.Genres.Count() == 0)
            {
                SeedGenres(dbContext);
            }

            if(dbContext.Artists.Count() == 0)
            {
                SeedArtists(dbContext);
            }

            if(dbContext.Movies.Count() == 0)
            {
                SeedMovies(dbContext);
            }
        }

        private static void SeedRoles(CinephileDbEntities dbContext)
        {
            dbContext.AspNetRoles.AddRange(new AspNetRole[] {
                new AspNetRole() { Name = "user" },
                new AspNetRole() { Name = "moderator" },
                new AspNetRole() { Name = "admin" },
                new AspNetRole() { Name = "banned" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Roles seeded");
        }

        private static void SeedMovies(CinephileDbEntities dbContext)
        {
            var countries = dbContext.Countries.ToList();
            var languagesIds = dbContext.Languages.Select(l => l.Id).ToList();
            var englishId = dbContext.Languages.FirstOrDefault(l => l.Name == "English").Id;
            var bulgarianId = dbContext.Languages.FirstOrDefault(l => l.Name == "Bulgarian").Id;
            var spanishId = dbContext.Languages.FirstOrDefault(l => l.Name == "Spanish").Id;
            var japaneseId = dbContext.Languages.FirstOrDefault(l => l.Name == "Japanese").Id;
            var artists = dbContext.Artists.ToList();
            var genres = dbContext.Genres.ToList();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Airplane",
                Storyline = "An airplane crew takes ill. Surely the only person capable of landing the plane is an ex-pilot afraid to fly. But don't call him Shirley.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(1980, 7, 2),
                RunningTime = 88,
                PosterPath = "~/Images/airplane-poster.png"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "American Horor Story",
                Storyline = "An anthology series that centers on different characters and locations, including a haunted house, an insane asylum, a witch coven and a freak show.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2011, 1, 1),
                RunningTime = 60,
                PosterPath = "~/Images/american-horor-story-poster.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Annabelle",
                Storyline = "A couple begin to experience terrifying supernatural occurrences involving a vintage doll shortly after their home is invaded by satanic cultists.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2014, 10, 3),
                RunningTime = 90,
                PosterPath = "~/Images/Annabelle-poster.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Avengers: Age of Ultron",
                Storyline = "When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and it is up to The Avengers to stop the villainous Ultron from enacting his terrible plans.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2015, 5, 1),
                RunningTime = 120,
                PosterPath = "~/Images/Avengers-Age-of-Ultron.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Batman v Superman: Dawn of Justice",
                Storyline = "The plot has not been disclosed at this time.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2016, 3, 25),
                RunningTime = 120,
                PosterPath = "~/Images/Batman-v-Superman-Dawn-of-Justice.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Dracula Untold",
                Storyline = "As his kingdom is being threatened by the Turks, young prince Vlad Tepes must become a monster feared by his own kingdom in order to obtain the power needed to protect his own family, and the families of his kingdom.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2014, 10, 10),
                RunningTime = 92,
                PosterPath = "~/Images/dracula-untold.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Gone Girl",
                Storyline = "With his wife's disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it's suspected that he may not be innocent.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2014, 10, 3),
                RunningTime = 149,
                PosterPath = "~/Images/gone-girl-poster.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Dark Knight",
                Storyline = "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2008, 7, 18),
                RunningTime = 152,
                PosterPath = "~/Images/the-dark-knight-poster.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Flash",
                Storyline = "While working in his lab during a storm one night, a bolt of lightning strikes a tray of chemicals soaking police scientist Barry Allen with its contents. Now able to move at super-speed, Barry becomes The Flash protecting Central City from the threats it faces.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2018, 3, 23),
                RunningTime = 120,
                PosterPath = "~/Images/The-Flash.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Maze Runner",
                Storyline = "Thomas is deposited in a community of boys after his memory is erased, soon learning they're all trapped in a maze that will require him to join forces with fellow \"runners\" for a shot at escape.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2012, 9, 19),
                RunningTime = 113,
                PosterPath = "~/Images/The-Maze-Runner.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Ring",
                Storyline = "A young journalist must investigate a mysterious videotape which seems to cause the death of anyone in a week of viewing it.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = englishId,
                ReleseDate = new DateTime(2002, 10, 18),
                RunningTime = 115,
                PosterPath = "~/Images/The-Ring.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "One Missed Call",
                Storyline = "Several people start receiving voice-mails from their future selves - messages which include the date, time, and some of the details of their deaths.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(2008, 1, 4),
                RunningTime = 87,
                PosterPath = "~/Images/One-Missed-Call.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Scott Pilgrim vs. the World",
                Storyline = "Scott Pilgrim must defeat his new girlfriend's seven evil exes in order to win her heart.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(2010, 8, 13),
                RunningTime = 112,
                PosterPath = "~/Images/Scott-Pilgrim-vs-the-World.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Phantom of the Opera",
                Storyline = "A young soprano becomes the obsession of a disfigured musical genius who lives beneath the Paris Opéra House.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(2004, 12, 22),
                RunningTime = 143,
                PosterPath = "~/Images/The-Phantom-of-the-Opera.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Shawshank Redemption",
                Storyline = "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(1994, 10, 14),
                RunningTime = 142,
                PosterPath = "~/Images/The-Shawshank-Redemption.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "Schindler's List",
                Storyline = "In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(1993, 2, 4),
                RunningTime = 195,
                PosterPath = "~/Images/Schindler-s-List.jpg"
            });
            dbContext.SaveChanges();

            dbContext.Movies.Add(new Movie()
            {
                Title = "The Lord of the Rings: The Return of the King",
                Storyline = "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
                Countries = AssignRandomCountries(countries),
                Actors = AssignRandomActors(artists),
                Directors = AssignRandomDirectors(artists),
                Genres = AssignRandomGenres(genres),
                LanguageId = japaneseId,
                ReleseDate = new DateTime(2003, 12, 17),
                RunningTime = 201,
                PosterPath = "~/Images/The-Lord-of-the-Rings-The-Return-of-the-King.jpg"
            });
            dbContext.SaveChanges();

            Console.WriteLine("Movies seeded");
        }

        private static ICollection<Genre> AssignRandomGenres(List<Genre> genres)
        {
            var genresCount = rand.Next(1, 4);

            var genresList = new HashSet<Genre>();

            while(genresList.Count < genresCount)
            {
                genresList.Add(genres[rand.Next(0, genres.Count)]);
            }

            return genresList;
        }

        private static ICollection<Artist> AssignRandomActors(List<Artist> artists)
        {
            var actorsCount = rand.Next(3, 11);

            var actorsList = new HashSet<Artist>();

            while(actorsList.Count < actorsCount)
            {
                actorsList.Add(artists[rand.Next(0, artists.Count)]);
            }

            return actorsList;
        }

        private static ICollection<Artist> AssignRandomDirectors(List<Artist> artists)
        {
            var directorsCount = rand.Next(1, 4);

            var directorsList = new HashSet<Artist>();

            while(directorsList.Count < directorsCount)
            {
                directorsList.Add(artists[rand.Next(0, artists.Count)]);
            }

            return directorsList;
        }

        private static ICollection<Country> AssignRandomCountries(List<Country> countries)
        {
            var countriesCount = rand.Next(1, 4);

            var countriesList = new HashSet<Country>();

            while(countriesList.Count < countriesCount)
            {
                countriesList.Add(countries[rand.Next(0, countries.Count)]);
            }

            return countriesList;
        }

        private static string GetRandomStoryline()
        {
            var charactersPermitted = "qwertyuiop asdfghjkl zxcvbnm.,- ";
            var storyline = new StringBuilder();
            var storylineLength = rand.Next(50, 1000);

            for(int i = 0 ; i < storylineLength ; i++)
            {
                storyline.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return storyline.ToString().Substring(0, 1).ToUpper() + storyline.ToString().Substring(1);
        }

        private static string GetRandomMovieTitle()
        {
            var charactersPermitted = "qwertyuiopasdfghjklzxcvbnm ";
            var title = new StringBuilder();
            var titleLength = rand.Next(3, 40);

            for(int i = 0 ; i < titleLength ; i++)
            {
                title.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return title.ToString().Substring(0, 1).ToUpper() + title.ToString().Substring(1);
        }

        private static void SeedArtists(CinephileDbEntities dbContext)
        {
            var usId = dbContext.Countries.FirstOrDefault(c => c.Name == "United States").Id;
            var ukId = dbContext.Countries.FirstOrDefault(c => c.Name == "United Kingdom").Id;
            var canadaId = dbContext.Countries.FirstOrDefault(c => c.Name == "Canada").Id;
            var italyId = dbContext.Countries.FirstOrDefault(c => c.Name == "Italy").Id;
            var australiaId = dbContext.Countries.FirstOrDefault(c => c.Name == "Australia").Id;
            var israelId = dbContext.Countries.FirstOrDefault(c => c.Name == "Israel").Id;

            dbContext.Artists.AddRange(new Artist[] {
                new Artist() {
                    FullName = "Ben Affleck",
                    BirthDate = new DateTime(1972, 8, 15),
                    CounryId = usId,
                    PicturePath="~/Images/ben-affleck.jpg"
                },
                new Artist() {
                    FullName = "Rosamund Pike",
                    BirthDate = new DateTime(1979, 1, 28),
                    CounryId = ukId,
                    PicturePath = "~/Images/rosamund-pike.jpg"
                },
                new Artist() {
                    FullName = "Neil Patrick Harris",
                    BirthDate = new DateTime(1973, 6, 15),
                    CounryId = usId,
                    PicturePath = "~/Images/neil-patrick-harris.jpg"
                },
                new Artist() {
                    FullName = "Tyler Perry",
                    BirthDate = new DateTime(1969, 9, 14),
                    CounryId = usId,
                    PicturePath = "~/Images/tyler-perry.jpg"
                },
                new Artist() {
                    FullName = "Carrie Coon",
                    BirthDate = new DateTime(1981, 1, 24),
                    CounryId = usId,
                    PicturePath = "~/Images/carrie-coon.jpg"
                },
                new Artist() {
                    FullName = "Rosamund Pike",
                    BirthDate = new DateTime(1979, 1, 28),
                    CounryId = usId,
                    PicturePath = "~/Images/rosamund-pike.jpg"
                },
                new Artist() {
                    FullName = "Luke Evans",
                    BirthDate = new DateTime(1979, 4, 15),
                    CounryId = ukId,
                    PicturePath = "~/Images/Luke-Evans.jpg"
                },
                new Artist() {
                    FullName = "Sarah Gadon",
                    BirthDate = new DateTime(1987, 4, 4),
                    CounryId = canadaId,
                    PicturePath = "~/Images/Sarah-Gadon.jpg"
                },
                new Artist() {
                    FullName = "Dominic Cooper",
                    BirthDate = new DateTime(1978, 6, 2),
                    CounryId = ukId,
                    PicturePath = "~/Images/Dominic-Cooper.jpg"
                },
                new Artist() {
                    FullName = "Annabelle Wallis",
                    BirthDate = new DateTime(1984, 9, 25),
                    CounryId = ukId,
                    PicturePath = "~/Images/Annabelle-Wallis.jpg"
                },
                new Artist() {
                    FullName = "Scarlett Johansson",
                    BirthDate = new DateTime(1984, 9, 22),
                    CounryId = usId,
                    PicturePath = "~/Images/Scarlett-Johansson.jpg"
                },
                new Artist() {
                    FullName = "Aaron Taylor-Johnson",
                    BirthDate = new DateTime(1990, 6, 13),
                    CounryId = ukId,
                    PicturePath = "~/Images/Aaron-Taylor-Johnson.jpg"
                },
                new Artist() {
                    FullName = "Robert Downey Jr.",
                    BirthDate = new DateTime(1965, 4, 4),
                    CounryId = usId,
                    PicturePath = "~/Images/Robert-Downey-Jr.jpg"
                },
                new Artist() {
                    FullName = "Chris Hemsworth",
                    BirthDate = new DateTime(1983, 8, 11),
                    CounryId = australiaId,
                    PicturePath = "~/Images/Chris-Hemsworth.jpg"
                },
                new Artist() {
                    FullName = "James Spader",
                    BirthDate = new DateTime(1960, 2, 7),
                    CounryId = usId,
                    PicturePath = "~/Images/James-Spader.jpg"
                },
                new Artist() {
                    FullName = "Chris Evans",
                    BirthDate = new DateTime(1981, 6, 13),
                    CounryId = usId,
                    PicturePath = "~/Images/Chris-Evans.jpg"
                },
                new Artist() {
                    FullName = "Elizabeth Olsen",
                    BirthDate = new DateTime(1999, 2, 16),
                    CounryId = usId,
                    PicturePath = "~/Images/Elizabeth-Olsen.jpg"
                },
                new Artist() {
                    FullName = "Samuel L. Jackson",
                    BirthDate = new DateTime(1948, 12, 21),
                    CounryId = usId,
                    PicturePath = "~/Images/Samuel-L-Jackson.jpg"
                },
                new Artist() {
                    FullName = "Grant Gustin",
                    BirthDate = new DateTime(1990, 1, 14),
                    CounryId = usId,
                    PicturePath = "~/Images/Grant-Gustin.jpg"
                },
                new Artist() {
                    FullName = "Danielle Panabaker",
                    BirthDate = new DateTime(1987, 9, 19),
                    CounryId = usId,
                    PicturePath = "~/Images/Danielle-Panabaker.jpg"
                },
                new Artist() {
                    FullName = "Dylan O'Brien",
                    BirthDate = new DateTime(1991, 8, 26),
                    CounryId = usId,
                    PicturePath = "~/Images/Dylan-O-Brien.jpg"
                },
                new Artist() {
                    FullName = "Aml Ameen",
                    BirthDate = new DateTime(1985, 6, 30),
                    CounryId = ukId,
                    PicturePath = "~/Images/Aml-Ameen.jpg"
                },
                new Artist() {
                    FullName = "Jena Malone",
                    BirthDate = new DateTime(1984, 11, 21),
                    CounryId = usId,
                    PicturePath = "~/Images/Jena-Malone.jpg"
                },
                new Artist() {
                    FullName = "Gal Gadot",
                    BirthDate = new DateTime(1985, 4, 30),
                    CounryId = israelId,
                    PicturePath = "~/Images/Gal-Gadot.jpg"
                },
                new Artist() {
                    FullName = "Jason Momoa",
                    BirthDate = new DateTime(1979, 8, 1),
                    CounryId = usId,
                    PicturePath = "~/Images/Jason-Momoa.jpg"
                },
                new Artist() {
                    FullName = "Henry Cavill",
                    BirthDate = new DateTime(1983, 5, 5),
                    CounryId = ukId,
                    PicturePath = "~/Images/Henry-Cavill.jpg"
                },
                new Artist() {
                    FullName = "Amy Adams",
                    BirthDate = new DateTime(1974, 8, 20),
                    CounryId = italyId,
                    PicturePath = "~/Images/Amy-Adams.jpg"
                },
                new Artist() {
                    FullName = "Diane Lane",
                    BirthDate = new DateTime(1965, 1, 22),
                    CounryId = usId,
                    PicturePath = "~/Images/Diane-Lane.jpg"
                },
                new Artist() {
                    FullName = "Jesse Eisenberg",
                    BirthDate = new DateTime(1983, 10, 5),
                    CounryId = usId,
                    PicturePath = "~/Images/Jesse-Eisenberg.jpg"
                },
                new Artist() {
                    FullName = "Jeremy Irons",
                    BirthDate = new DateTime(1949, 9, 19),
                    CounryId = ukId,
                    PicturePath = "~/Images/Jeremy-Irons.jpg"
                }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Artists seeded");
        }

        private static string GetRandomArtistName()
        {
            var charactersPermitted = "qwertyuiopasdfghjklzxcvbnm-";

            var firstName = GetRandomName(charactersPermitted);
            var lastName = GetRandomName(charactersPermitted);

            return firstName + " " + lastName;
        }

        private static string GetRandomName(string charactersPermitted)
        {
            var name = new StringBuilder();
            var nameLength = rand.Next(2, 16);

            for(int i = 0 ; i < nameLength ; i++)
            {
                name.Append(charactersPermitted[rand.Next(0, charactersPermitted.Length)]);
            }

            return name.ToString().Substring(0, 1).ToUpper() + name.ToString().Substring(1);
        }

        private static DateTime GetRandomDate(int startYear, int endYear)
        {
            return new DateTime(rand.Next(startYear, endYear), rand.Next(1, 12), rand.Next(1, 29));
        }

        private static void SeedGenres(CinephileDbEntities dbContext)
        {
            dbContext.Genres.AddRange(new List<Genre>()
            {
                new Genre() { Name = "Action" },
                new Genre() { Name = "Adult" },
                new Genre() { Name = "Adventure" },
                new Genre() { Name = "Avant-garde/Experimental" },
                new Genre() { Name = "Animation" },
                new Genre() { Name = "Comedy" },
                new Genre() { Name = "Crime" },
                new Genre() { Name = "Culture/Society" },
                new Genre() { Name = "Dance" },
                new Genre() { Name = "Drama" },
                new Genre() { Name = "Education" },
                new Genre() { Name = "Epic" },
                new Genre() { Name = "Fantasy" },
                new Genre() { Name = "Health/Fitness" },
                new Genre() { Name = "Historical" },
                new Genre() { Name = "Horror" },
                new Genre() { Name = "Musical" },
                new Genre() { Name = "Mystery" },
                new Genre() { Name = "Nature" },
                new Genre() { Name = "Romance" },
                new Genre() { Name = "Science Fiction" },
                new Genre() { Name = "Theater" },
                new Genre() { Name = "Biography" },
                new Genre() { Name = "Thriller" },
                new Genre() { Name = "Travel" },
                new Genre() { Name = "War" },
                new Genre() { Name = "Western" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Genres seeded");
        }

        private static void SeedLanguages(CinephileDbEntities dbContext)
        {
            dbContext.Languages.AddRange(new List<Language>()
            {    
                new Language() { Name = "English" },
                new Language() { Name = "Bulgarian" },
                new Language() { Name = "Spanish" },
                new Language() { Name = "German" },
                new Language() { Name = "Italian" },
                new Language() { Name = "French" },
                new Language() { Name = "Portuguese" },
                new Language() { Name = "Russian" },
                new Language() { Name = "Mandarin" },
                new Language() { Name = "Hindi" },
                new Language() { Name = "Arabic" },
                new Language() { Name = "Bengali" },
                new Language() { Name = "Japanese" },
                new Language() { Name = "Punjabi" },
                new Language() { Name = "Javanese" },
                new Language() { Name = "Wu" },
                new Language() { Name = "Malay/Indonesian" },
                new Language() { Name = "Telugu" },
                new Language() { Name = "Vietnamese" },
                new Language() { Name = "Korean" },
                new Language() { Name = "Marathi" },
                new Language() { Name = "Tamil" },
                new Language() { Name = "Urdu" },
                new Language() { Name = "Turkish" },
                new Language() { Name = "Cantonese" },
                new Language() { Name = "Persian" },
                new Language() { Name = "Thai" },
                new Language() { Name = "Gujarati" },
                new Language() { Name = "Jin" },
                new Language() { Name = "Min Nan" },
                new Language() { Name = "Polish" },
                new Language() { Name = "Pashto" },
                new Language() { Name = "Kannada" },
                new Language() { Name = "Xiang" },
                new Language() { Name = "Malayalam" },
                new Language() { Name = "Sundanese" },
                new Language() { Name = "Hausa" },
                new Language() { Name = "Oriya" },
                new Language() { Name = "Burmese" },
                new Language() { Name = "Hakka" },
                new Language() { Name = "Ukrainian" },
                new Language() { Name = "Bhojpuri" },
                new Language() { Name = "Tagalog" },
                new Language() { Name = "Yoruba" },
                new Language() { Name = "Maithili" },
                new Language() { Name = "Swahili" },
                new Language() { Name = "Uzbek" },
                new Language() { Name = "Sindhi" },
                new Language() { Name = "Amharic" },
                new Language() { Name = "Fula" },
                new Language() { Name = "Romanian" },
                new Language() { Name = "Oromo" },
                new Language() { Name = "Igbo" },
                new Language() { Name = "Azerbaijani" },
                new Language() { Name = "Awadhi" },
                new Language() { Name = "Gan" },
                new Language() { Name = "Cebuano" },
                new Language() { Name = "Dutch" },
                new Language() { Name = "Kurdish" },
                new Language() { Name = "Lao" },
                new Language() { Name = "Serbo-Croatian" },
                new Language() { Name = "Malagasy" },
                new Language() { Name = "Saraiki" },
                new Language() { Name = "Nepali" },
                new Language() { Name = "Sinhalese" },
                new Language() { Name = "Chittagonian" },
                new Language() { Name = "Zhuang" },
                new Language() { Name = "Khmer" },
                new Language() { Name = "Assamese" },
                new Language() { Name = "Madurese" },
                new Language() { Name = "Somali" },
                new Language() { Name = "Marwari" },
                new Language() { Name = "Magahi" },
                new Language() { Name = "Haryanvi" },
                new Language() { Name = "Hungarian" },
                new Language() { Name = "Chhattisgarhi" },
                new Language() { Name = "Greek" },
                new Language() { Name = "Chewa" },
                new Language() { Name = "Deccan" },
                new Language() { Name = "Akan" },
                new Language() { Name = "Kazakh" },
                new Language() { Name = "Min Bei" },
                new Language() { Name = "Sylheti" },
                new Language() { Name = "Zulu" },
                new Language() { Name = "Czech" },
                new Language() { Name = "Kinyarwanda" },
                new Language() { Name = "Dhundhari" },
                new Language() { Name = "Haitian Creole" },
                new Language() { Name = "Min Dong" },
                new Language() { Name = "Ilokano" },
                new Language() { Name = "Quechua" },
                new Language() { Name = "Kirundi" },
                new Language() { Name = "Swedish" },
                new Language() { Name = "Hmong" },
                new Language() { Name = "Shona" },
                new Language() { Name = "Uyghur" },
                new Language() { Name = "Hiligaynon" },
                new Language() { Name = "Mossi" },
                new Language() { Name = "Xhosa" },
                new Language() { Name = "Belarusian" },
                new Language() { Name = "Balochi" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Languages seeded.");
        }

        private static void SeedCoutries(CinephileDbEntities dbContext)
        {
            dbContext.Countries.AddRange(new List<Country>()
            {
                new Country() { Name = "Afghanistan" },
                new Country() { Name = "Albania" },
                new Country() { Name = "Algeria" },
                new Country() { Name = "American Samoa" },
                new Country() { Name = "Andorra" },
                new Country() { Name = "Angola" },
                new Country() { Name = "Anguilla" },
                new Country() { Name = "Antarctica" },
                new Country() { Name = "Antigua and Barbuda" },
                new Country() { Name = "Argentina" },
                new Country() { Name = "Armenia" },
                new Country() { Name = "Aruba" },
                new Country() { Name = "Australia" },
                new Country() { Name = "Austria" },
                new Country() { Name = "Azerbaijan" },
                new Country() { Name = "Bahamas" },
                new Country() { Name = "Bahrain" },
                new Country() { Name = "Bangladesh" },
                new Country() { Name = "Barbados" },
                new Country() { Name = "Belarus" },
                new Country() { Name = "Belgium" },
                new Country() { Name = "Belize" },
                new Country() { Name = "Benin" },
                new Country() { Name = "Bermuda" },
                new Country() { Name = "Bhutan" },
                new Country() { Name = "Bolivia" },
                new Country() { Name = "Bosnia and Herzegovina" },
                new Country() { Name = "Botswana" },
                new Country() { Name = "Brazil" },
                new Country() { Name = "Brunei Darussalam" },
                new Country() { Name = "Bulgaria" },
                new Country() { Name = "Burkina Faso" },
                new Country() { Name = "Burundi" },
                new Country() { Name = "Cambodia" },
                new Country() { Name = "Cameroon" },
                new Country() { Name = "Canada" },
                new Country() { Name = "Cape Verde" },
                new Country() { Name = "Cayman Islands" },
                new Country() { Name = "Central African Republic" },
                new Country() { Name = "Chad" },
                new Country() { Name = "Chile" },
                new Country() { Name = "China" },
                new Country() { Name = "Christmas Island" },
                new Country() { Name = "Cocos (Keeling) Islands" },
                new Country() { Name = "Colombia" },
                new Country() { Name = "Comoros" },
                new Country() { Name = "Democratic Republic of the Congo" },
                new Country() { Name = "Republic of Congo" },
                new Country() { Name = "Cook Islands" },
                new Country() { Name = "Costa Rica" },
                new Country() { Name = "Ivory Coast" },
                new Country() { Name = "Croatia" },
                new Country() { Name = "Cuba" },
                new Country() { Name = "Cyprus" },
                new Country() { Name = "Czech Republic" },
                new Country() { Name = "Denmark" },
                new Country() { Name = "Djibouti" },
                new Country() { Name = "Dominica" },
                new Country() { Name = "Dominican Republic" },
                new Country() { Name = "East Timor" },
                new Country() { Name = "Ecuador" },
                new Country() { Name = "Egypt" },
                new Country() { Name = "El Salvador" },
                new Country() { Name = "Equatorial Guinea" },
                new Country() { Name = "Eritrea" },
                new Country() { Name = "Estonia" },
                new Country() { Name = "Ethiopia" },
                new Country() { Name = "Falkland Islands" },
                new Country() { Name = "Faroe Islands" },
                new Country() { Name = "Fiji" },
                new Country() { Name = "Finland" },
                new Country() { Name = "France" },
                new Country() { Name = "French Guiana" },
                new Country() { Name = "French Polynesia" },
                new Country() { Name = "French Southern Territories" },
                new Country() { Name = "Gabon" },
                new Country() { Name = "Gambia" },
                new Country() { Name = "Georgia" },
                new Country() { Name = "Germany" },
                new Country() { Name = "Ghana" },
                new Country() { Name = "Gibraltar" },
                new Country() { Name = "Greece" },
                new Country() { Name = "Greenland" },
                new Country() { Name = "Grenada" },
                new Country() { Name = "Guadeloupe" },
                new Country() { Name = "Guam" },
                new Country() { Name = "Guatemala" },
                new Country() { Name = "Guinea" },
                new Country() { Name = "Guinea-Bissau" },
                new Country() { Name = "Guyana" },
                new Country() { Name = "Haiti" },
                new Country() { Name = "Honduras" },
                new Country() { Name = "Hong Kong" },
                new Country() { Name = "Hungary" },
                new Country() { Name = "Iceland" },
                new Country() { Name = "India" },
                new Country() { Name = "Indonesia" },
                new Country() { Name = "Iran" },
                new Country() { Name = "Iraq" },
                new Country() { Name = "Ireland" },
                new Country() { Name = "Israel" },
                new Country() { Name = "Italy" },
                new Country() { Name = "Jamaica" },
                new Country() { Name = "Japan" },
                new Country() { Name = "Jordan" },
                new Country() { Name = "Kazakhstan" },
                new Country() { Name = "Kenya" },
                new Country() { Name = "Kiribati" },
                new Country() { Name = "North Korea" },
                new Country() { Name = "South Korea" },
                new Country() { Name = "Kosovo" },
                new Country() { Name = "Kuwait" },
                new Country() { Name = "Kyrgyzstan" },
                new Country() { Name = "Lao" },
                new Country() { Name = "Latvia" },
                new Country() { Name = "Lebanon" },
                new Country() { Name = "Lesotho" },
                new Country() { Name = "Liberia" },
                new Country() { Name = "Libya" },
                new Country() { Name = "Liechtenstein" },
                new Country() { Name = "Lithuania" },
                new Country() { Name = "Luxembourg" },
                new Country() { Name = "Macau" },
                new Country() { Name = "FYR Macedonia" },
                new Country() { Name = "Madagascar" },
                new Country() { Name = "Malawi" },
                new Country() { Name = "Malaysia" },
                new Country() { Name = "Maldives" },
                new Country() { Name = "Mali" },
                new Country() { Name = "Malta" },
                new Country() { Name = "Marshall Islands" },
                new Country() { Name = "Martinique" },
                new Country() { Name = "Mauritania" },
                new Country() { Name = "Mauritius" },
                new Country() { Name = "Mayotte" },
                new Country() { Name = "Mexico" },
                new Country() { Name = "Micronesia" },
                new Country() { Name = "Moldova" },
                new Country() { Name = "Monaco" },
                new Country() { Name = "Mongolia" },
                new Country() { Name = "Montenegro" },
                new Country() { Name = "Montserrat" },
                new Country() { Name = "Morocco" },
                new Country() { Name = "Mozambique" },
                new Country() { Name = "Myanmar" },
                new Country() { Name = "Namibia" },
                new Country() { Name = "Nauru" },
                new Country() { Name = "Nepal" },
                new Country() { Name = "Netherlands" },
                new Country() { Name = "Netherlands Antilles" },
                new Country() { Name = "New Caledonia" },
                new Country() { Name = "New Zealand" },
                new Country() { Name = "Nicaragua" },
                new Country() { Name = "Niger" },
                new Country() { Name = "Nigeria" },
                new Country() { Name = "Niue" },
                new Country() { Name = "Northern Mariana Islands" },
                new Country() { Name = "Norway" },
                new Country() { Name = "Oman" },
                new Country() { Name = "Pakistan" },
                new Country() { Name = "Palau" },
                new Country() { Name = "Palestinian territories" },
                new Country() { Name = "Panama" },
                new Country() { Name = "Papua New Guinea" },
                new Country() { Name = "Paraguay" },
                new Country() { Name = "Peru" },
                new Country() { Name = "Philippines" },
                new Country() { Name = "Pitcairn Island" },
                new Country() { Name = "Poland" },
                new Country() { Name = "Portugal" },
                new Country() { Name = "Puerto Rico" },
                new Country() { Name = "Qatar" },
                new Country() { Name = "Reunion Island" },
                new Country() { Name = "Romania" },
                new Country() { Name = "Russian Federation" },
                new Country() { Name = "Rwanda" },
                new Country() { Name = "Saint Kitts and Nevis" },
                new Country() { Name = "Saint Lucia" },
                new Country() { Name = "Saint Vincent and the Grenadines" },
                new Country() { Name = "Samoa" },
                new Country() { Name = "San Marino" },
                new Country() { Name = "Sao Tome and Principe" },
                new Country() { Name = "Saudi Arabia" },
                new Country() { Name = "Senegal" },
                new Country() { Name = "Serbia" },
                new Country() { Name = "Seychelles" },
                new Country() { Name = "Sierra Leone" },
                new Country() { Name = "Singapore" },
                new Country() { Name = "Slovakia" },
                new Country() { Name = "Slovenia" },
                new Country() { Name = "Solomon Islands" },
                new Country() { Name = "Somalia" },
                new Country() { Name = "South Africa" },
                new Country() { Name = "South Sudan" },
                new Country() { Name = "Spain" },
                new Country() { Name = "Sri Lanka" },
                new Country() { Name = "Sudan" },
                new Country() { Name = "Suriname" },
                new Country() { Name = "Swaziland" },
                new Country() { Name = "Sweden" },
                new Country() { Name = "Switzerland" },
                new Country() { Name = "Syria" },
                new Country() { Name = "Taiwan" },
                new Country() { Name = "Tajikistan" },
                new Country() { Name = "Tanzania" },
                new Country() { Name = "Thailand" },
                new Country() { Name = "Tibet" },
                new Country() { Name = "Timor-Leste" },
                new Country() { Name = "Togo" },
                new Country() { Name = "Tokelau" },
                new Country() { Name = "Tonga" },
                new Country() { Name = "Trinidad and Tobago" },
                new Country() { Name = "Tunisia" },
                new Country() { Name = "Turkey" },
                new Country() { Name = "Turkmenistan" },
                new Country() { Name = "Turks and Caicos Islands" },
                new Country() { Name = "Tuvalu" },
                new Country() { Name = "Uganda" },
                new Country() { Name = "Ukraine" },
                new Country() { Name = "United Arab Emirates" },
                new Country() { Name = "United Kingdom" },
                new Country() { Name = "United States" },
                new Country() { Name = "Uruguay" },
                new Country() { Name = "Uzbekistan" },
                new Country() { Name = "Vanuatu" },
                new Country() { Name = "Venezuela" },
                new Country() { Name = "Vietnam" },
                new Country() { Name = "Vatican City State" },
                new Country() { Name = "Virgin Islands (British)" },
                new Country() { Name = "Virgin Islands (U.S.)" },
                new Country() { Name = "Wallis and Futuna Islands" },
                new Country() { Name = "Western Sahara" },
                new Country() { Name = "Yemen" },
                new Country() { Name = "Zambia" },
                new Country() { Name = "Zimbabwe" }
            });

            dbContext.SaveChanges();
            Console.WriteLine("Coutries seeded.");
        }
    }
}
