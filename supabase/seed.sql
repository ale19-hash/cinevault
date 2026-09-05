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
  ('breaking-bad', 'Breaking Bad', 'tv', 2008, null, 5, 9.5, 'Vince Gilligan', 'All hail the king.', 'A chemistry teacher turned methamphetamine manufacturer builds a criminal empire to secure his family''s future.', 'English', 'USA', null, 271, true),
  ('the-wire', 'The Wire', 'tv', 2002, null, 5, 9.3, 'David Simon', 'All the pieces matter.', 'Baltimore''s drug scene is examined through the eyes of law enforcement and the criminals they pursue.', 'English', 'USA', null, 48, false),
  ('stranger-things', 'Stranger Things', 'tv', 2016, null, 4, 8.7, 'The Duffer Brothers', 'Every ending has a beginning.', 'A group of kids uncover supernatural mysteries and government secrets in their small town.', 'English', 'USA', null, 185, false),
  ('the-office', 'The Office', 'tv', 2005, null, 9, 8.9, 'Greg Daniels', 'Welcome to Dunder Mifflin.', 'A mockumentary follows the everyday lives of office employees at a paper company in Scranton, Pennsylvania.', 'English', 'USA', null, 322, false),
  ('chernobyl', 'Chernobyl', 'tv', 2019, null, 1, 9.4, 'Craig Mazin', 'What is the cost of lies?', 'A dramatization of the true story of one of the worst nuclear disasters and the sacrifices made to save Europe.', 'English', 'UK', 'https://upload.wikimedia.org/wikipedia/en/a/a7/Chernobyl_2019_Miniseries.jpg', 99, false),
  ('fleabag', 'Fleabag', 'tv', 2016, null, 2, 8.7, 'Phoebe Waller-Bridge', 'A comedy about love, loss, and sex.', 'A dry-witted woman navigates grief, guilt, and relationships in modern London, breaking the fourth wall along the way.', 'English', 'UK', null, 236, false),
  ('avatar-the-last-airbender', 'Avatar: The Last Airbender', 'tv', 2005, null, 3, 9.3, 'Bryan Konietzko & Michael Dante DiMartino', 'Water. Earth. Fire. Air.', 'A young boy awakens after a century to fulfill his destiny as the Avatar who must bring balance to the world.', 'English', 'USA', null, 13, false),
  ('the-sopranos', 'The Sopranos', 'tv', 1999, null, 6, 9.2, 'David Chase', 'If one family doesn''t kill him, the other one will.', 'A New Jersey mob boss balances family life with the pressures of running a criminal organization, all while seeing a therapist.', 'English', 'USA', null, 150, false),
  ('succession', 'Succession', 'tv', 2018, null, 4, 8.8, 'Jesse Armstrong', 'The house always wins.', 'The Roy family fights for control of their global media empire as their aging patriarch''s health declines.', 'English', 'USA', null, 287, false),
  ('arcane', 'Arcane', 'tv', 2021, null, 2, 9.0, 'Christian Linke & Alex Yee', 'Two sisters. One city. A war that will change everything.', 'Two sisters on opposing sides of a brewing revolution fight to protect what they hold dear.', 'English', 'USA', null, 64, true),
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
  ('the-wire', 'Crime'), ('the-wire', 'Drama'),
  ('stranger-things', 'Sci-Fi'), ('stranger-things', 'Horror'),
  ('the-office', 'Comedy'),
  ('chernobyl', 'Drama'), ('chernobyl', 'History'),
  ('fleabag', 'Comedy'), ('fleabag', 'Drama'),
  ('avatar-the-last-airbender', 'Animation'), ('avatar-the-last-airbender', 'Adventure'),
  ('the-sopranos', 'Crime'), ('the-sopranos', 'Drama'),
  ('succession', 'Drama'), ('succession', 'Comedy'),
  ('arcane', 'Animation'), ('arcane', 'Sci-Fi'),
  ('planet-earth-ii', 'Documentary'),
  ('portrait-of-a-lady-on-fire', 'Romance'), ('portrait-of-a-lady-on-fire', 'Drama'),
  ('spider-man-into-the-spider-verse', 'Animation'), ('spider-man-into-the-spider-verse', 'Action')
) as x(slug, genre_name)
join titles t on t.slug = x.slug
join genres g on g.name = x.genre_name;

-- ─────────────────────────────────────────────────────────────
-- Cast members + title <-> cast links
-- ─────────────────────────────────────────────────────────────

insert into cast_members (name)
select distinct x.person_name
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
  ('the-wire', 'Dominic West', 'Jimmy McNulty', 1), ('the-wire', 'Idris Elba', 'Stringer Bell', 2), ('the-wire', 'Wendell Pierce', 'Bunk Moreland', 3),
  ('stranger-things', 'Millie Bobby Brown', 'Eleven', 1), ('stranger-things', 'Finn Wolfhard', 'Mike Wheeler', 2), ('stranger-things', 'Winona Ryder', 'Joyce Byers', 3),
  ('the-office', 'Steve Carell', 'Michael Scott', 1), ('the-office', 'Rainn Wilson', 'Dwight Schrute', 2), ('the-office', 'John Krasinski', 'Jim Halpert', 3),
  ('chernobyl', 'Jared Harris', 'Valery Legasov', 1), ('chernobyl', 'Stellan Skarsgård', 'Boris Shcherbina', 2), ('chernobyl', 'Emily Watson', 'Ulana Khomyuk', 3),
  ('fleabag', 'Phoebe Waller-Bridge', 'Fleabag', 1), ('fleabag', 'Sian Clifford', 'Claire', 2), ('fleabag', 'Andrew Scott', 'The Priest', 3),
  ('avatar-the-last-airbender', 'Zach Tyler Eisen', 'Aang (voice)', 1), ('avatar-the-last-airbender', 'Mae Whitman', 'Katara (voice)', 2), ('avatar-the-last-airbender', 'Jack DeSena', 'Sokka (voice)', 3),
  ('the-sopranos', 'James Gandolfini', 'Tony Soprano', 1), ('the-sopranos', 'Edie Falco', 'Carmela Soprano', 2), ('the-sopranos', 'Lorraine Bracco', 'Dr. Jennifer Melfi', 3),
  ('succession', 'Brian Cox', 'Logan Roy', 1), ('succession', 'Jeremy Strong', 'Kendall Roy', 2), ('succession', 'Sarah Snook', 'Shiv Roy', 3),
  ('arcane', 'Hailee Steinfeld', 'Vi (voice)', 1), ('arcane', 'Ella Purnell', 'Jinx (voice)', 2), ('arcane', 'Katie Leung', 'Caitlyn (voice)', 3),
  ('planet-earth-ii', 'David Attenborough', 'Narrator', 1),
  ('portrait-of-a-lady-on-fire', 'Noémie Merlant', 'Marianne', 1), ('portrait-of-a-lady-on-fire', 'Adèle Haenel', 'Héloïse', 2), ('portrait-of-a-lady-on-fire', 'Luàna Bajrami', 'Sophie', 3),
  ('spider-man-into-the-spider-verse', 'Shameik Moore', 'Miles Morales (voice)', 1), ('spider-man-into-the-spider-verse', 'Jake Johnson', 'Peter B. Parker (voice)', 2), ('spider-man-into-the-spider-verse', 'Hailee Steinfeld', 'Gwen Stacy (voice)', 3)
) as x(slug, person_name, character_name, sort_order)
on conflict (name) do nothing;

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
  ('the-wire', 'Dominic West', 'Jimmy McNulty', 1), ('the-wire', 'Idris Elba', 'Stringer Bell', 2), ('the-wire', 'Wendell Pierce', 'Bunk Moreland', 3),
  ('stranger-things', 'Millie Bobby Brown', 'Eleven', 1), ('stranger-things', 'Finn Wolfhard', 'Mike Wheeler', 2), ('stranger-things', 'Winona Ryder', 'Joyce Byers', 3),
  ('the-office', 'Steve Carell', 'Michael Scott', 1), ('the-office', 'Rainn Wilson', 'Dwight Schrute', 2), ('the-office', 'John Krasinski', 'Jim Halpert', 3),
  ('chernobyl', 'Jared Harris', 'Valery Legasov', 1), ('chernobyl', 'Stellan Skarsgård', 'Boris Shcherbina', 2), ('chernobyl', 'Emily Watson', 'Ulana Khomyuk', 3),
  ('fleabag', 'Phoebe Waller-Bridge', 'Fleabag', 1), ('fleabag', 'Sian Clifford', 'Claire', 2), ('fleabag', 'Andrew Scott', 'The Priest', 3),
  ('avatar-the-last-airbender', 'Zach Tyler Eisen', 'Aang (voice)', 1), ('avatar-the-last-airbender', 'Mae Whitman', 'Katara (voice)', 2), ('avatar-the-last-airbender', 'Jack DeSena', 'Sokka (voice)', 3),
  ('the-sopranos', 'James Gandolfini', 'Tony Soprano', 1), ('the-sopranos', 'Edie Falco', 'Carmela Soprano', 2), ('the-sopranos', 'Lorraine Bracco', 'Dr. Jennifer Melfi', 3),
  ('succession', 'Brian Cox', 'Logan Roy', 1), ('succession', 'Jeremy Strong', 'Kendall Roy', 2), ('succession', 'Sarah Snook', 'Shiv Roy', 3),
  ('arcane', 'Hailee Steinfeld', 'Vi (voice)', 1), ('arcane', 'Ella Purnell', 'Jinx (voice)', 2), ('arcane', 'Katie Leung', 'Caitlyn (voice)', 3),
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
  ('arcane', 'RuneterraRegular', 9.0, 'Animation this good has no business being tied to a video game. Gorgeous and gut-wrenching.'),
  ('arcane', 'PilteoverPigeon', 8.5, 'Jinx''s arc alone makes this one of the best animated shows in years.'),
  ('the-shawshank-redemption', 'HopeSpringsEternal', 9.5, 'Patient, humane storytelling. The kind of film that gets better every rewatch.'),
  ('the-godfather', 'ClassicFilmClub', 9.0, 'The gold standard for crime dramas. Every frame is deliberate.'),
  ('the-dark-knight', 'GothamNightWatch', 9.0, 'Ledger''s Joker is unforgettable. Still the best superhero film made.'),
  ('interstellar', 'StarfieldWanderer', 8.5, 'The docking sequence alone is worth the price of admission. Emotional gut-punch ending.'),
  ('the-sopranos', 'JerseyRewatcher', 9.0, 'Gandolfini carries every scene. The therapy sessions are as gripping as the mob business.'),
  ('chernobyl', 'ReactorRoomReviewer', 9.5, 'Harrowing and meticulously researched. Hard to watch, impossible to look away from.')
) as x(slug, author_name, rating, body)
join titles t on t.slug = x.slug;
