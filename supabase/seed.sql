-- CineVault sample dataset
-- Run this in the Supabase SQL Editor AFTER schema.sql.
-- Safe to re-run: it clears its own tables first.

truncate table reviews, title_cast, title_genres, titles, cast_members, genres restart identity cascade;

-- ─────────────────────────────────────────────────────────────
-- Genres
-- ─────────────────────────────────────────────────────────────

insert into genres (name) values
  ('Sci-Fi'), ('Action'), ('Drama'), ('Thriller'), ('Animation'), ('Fantasy'),
  ('Crime'), ('Horror'), ('Romance'), ('Musical'), ('Comedy'), ('Adventure'),
  ('Mystery'), ('Music'), ('Family'), ('History'), ('Documentary');

-- ─────────────────────────────────────────────────────────────
-- Titles (36 movies + shows spanning 1972-2022)
-- ─────────────────────────────────────────────────────────────

insert into titles
  (slug, name, type, release_year, runtime_minutes, seasons, critic_score, director, tagline, synopsis, language, country, poster_url, hue, featured)
values
  ('the-matrix', 'The Matrix', 'movie', 1999, 136, null, 8.7, 'Lana & Lilly Wachowski', 'Free your mind.', 'A hacker discovers reality is a simulation and joins a rebellion against its machine architects.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/d/db/The_Matrix.png', 0, true),
  ('inception', 'Inception', 'movie', 2010, 148, null, 8.8, 'Christopher Nolan', 'Your mind is the scene of the crime.', 'A thief who steals secrets through dream-sharing technology is offered a chance to have his criminal history erased.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg', 137, false),
  ('parasite', 'Parasite', 'movie', 2019, 132, null, 8.5, 'Bong Joon-ho', 'Act like you own the place.', 'Greed and class discrimination threaten the newly formed symbiotic relationship between a wealthy family and a destitute one.', 'Korean', 'South Korea', 'https://upload.wikimedia.org/wikipedia/en/5/53/Parasite_%282019_film%29.png', 274, true),
  ('spirited-away', 'Spirited Away', 'movie', 2001, 125, null, 8.6, 'Hayao Miyazaki', 'The stuff of legend.', 'A young girl wanders into a world ruled by gods and spirits, and must find a way to free herself and return home.', 'Japanese', 'Japan', 'https://upload.wikimedia.org/wikipedia/en/d/db/Spirited_Away_Japanese_poster.png', 51, true),
  ('the-godfather', 'The Godfather', 'movie', 1972, 175, null, 9.2, 'Francis Ford Coppola', 'An offer you can''t refuse.', 'The aging patriarch of an organized crime dynasty transfers control to his reluctant son.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg', 188, false),
  ('pulp-fiction', 'Pulp Fiction', 'movie', 1994, 154, null, 8.9, 'Quentin Tarantino', 'You won''t know the facts until you''ve seen the fiction.', 'The lives of two hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg', 325, false),
  ('the-dark-knight', 'The Dark Knight', 'movie', 2008, 152, null, 9.0, 'Christopher Nolan', 'Welcome to a world without rules.', 'Batman raises the stakes in his war on crime as the Joker plunges Gotham into anarchy.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg', 102, false),
  ('get-out', 'Get Out', 'movie', 2017, 104, null, 7.7, 'Jordan Peele', 'Just because you''re invited doesn''t mean you''re welcome.', 'A young man uncovers a disturbing secret when he meets his white girlfriend''s parents for the first time.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/a/a3/Get_Out_poster.png', 239, false),
  ('la-la-land', 'La La Land', 'movie', 2016, 128, null, 8.0, 'Damien Chazelle', 'Here''s to the fools who dream.', 'A jazz pianist and an aspiring actress fall in love while pursuing their dreams in Los Angeles.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png', 16, false),
  ('mad-max-fury-road', 'Mad Max: Fury Road', 'movie', 2015, 120, null, 8.1, 'George Miller', 'What a lovely day.', 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search of her homeland.', 'English', 'Australia', 'https://upload.wikimedia.org/wikipedia/en/6/6e/Mad_Max_Fury_Road.jpg', 153, false),
  ('everything-everywhere-all-at-once', 'Everything Everywhere All at Once', 'movie', 2022, 140, null, 7.8, 'Daniel Kwan & Daniel Scheinert', 'The universe is so much bigger than you realize.', 'An exhausted laundromat owner is swept into an adventure connecting her to parallel universes.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/1/1e/Everything_Everywhere_All_at_Once.jpg', 290, true),
  ('the-grand-budapest-hotel', 'The Grand Budapest Hotel', 'movie', 2014, 99, null, 8.1, 'Wes Anderson', 'A no-holds-barred romp.', 'A legendary concierge and his protégé become embroiled in a murder investigation involving a priceless painting.', 'English', 'Germany', 'https://upload.wikimedia.org/wikipedia/en/1/1c/The_Grand_Budapest_Hotel.png', 67, false),
  ('whiplash', 'Whiplash', 'movie', 2014, 106, null, 8.5, 'Damien Chazelle', 'The road to greatness can take you to the edge.', 'A young drummer enrolls at a cutthroat music conservatory where a ruthless instructor pushes him to his limits.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/0/01/Whiplash_poster.jpg', 204, false),
  ('interstellar', 'Interstellar', 'movie', 2014, 169, null, 8.7, 'Christopher Nolan', 'Mankind was born on Earth. It was never meant to die here.', 'A team of explorers travels through a wormhole in space in an attempt to save humanity.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg', 341, false),
  ('knives-out', 'Knives Out', 'movie', 2019, 130, null, 7.9, 'Rian Johnson', 'Hell, everyone in this family has a motive.', 'A detective investigates the death of a wealthy crime novelist during a gathering of his eccentric family.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/1/1f/Knives_Out_poster.jpeg', 118, false),
  ('jaws', 'Jaws', 'movie', 1975, 124, null, 8.0, 'Steven Spielberg', 'Don''t go in the water.', 'A giant great white shark terrorizes a small beach town, forcing the sheriff to hunt it down.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/commons/4/40/Jaws_movie_poster.jpg', 255, false),
  ('alien', 'Alien', 'movie', 1979, 117, null, 8.5, 'Ridley Scott', 'In space no one can hear you scream.', 'The crew of a commercial spacecraft encounter a deadly lifeform after investigating a mysterious signal.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/c/c3/Alien_movie_poster.jpg', 32, false),
  ('coco', 'Coco', 'movie', 2017, 105, null, 8.4, 'Lee Unkrich', 'The celebration of a lifetime.', 'A boy is transported to the Land of the Dead and uncovers the true story behind his family''s ancestral history.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg', 169, false),
  ('the-shawshank-redemption', 'The Shawshank Redemption', 'movie', 1994, 142, null, 9.3, 'Frank Darabont', 'Fear can hold you prisoner. Hope can set you free.', 'Two imprisoned men bond over years, finding solace and eventual redemption through acts of common decency.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg', 306, false),
  ('fight-club', 'Fight Club', 'movie', 1999, 139, null, 8.8, 'David Fincher', 'Mischief. Mayhem. Soap.', 'An insomniac office worker and a soap maker form an underground fight club that spirals into something much bigger.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg', 83, false),
  ('amelie', 'Amélie', 'movie', 2001, 122, null, 8.3, 'Jean-Pierre Jeunet', 'One person can change your life forever.', 'A shy waitress secretly orchestrates small acts of kindness that transform the lives of those around her.', 'French', 'France', 'https://upload.wikimedia.org/wikipedia/en/5/53/Amelie_poster.jpg', 220, false),
  ('city-of-god', 'City of God', 'movie', 2002, 130, null, 8.6, 'Fernando Meirelles', 'If you run, the beast catches you. If you stay, the beast eats you.', 'Two boys growing up in a violent Rio de Janeiro slum take vastly different paths in life.', 'Portuguese', 'Brazil', 'https://upload.wikimedia.org/wikipedia/en/1/10/CidadedeDeus.jpg', 357, false),
  ('your-name', 'Your Name', 'movie', 2016, 106, null, 8.4, 'Makoto Shinkai', 'They are searching for each other, even in their dreams.', 'Two teenagers discover they are mysteriously swapping bodies, forming a bond that crosses time and space.', 'Japanese', 'Japan', 'https://upload.wikimedia.org/wikipedia/en/0/0b/Your_Name_poster.png', 134, false),
  ('breaking-bad', 'Breaking Bad', 'tv', 2008, null, 5, 9.5, 'Vince Gilligan', 'All hail the king.', 'A chemistry teacher turned methamphetamine manufacturer builds a criminal empire to secure his family''s future.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/1/1d/Breaking_Bad_promo.jpg', 271, true),
  ('game-of-thrones', 'Game of Thrones', 'tv', 2011, null, 8, 9.2, 'David Benioff & D. B. Weiss', 'Winter is coming.', 'Nine noble families wage war against each other for control of the mythical land of Westeros, while an ancient enemy returns after being dormant for thousands of years.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/d/d1/Game_of_Thrones_Season_6.jpeg', 48, true),
  ('stranger-things', 'Stranger Things', 'tv', 2016, null, 4, 8.7, 'The Duffer Brothers', 'Every ending has a beginning.', 'A group of kids uncover supernatural mysteries and government secrets in their small town.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/7/78/Stranger_Things_season_4.jpg', 185, false),
  ('squid-game', 'Squid Game', 'tv', 2021, null, 3, 8.0, 'Hwang Dong-hyuk', 'Every game has a price.', 'Hundreds of cash-strapped players accept a strange invitation to compete in children''s games for a tempting cash prize, at deadly stakes.', 'Korean', 'South Korea', 'https://upload.wikimedia.org/wikipedia/en/7/7b/Squid_Game_season_1_poster.png', 322, false),
  ('chernobyl', 'Chernobyl', 'tv', 2019, null, 1, 9.4, 'Craig Mazin', 'What is the cost of lies?', 'A dramatization of the true story of one of the worst nuclear disasters and the sacrifices made to save Europe.', 'English', 'UK', 'https://upload.wikimedia.org/wikipedia/en/a/a7/Chernobyl_2019_Miniseries.jpg', 99, false),
  ('the-handmaids-tale', 'The Handmaid''s Tale', 'tv', 2017, null, 6, 8.4, 'Bruce Miller', 'Blessed be the fruit.', 'In a dystopian future, a woman is forced to live as a concubine under a fundamentalist theocratic dictatorship, and fights to survive and reclaim her freedom.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/4/4e/Handmaids_tale.jpg', 236, false),
  ('avatar-the-last-airbender', 'Avatar: The Last Airbender', 'tv', 2005, null, 3, 9.3, 'Bryan Konietzko & Michael Dante DiMartino', 'Water. Earth. Fire. Air.', 'A young boy awakens after a century to fulfill his destiny as the Avatar who must bring balance to the world.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/c/ca/Avatar_Aang_The_Last_Airbender_poster.jpg', 13, false),
  ('peaky-blinders', 'Peaky Blinders', 'tv', 2013, null, 6, 8.8, 'Steven Knight', 'By order of the Peaky Blinders.', 'A gangster family epic set in 1900s England, centering on a gang who sew razor blades into the peaks of their caps, and their ambitious boss Tommy Shelby.', 'English', 'UK', 'https://upload.wikimedia.org/wikipedia/en/b/bf/Peaky_Blinders_-_The_Immortal_Man_poster.jpg', 150, false),
  ('succession', 'Succession', 'tv', 2018, null, 4, 8.8, 'Jesse Armstrong', 'The house always wins.', 'The Roy family fights for control of their global media empire as their aging patriarch''s health declines.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/3/3f/Succession_season_1.jpg', 287, false),
  ('bojack-horseman', 'BoJack Horseman', 'tv', 2014, null, 6, 8.5, 'Raphael Bob-Waksberg', 'Hollywoo, here we go.', 'A washed-up, anthropomorphic horse sitcom star navigates fame, addiction, and depression while trying to turn his life around.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/6/6f/BoJack_Horseman_season_1.png', 64, false),
  ('planet-earth-ii', 'Planet Earth II', 'tv', 2016, null, 1, 9.5, 'BBC Natural History Unit', 'The world as you have never seen it before.', 'A landmark nature documentary capturing wildlife across every continent in unprecedented detail.', 'English', 'UK', 'https://upload.wikimedia.org/wikipedia/en/b/ba/Planet_Earth_II.png', 201, false),
  ('portrait-of-a-lady-on-fire', 'Portrait of a Lady on Fire', 'movie', 2019, 122, null, 8.1, 'Céline Sciamma', 'Do all lovers feel like they are inventing something?', 'A painter falls for the reluctant bride-to-be she has been commissioned to paint in secret.', 'French', 'France', 'https://upload.wikimedia.org/wikipedia/en/c/cb/Portrait_of_a_Lady_on_Fire.jpg', 338, false),
  ('spider-man-into-the-spider-verse', 'Spider-Man: Into the Spider-Verse', 'movie', 2018, 117, null, 8.4, 'Bob Persichetti, Peter Ramsey & Rodney Rothman', 'More than one wears the mask.', 'A teenager from Brooklyn becomes Spider-Man alongside five counterparts from across the multiverse.', 'English', 'USA', 'https://upload.wikimedia.org/wikipedia/en/f/fa/Spider-Man_Into_the_Spider-Verse_poster.png', 115, false);

-- ─────────────────────────────────────────────────────────────
-- Title <-> Genre links
-- ─────────────────────────────────────────────────────────────

insert into title_genres (title_id, genre_id)
select t.id, g.id
from (values
  ('the-matrix', 'Sci-Fi'), ('the-matrix', 'Action'),
  ('inception', 'Sci-Fi'), ('inception', 'Thriller'),
  ('parasite', 'Drama'), ('parasite', 'Thriller'),
  ('spirited-away', 'Animation'), ('spirited-away', 'Fantasy'),
  ('the-godfather', 'Crime'), ('the-godfather', 'Drama'),
  ('pulp-fiction', 'Crime'), ('pulp-fiction', 'Drama'),
  ('the-dark-knight', 'Action'), ('the-dark-knight', 'Crime'),
  ('get-out', 'Horror'), ('get-out', 'Thriller'),
  ('la-la-land', 'Romance'), ('la-la-land', 'Musical'),
  ('mad-max-fury-road', 'Action'), ('mad-max-fury-road', 'Sci-Fi'),
  ('everything-everywhere-all-at-once', 'Sci-Fi'), ('everything-everywhere-all-at-once', 'Comedy'),
  ('the-grand-budapest-hotel', 'Comedy'), ('the-grand-budapest-hotel', 'Adventure'),
  ('whiplash', 'Drama'), ('whiplash', 'Music'),
  ('interstellar', 'Sci-Fi'), ('interstellar', 'Drama'),
  ('knives-out', 'Mystery'), ('knives-out', 'Comedy'),
  ('jaws', 'Thriller'), ('jaws', 'Adventure'),
  ('alien', 'Sci-Fi'), ('alien', 'Horror'),
  ('coco', 'Animation'), ('coco', 'Family'),
  ('the-shawshank-redemption', 'Drama'),
  ('fight-club', 'Drama'), ('fight-club', 'Thriller'),
  ('amelie', 'Romance'), ('amelie', 'Comedy'),
  ('city-of-god', 'Crime'), ('city-of-god', 'Drama'),
  ('your-name', 'Animation'), ('your-name', 'Romance'),
  ('breaking-bad', 'Crime'), ('breaking-bad', 'Drama'),
  ('game-of-thrones', 'Fantasy'), ('game-of-thrones', 'Drama'), ('game-of-thrones', 'Action'),
  ('stranger-things', 'Sci-Fi'), ('stranger-things', 'Horror'),
  ('squid-game', 'Thriller'), ('squid-game', 'Drama'), ('squid-game', 'Mystery'),
  ('chernobyl', 'Drama'), ('chernobyl', 'History'),
  ('the-handmaids-tale', 'Drama'), ('the-handmaids-tale', 'Thriller'),
  ('avatar-the-last-airbender', 'Animation'), ('avatar-the-last-airbender', 'Adventure'),
  ('peaky-blinders', 'Crime'), ('peaky-blinders', 'Drama'), ('peaky-blinders', 'History'),
  ('succession', 'Drama'), ('succession', 'Comedy'),
  ('bojack-horseman', 'Animation'), ('bojack-horseman', 'Comedy'), ('bojack-horseman', 'Drama'),
  ('planet-earth-ii', 'Documentary'),
  ('portrait-of-a-lady-on-fire', 'Romance'), ('portrait-of-a-lady-on-fire', 'Drama'),
  ('spider-man-into-the-spider-verse', 'Animation'), ('spider-man-into-the-spider-verse', 'Action')
) as x(slug, genre_name)
join titles t on t.slug = x.slug
join genres g on g.name = x.genre_name;

-- ─────────────────────────────────────────────────────────────
-- Cast members + title <-> cast links
-- ─────────────────────────────────────────────────────────────

insert into cast_members (name, photo_url) values
  ('Aaron Eckhart', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Aaron_Eckhart_%2829830286295%29_%28cropped%29.jpg/330px-Aaron_Eckhart_%2829830286295%29_%28cropped%29.jpg'),
  ('Aaron Paul', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Aaron_Paul_-_AMC_The_Grove_-_Ash.jpg/330px-Aaron_Paul_-_AMC_The_Grove_-_Ash.jpg'),
  ('Adèle Haenel', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Ad%C3%A8le_Haenel_Cannes_2017.jpg/330px-Ad%C3%A8le_Haenel_Cannes_2017.jpg'),
  ('Al Pacino', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Al_Pacino_-_Killing_Castro_-_Q%26A_-_Tribeca_2026_-_by_%40JJxFile-23_%28cropped%29.jpg/330px-Al_Pacino_-_Killing_Castro_-_Q%26A_-_Tribeca_2026_-_by_%40JJxFile-23_%28cropped%29.jpg'),
  ('Alexandre Rodrigues', null),
  ('Allison Williams', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Allison_Williams_DSM-11_%28cropped%29.jpg/330px-Allison_Williams_DSM-11_%28cropped%29.jpg'),
  ('Amy Sedaris', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Amy_Sedaris_Is_This_Thing_On-56_%28cropped%29.jpg/330px-Amy_Sedaris_Is_This_Thing_On-56_%28cropped%29.jpg'),
  ('Ana de Armas', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Ana_de_Armas_%2854462619561%29_%28cropped_3%29.jpg/330px-Ana_de_Armas_%2854462619561%29_%28cropped_3%29.jpg'),
  ('Anna Gunn', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Anna_Gunn_by_Gage_Skidmore_3.jpg/330px-Anna_Gunn_by_Gage_Skidmore_3.jpg'),
  ('Anne Hathaway', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Anne_Hathaway-_Press_conference_for_the_film_%22The_Devil_Wears_Prada_2%22_-_55194764955_%28cropped%29.jpg/330px-Anne_Hathaway-_Press_conference_for_the_film_%22The_Devil_Wears_Prada_2%22_-_55194764955_%28cropped%29.jpg'),
  ('Anthony Gonzalez', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Anthony_Gonzalez_2025.jpg/330px-Anthony_Gonzalez_2025.jpg'),
  ('Audrey Tautou', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Audrey_Tautou_Berlin_2015.jpg/330px-Audrey_Tautou_Berlin_2015.jpg'),
  ('Benjamin Bratt', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Benjamin_Bratt_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/330px-Benjamin_Bratt_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg'),
  ('Bob Gunton', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Bob_Gunton%2C_1963_senior_photo.jpg/330px-Bob_Gunton%2C_1963_senior_photo.jpg'),
  ('Brad Pitt', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Brad_Pitt-69858.jpg/330px-Brad_Pitt-69858.jpg'),
  ('Brian Cox', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Brian_Cox_Edinburgh_2025.jpg/330px-Brian_Cox_Edinburgh_2025.jpg'),
  ('Bryan Cranston', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/BryanCranston-byPhilipRomano_%28cropped%29.jpg/330px-BryanCranston-byPhilipRomano_%28cropped%29.jpg'),
  ('Carrie-Anne Moss', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Carrie-Anne_Moss_May_2016.jpg/330px-Carrie-Anne_Moss_May_2016.jpg'),
  ('Catherine Keener', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Catherine_Keener_-_The_40-Year-Old-Virgin.jpg/330px-Catherine_Keener_-_The_40-Year-Old-Virgin.jpg'),
  ('Charlize Theron', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/CharlizeTheron-byPhilipRomano2.jpg/330px-CharlizeTheron-byPhilipRomano2.jpg'),
  ('Cho Yeo-jeong', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Cho_Yeo-jeong_%28cropped%29.jpg/330px-Cho_Yeo-jeong_%28cropped%29.jpg'),
  ('Chris Evans', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Chris_Evans_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg/330px-Chris_Evans_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg'),
  ('Christian Bale', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Christian_Bale-7837.jpg/330px-Christian_Bale-7837.jpg'),
  ('Cillian Murphy', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Cillian_Murphy_at_the_London_premier_of_Steve_in_September_2025_%28cropped%29.jpg/330px-Cillian_Murphy_at_the_London_premier_of_Steve_in_September_2025_%28cropped%29.jpg'),
  ('Daniel Craig', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Daniel_Craig_TIFF_2025_Red_Carpet_%28cropped%29.jpg/330px-Daniel_Craig_TIFF_2025_Red_Carpet_%28cropped%29.jpg'),
  ('Daniel Kaluuya', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Daniel-kaluuya-cc-by-sa-4.0-capitalfm-crop-enhance-20220804.jpg/330px-Daniel-kaluuya-cc-by-sa-4.0-capitalfm-crop-enhance-20220804.jpg'),
  ('David Attenborough', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/David_Attenborough_in_2025.jpg/330px-David_Attenborough_in_2025.jpg'),
  ('Edward Norton', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Ed_Norton_and_Shauna_Robertson_TIFF_2025_%28cropped%29.jpg/330px-Ed_Norton_and_Shauna_Robertson_TIFF_2025_%28cropped%29.jpg'),
  ('Elisabeth Moss', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Elisabeth_Moss_2026_%28cropped%29.jpg/330px-Elisabeth_Moss_2026_%28cropped%29.jpg'),
  ('Elliot Page', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Elliot_Page_2026.jpg/330px-Elliot_Page_2026.jpg'),
  ('Emilia Clarke', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Emilia_Clarke_at_the_2023_Harper%27s_Bazaar_Women_of_the_Year_Awards.jpg/330px-Emilia_Clarke_at_the_2023_Harper%27s_Bazaar_Women_of_the_Year_Awards.jpg'),
  ('Emily Watson', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Emily_Watson.jpg/330px-Emily_Watson.jpg'),
  ('Emma Stone', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Emma_Stone_at_the_2025_Venice_Film_Festival-6313_%28cropped%29.jpg/330px-Emma_Stone_at_the_2025_Venice_Film_Festival-6313_%28cropped%29.jpg'),
  ('Finn Wolfhard', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Stranger_Things_cast_2025_%282%29_%28cropped%29.png/330px-Stranger_Things_cast_2025_%282%29_%28cropped%29.png'),
  ('Gael García Bernal', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/MKr386832_Gael_Garc%C3%ADa_Bernal_%28Amores_Perros%2C_Cannes_2025%29.jpg/330px-MKr386832_Gael_Garc%C3%ADa_Bernal_%28Amores_Perros%2C_Cannes_2025%29.jpg'),
  ('Hailee Steinfeld', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Hailee_Steinfeld_by_Gage_Skidmore.jpg/330px-Hailee_Steinfeld_by_Gage_Skidmore.jpg'),
  ('Heath Ledger', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Heath_Ledger_%282%29.jpg/330px-Heath_Ledger_%282%29.jpg'),
  ('Helen McCrory', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Helen_McCrory_2017_%28Extract%29.jpg/330px-Helen_McCrory_2017_%28Extract%29.jpg'),
  ('Helena Bonham Carter', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/MerchantIvoryCurzMayfair201124_%2816_of_28%29_%2854154554145%29_%28cropped%29.jpg/330px-MerchantIvoryCurzMayfair201124_%2816_of_28%29_%2854154554145%29_%28cropped%29.jpg'),
  ('Ian Holm', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Ian_Holm.jpg/330px-Ian_Holm.jpg'),
  ('J.K. Simmons', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/JK_Simmons_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/330px-JK_Simmons_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg'),
  ('Jack DeSena', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Jack_De_Sena_at_Animate%21_Raleigh_2026_%2855151994061%29.jpg/330px-Jack_De_Sena_at_Animate%21_Raleigh_2026_%2855151994061%29.jpg'),
  ('Jake Johnson', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Jake_Johnson_-_Maximum_Pleasure_Guaranteed.jpg/330px-Jake_Johnson_-_Maximum_Pleasure_Guaranteed.jpg'),
  ('James Caan', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/85/James_Caan_-_1972.jpg/330px-James_Caan_-_1972.jpg'),
  ('Jared Harris', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Jared_Harris_A_House_of_Dynamite-08_%28cropped%29.jpg/330px-Jared_Harris_A_House_of_Dynamite-08_%28cropped%29.jpg'),
  ('Jeremy Strong', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Jeremy_Strong_Springsteen-48.jpg/330px-Jeremy_Strong_Springsteen-48.jpg'),
  ('Jessica Chastain', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Jessica_Chastain-64631_%28cropped%29.jpg/330px-Jessica_Chastain-64631_%28cropped%29.jpg'),
  ('John Legend', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/JohnLegend-byPhilipRomano.jpg/330px-JohnLegend-byPhilipRomano.jpg'),
  ('John Travolta', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/John_Travolta_in_2024_%28cropped%29.jpg/330px-John_Travolta_in_2024_%28cropped%29.jpg'),
  ('Joseph Fiennes', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Joseph_Fiennes_%2843622434151%29.jpg/330px-Joseph_Fiennes_%2843622434151%29.jpg'),
  ('Joseph Gordon-Levitt', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Joseph_Gordon_Levitt_Sundance_Film_Festival_2026_%28cropped%29.jpg/330px-Joseph_Gordon_Levitt_Sundance_Film_Festival_2026_%28cropped%29.jpg'),
  ('Jung Ho-yeon', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/HoYeon_Jung.jpg/330px-HoYeon_Jung.jpg'),
  ('Ke Huy Quan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Ke_Huy_Quan_at_the_White_House_%2852902390767%29_%28cropped%29.jpg/330px-Ke_Huy_Quan_at_the_White_House_%2852902390767%29_%28cropped%29.jpg'),
  ('Keanu Reeves', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg/330px-Keanu_Reeves_at_TIFF_2025_02_%28Cropped%29.jpg'),
  ('Kit Harington', 'https://upload.wikimedia.org/wikipedia/commons/3/32/Kit_harrington_by_sachyn_mital_%28cropped_2%29.jpg'),
  ('Laurence Fishburne', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Laurence_Fishburne_at_53rd_Saturn_Awards_2026.jpg/330px-Laurence_Fishburne_at_53rd_Saturn_Awards_2026.jpg'),
  ('Lee Jung-jae', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/240305_Lee_Jung-jae_%28cropped%29.jpg/330px-240305_Lee_Jung-jae_%28cropped%29.jpg'),
  ('Lee Sun-kyun', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Lee_Seon-gun_in_Oct_2018.png/330px-Lee_Seon-gun_in_Oct_2018.png'),
  ('Leonardo DiCaprio', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/LeoPTABFI191125-28_%28cropped%29.jpg/330px-LeoPTABFI191125-28_%28cropped%29.jpg'),
  ('Luàna Bajrami', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Lu%C3%A0na_Bajrami.jpg/330px-Lu%C3%A0na_Bajrami.jpg'),
  ('Mae Whitman', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Mae_Whitman_%2853080274298%29.jpg/330px-Mae_Whitman_%2853080274298%29.jpg'),
  ('Mari Natsuki', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/MJK_08427_Mari_Natsuki_%28Berlinale_2018%29.jpg/330px-MJK_08427_Mari_Natsuki_%28Berlinale_2018%29.jpg'),
  ('Marlon Brando', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Marlon_Brando_publicity_for_One-Eyed_Jacks.png/330px-Marlon_Brando_publicity_for_One-Eyed_Jacks.png'),
  ('Mathieu Kassovitz', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Mathieu_Kassovitz_Cannes_2017.jpg/330px-Mathieu_Kassovitz_Cannes_2017.jpg'),
  ('Matthew McConaughey', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Matthew_McConaughey_at_the_2025_Toronto_Film_Festival_%28Cropped%29.jpg/330px-Matthew_McConaughey_at_the_2025_Toronto_Film_Festival_%28Cropped%29.jpg'),
  ('Melissa Benoist', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Melissa_Benoist_%2848477063086%29_%28cropped%29.jpg/330px-Melissa_Benoist_%2848477063086%29_%28cropped%29.jpg'),
  ('Michelle Yeoh', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Michelle_Yeoh-2268.jpg/330px-Michelle_Yeoh-2268.jpg'),
  ('Miles Teller', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Miles_Teller_TIFF_2025_%283x4_cropped%29.png/330px-Miles_Teller_TIFF_2025_%283x4_cropped%29.png'),
  ('Millie Bobby Brown', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Millie_Bobby_Brown_2025_%281%29.png/330px-Millie_Bobby_Brown_2025_%281%29.png'),
  ('Miyu Irino', null),
  ('Mone Kamishiraishi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Mone_Kamishiraishi_head_shot.jpg/330px-Mone_Kamishiraishi_head_shot.jpg'),
  ('Morgan Freeman', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Morgan_Freeman_at_The_Pentagon_on_2_August_2023_-_230802-D-PM193-3363_%28cropped%29.jpg/330px-Morgan_Freeman_at_The_Pentagon_on_2_August_2023_-_230802-D-PM193-3363_%28cropped%29.jpg'),
  ('Nicholas Hoult', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Nicholas_Hoult-67849_%28cropped%29.jpg/330px-Nicholas_Hoult-67849_%28cropped%29.jpg'),
  ('Noémie Merlant', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Noemie_Merlant_BalconettesBFILFF151024_%281_of_33%29_%2854070028551%29_%28cropped%29.jpg/330px-Noemie_Merlant_BalconettesBFILFF151024_%281_of_33%29_%2854070028551%29_%28cropped%29.jpg'),
  ('Park Hae-soo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/20221012_Park_Hae-soo_%28%EB%B0%95%ED%95%B4%EC%88%98%29_BIFF_Asia_Star_Awards_%281%29_cropped.jpg/330px-20221012_Park_Hae-soo_%28%EB%B0%95%ED%95%B4%EC%88%98%29_BIFF_Asia_Star_Awards_%281%29_cropped.jpg'),
  ('Paul Anderson', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Paul_Anderson_2026_%2855268093833%29_%28cropped%29.jpg/330px-Paul_Anderson_2026_%2855268093833%29_%28cropped%29.jpg'),
  ('Peter Dinklage', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Peter_Dinklage_by_Gage_Skidmore_2.jpg/330px-Peter_Dinklage_by_Gage_Skidmore_2.jpg'),
  ('Phellipe Haagensen', null),
  ('Ralph Fiennes', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Ralph_Fiennes_2024.jpg/330px-Ralph_Fiennes_2024.jpg'),
  ('Richard Dreyfuss', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Richard_Dreyfuss_%2853303254573%29.jpg/330px-Richard_Dreyfuss_%2853303254573%29.jpg'),
  ('Robert Shaw', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Robert_Shaw.jpg/330px-Robert_Shaw.jpg'),
  ('Roy Scheider', 'https://upload.wikimedia.org/wikipedia/commons/3/33/Roy_Scheider_2007.jpg'),
  ('Rufus', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Rufus_Cabourg_2016.jpg/330px-Rufus_Cabourg_2016.jpg'),
  ('Rumi Hiiragi', null),
  ('Ryan Gosling', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/GoslingBFI081223_%2822_of_30%29_%2853388157347%29_%28cropped%29.jpg/330px-GoslingBFI081223_%2822_of_30%29_%2853388157347%29_%28cropped%29.jpg'),
  ('Ryo Narita', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Narita_Ryo_from_%22Lust_in_the_Rain%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2024_%2854578000506%29.jpg/330px-Narita_Ryo_from_%22Lust_in_the_Rain%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2024_%2854578000506%29.jpg'),
  ('Ryunosuke Kamiki', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Kamiki_Ryunosuke_from_%22Godzilla_Minus_One%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2023_%2853347030212%29_-_cropped.jpg/330px-Kamiki_Ryunosuke_from_%22Godzilla_Minus_One%22_at_Red_Carpet_of_the_Tokyo_International_Film_Festival_2023_%2853347030212%29_-_cropped.jpg'),
  ('Samuel L. Jackson', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/SamuelLJackson.jpg/330px-SamuelLJackson.jpg'),
  ('Saoirse Ronan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/MKr349648_Saoirse_Ronan_%28The_Outrun%2C_Berlinale_2024%29.jpg/330px-MKr349648_Saoirse_Ronan_%28The_Outrun%2C_Berlinale_2024%29.jpg'),
  ('Sarah Snook', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/SarahSnook-byPhilipRomano3_%28cropped%29.jpg/330px-SarahSnook-byPhilipRomano3_%28cropped%29.jpg'),
  ('Shameik Moore', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Shameik_Moore_Photo_Op_GalaxyCon_Raleigh_2023.jpg/330px-Shameik_Moore_Photo_Op_GalaxyCon_Raleigh_2023.jpg'),
  ('Sigourney Weaver', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Sigourney_Weaver_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg/330px-Sigourney_Weaver_at_the_2025_Toronto_International_Film_Festival_%28cropped%29.jpg'),
  ('Song Kang-ho', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Song_Gangho_2016.jpg/330px-Song_Gangho_2016.jpg'),
  ('Stellan Skarsgård', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Stellan_Skarsg%C3%A5rd-9707_%28cropped%29.jpg/330px-Stellan_Skarsg%C3%A5rd-9707_%28cropped%29.jpg'),
  ('Stephanie Hsu', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Stephanie_Hsu_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg/330px-Stephanie_Hsu_at_the_2024_Toronto_International_Film_Festival_%28cropped%29.jpg'),
  ('Tim Robbins', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Tim_Robbins_%28Berlin_Film_Festival_2013%29.jpg/330px-Tim_Robbins_%28Berlin_Film_Festival_2013%29.jpg'),
  ('Tom Hardy', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Tom_Hardy_%2841869508740%29.jpg/330px-Tom_Hardy_%2841869508740%29.jpg'),
  ('Tom Skerritt', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Tom_Skerritt_at_the_2024_Chicago_Comic_and_Entertainment_Exposition.jpg/330px-Tom_Skerritt_at_the_2024_Chicago_Comic_and_Entertainment_Exposition.jpg'),
  ('Tony Revolori', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Tony_Revolori_by_Gage_Skidmore.jpg/330px-Tony_Revolori_by_Gage_Skidmore.jpg'),
  ('Uma Thurman', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/UmaThurman-byPhilipRomano.jpg/330px-UmaThurman-byPhilipRomano.jpg'),
  ('Will Arnett', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Will_Arnett_Is_This_Thing_On-11_%28cropped%29.jpg/330px-Will_Arnett_Is_This_Thing_On-11_%28cropped%29.jpg'),
  ('Winona Ryder', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Winona_Ryder-63849.jpg/330px-Winona_Ryder-63849.jpg'),
  ('Yvonne Strahovski', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Yvonne_Strahovski_at_Nerd_HQ_2014_%28cropped%29.jpg/330px-Yvonne_Strahovski_at_Nerd_HQ_2014_%28cropped%29.jpg'),
  ('Zach Tyler Eisen', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Zack_Tyler_Eisen_at_Animate%21_Raleigh_%2855168634758%29.jpg/330px-Zack_Tyler_Eisen_at_Animate%21_Raleigh_%2855168634758%29.jpg');

insert into title_cast (title_id, person_id, character_name, sort_order)
select t.id, p.id, x.character_name, x.sort_order
from (values
  ('the-matrix', 'Keanu Reeves', 'Neo', 1), ('the-matrix', 'Laurence Fishburne', 'Morpheus', 2), ('the-matrix', 'Carrie-Anne Moss', 'Trinity', 3),
  ('inception', 'Leonardo DiCaprio', 'Cobb', 1), ('inception', 'Joseph Gordon-Levitt', 'Arthur', 2), ('inception', 'Elliot Page', 'Ariadne', 3),
  ('parasite', 'Song Kang-ho', 'Ki-taek', 1), ('parasite', 'Lee Sun-kyun', 'Park Dong-ik', 2), ('parasite', 'Cho Yeo-jeong', 'Yeon-kyo', 3),
  ('spirited-away', 'Rumi Hiiragi', 'Chihiro (voice)', 1), ('spirited-away', 'Miyu Irino', 'Haku (voice)', 2), ('spirited-away', 'Mari Natsuki', 'Yubaba (voice)', 3),
  ('the-godfather', 'Marlon Brando', 'Vito Corleone', 1), ('the-godfather', 'Al Pacino', 'Michael Corleone', 2), ('the-godfather', 'James Caan', 'Sonny Corleone', 3),
  ('pulp-fiction', 'John Travolta', 'Vincent Vega', 1), ('pulp-fiction', 'Samuel L. Jackson', 'Jules Winnfield', 2), ('pulp-fiction', 'Uma Thurman', 'Mia Wallace', 3),
  ('the-dark-knight', 'Christian Bale', 'Bruce Wayne', 1), ('the-dark-knight', 'Heath Ledger', 'Joker', 2), ('the-dark-knight', 'Aaron Eckhart', 'Harvey Dent', 3),
  ('get-out', 'Daniel Kaluuya', 'Chris Washington', 1), ('get-out', 'Allison Williams', 'Rose Armitage', 2), ('get-out', 'Catherine Keener', 'Missy Armitage', 3),
  ('la-la-land', 'Ryan Gosling', 'Sebastian', 1), ('la-la-land', 'Emma Stone', 'Mia', 2), ('la-la-land', 'John Legend', 'Keith', 3),
  ('mad-max-fury-road', 'Tom Hardy', 'Max Rockatansky', 1), ('mad-max-fury-road', 'Charlize Theron', 'Furiosa', 2), ('mad-max-fury-road', 'Nicholas Hoult', 'Nux', 3),
  ('everything-everywhere-all-at-once', 'Michelle Yeoh', 'Evelyn Wang', 1), ('everything-everywhere-all-at-once', 'Ke Huy Quan', 'Waymond Wang', 2), ('everything-everywhere-all-at-once', 'Stephanie Hsu', 'Joy Wang', 3),
  ('the-grand-budapest-hotel', 'Ralph Fiennes', 'M. Gustave', 1), ('the-grand-budapest-hotel', 'Tony Revolori', 'Zero Moustafa', 2), ('the-grand-budapest-hotel', 'Saoirse Ronan', 'Agatha', 3),
  ('whiplash', 'Miles Teller', 'Andrew Neiman', 1), ('whiplash', 'J.K. Simmons', 'Terence Fletcher', 2), ('whiplash', 'Melissa Benoist', 'Nicole', 3),
  ('interstellar', 'Matthew McConaughey', 'Cooper', 1), ('interstellar', 'Anne Hathaway', 'Brand', 2), ('interstellar', 'Jessica Chastain', 'Murph', 3),
  ('knives-out', 'Daniel Craig', 'Benoit Blanc', 1), ('knives-out', 'Ana de Armas', 'Marta Cabrera', 2), ('knives-out', 'Chris Evans', 'Ransom Drysdale', 3),
  ('jaws', 'Roy Scheider', 'Chief Brody', 1), ('jaws', 'Robert Shaw', 'Quint', 2), ('jaws', 'Richard Dreyfuss', 'Hooper', 3),
  ('alien', 'Sigourney Weaver', 'Ripley', 1), ('alien', 'Tom Skerritt', 'Dallas', 2), ('alien', 'Ian Holm', 'Ash', 3),
  ('coco', 'Anthony Gonzalez', 'Miguel (voice)', 1), ('coco', 'Gael García Bernal', 'Héctor (voice)', 2), ('coco', 'Benjamin Bratt', 'Ernesto (voice)', 3),
  ('the-shawshank-redemption', 'Tim Robbins', 'Andy Dufresne', 1), ('the-shawshank-redemption', 'Morgan Freeman', 'Red', 2), ('the-shawshank-redemption', 'Bob Gunton', 'Warden Norton', 3),
  ('fight-club', 'Edward Norton', 'The Narrator', 1), ('fight-club', 'Brad Pitt', 'Tyler Durden', 2), ('fight-club', 'Helena Bonham Carter', 'Marla Singer', 3),
  ('amelie', 'Audrey Tautou', 'Amélie Poulain', 1), ('amelie', 'Mathieu Kassovitz', 'Nino Quincampoix', 2), ('amelie', 'Rufus', 'Raphaël Poulain', 3),
  ('city-of-god', 'Alexandre Rodrigues', 'Rocket', 1), ('city-of-god', 'Leandro Firmino', 'Li''l Zé', 2), ('city-of-god', 'Phellipe Haagensen', 'Benny', 3),
  ('your-name', 'Ryunosuke Kamiki', 'Taki (voice)', 1), ('your-name', 'Mone Kamishiraishi', 'Mitsuha (voice)', 2), ('your-name', 'Ryo Narita', 'Tessie (voice)', 3),
  ('breaking-bad', 'Bryan Cranston', 'Walter White', 1), ('breaking-bad', 'Aaron Paul', 'Jesse Pinkman', 2), ('breaking-bad', 'Anna Gunn', 'Skyler White', 3),
  ('game-of-thrones', 'Emilia Clarke', 'Daenerys Targaryen', 1), ('game-of-thrones', 'Kit Harington', 'Jon Snow', 2), ('game-of-thrones', 'Peter Dinklage', 'Tyrion Lannister', 3),
  ('stranger-things', 'Millie Bobby Brown', 'Eleven', 1), ('stranger-things', 'Finn Wolfhard', 'Mike Wheeler', 2), ('stranger-things', 'Winona Ryder', 'Joyce Byers', 3),
  ('squid-game', 'Lee Jung-jae', 'Seong Gi-hun', 1), ('squid-game', 'Park Hae-soo', 'Cho Sang-woo', 2), ('squid-game', 'Jung Ho-yeon', 'Kang Sae-byeok', 3),
  ('chernobyl', 'Jared Harris', 'Valery Legasov', 1), ('chernobyl', 'Stellan Skarsgård', 'Boris Shcherbina', 2), ('chernobyl', 'Emily Watson', 'Ulana Khomyuk', 3),
  ('the-handmaids-tale', 'Elisabeth Moss', 'June Osborne', 1), ('the-handmaids-tale', 'Joseph Fiennes', 'Commander Waterford', 2), ('the-handmaids-tale', 'Yvonne Strahovski', 'Serena Joy', 3),
  ('avatar-the-last-airbender', 'Zach Tyler Eisen', 'Aang (voice)', 1), ('avatar-the-last-airbender', 'Mae Whitman', 'Katara (voice)', 2), ('avatar-the-last-airbender', 'Jack DeSena', 'Sokka (voice)', 3),
  ('peaky-blinders', 'Cillian Murphy', 'Tommy Shelby', 1), ('peaky-blinders', 'Paul Anderson', 'Arthur Shelby', 2), ('peaky-blinders', 'Helen McCrory', 'Polly Gray', 3),
  ('succession', 'Brian Cox', 'Logan Roy', 1), ('succession', 'Jeremy Strong', 'Kendall Roy', 2), ('succession', 'Sarah Snook', 'Shiv Roy', 3),
  ('bojack-horseman', 'Will Arnett', 'BoJack Horseman (voice)', 1), ('bojack-horseman', 'Amy Sedaris', 'Princess Carolyn (voice)', 2), ('bojack-horseman', 'Aaron Paul', 'Todd Chavez (voice)', 3),
  ('planet-earth-ii', 'David Attenborough', 'Narrator', 1),
  ('portrait-of-a-lady-on-fire', 'Noémie Merlant', 'Marianne', 1), ('portrait-of-a-lady-on-fire', 'Adèle Haenel', 'Héloïse', 2), ('portrait-of-a-lady-on-fire', 'Luàna Bajrami', 'Sophie', 3),
  ('spider-man-into-the-spider-verse', 'Shameik Moore', 'Miles Morales (voice)', 1), ('spider-man-into-the-spider-verse', 'Jake Johnson', 'Peter B. Parker (voice)', 2), ('spider-man-into-the-spider-verse', 'Hailee Steinfeld', 'Gwen Stacy (voice)', 3)
) as x(slug, person_name, character_name, sort_order)
join titles t on t.slug = x.slug
join cast_members p on p.name = x.person_name;

-- ─────────────────────────────────────────────────────────────
-- Sample visitor reviews (fictional demo reviewers)
-- ─────────────────────────────────────────────────────────────

insert into reviews (title_id, author_name, rating, body)
select t.id, x.author_name, x.rating, x.body
from (values
  ('the-matrix', 'NeoByte', 9.0, 'Redefined action sci-fi. The bullet-time effects still hold up decades later.'),
  ('the-matrix', 'GreenCodeRain', 8.5, 'Dense philosophy wrapped in a slick action movie. Rewatch value is huge.'),
  ('parasite', 'ReelTalkNina', 9.5, 'Every scene recontextualizes the last. Flawless pacing and a gut-punch ending.'),
  ('parasite', 'MidnightCinephile', 8.0, 'Tense, darkly funny, and says something real about class. Deserved every award.'),
  ('spirited-away', 'GhibliDreamer', 9.0, 'Endlessly imaginative. My kids and I watch this once a year and notice something new every time.'),
  ('spirited-away', 'ArtHouseAva', 8.5, 'The world-building alone makes this worth the watch. Gorgeous animation.'),
  ('breaking-bad', 'ChemTeacherDan', 9.5, 'The character arc from Mr. Chips to Scarface is TV writing at its finest.'),
  ('breaking-bad', 'DesertRoadTrip', 9.0, 'Every season raises the stakes. Cranston and Paul are both incredible.'),
  ('everything-everywhere-all-at-once', 'MultiverseMel', 8.5, 'Chaotic in the best way. Somehow both hilarious and deeply moving.'),
  ('everything-everywhere-all-at-once', 'HotdogFingersFan', 7.5, 'A lot to take in on first watch, but it sticks the landing emotionally.'),
  ('game-of-thrones', 'WesterosWatcher', 9.0, 'The scope and ambition of the early seasons still hasn''t been matched by anything else on TV.'),
  ('bojack-horseman', 'HollywooHopeful', 8.5, 'Starts as a goofy animal-pun sitcom and quietly becomes one of the most honest shows about depression ever made.'),
  ('the-shawshank-redemption', 'HopeSpringsEternal', 9.5, 'Patient, humane storytelling. The kind of film that gets better every rewatch.'),
  ('the-godfather', 'ClassicFilmClub', 9.0, 'The gold standard for crime dramas. Every frame is deliberate.'),
  ('the-dark-knight', 'GothamNightWatch', 9.0, 'Ledger''s Joker is unforgettable. Still the best superhero film made.'),
  ('interstellar', 'StarfieldWanderer', 8.5, 'The docking sequence alone is worth the price of admission. Emotional gut-punch ending.'),
  ('peaky-blinders', 'SmallHeathRegular', 9.0, 'Cillian Murphy''s stare alone carries entire episodes. The style and score are unmatched.'),
  ('chernobyl', 'ReactorRoomReviewer', 9.5, 'Harrowing and meticulously researched. Hard to watch, impossible to look away from.')
) as x(slug, author_name, rating, body)
join titles t on t.slug = x.slug;
