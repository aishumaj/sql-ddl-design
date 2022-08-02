CREATE TABLE stars (
        star_name TEXT PRIMARY KEY,
        temp INT NOT NULL);

CREATE TABLE planets (
        planet_name TEXT PRIMARY KEY,
        orbital_period_in_years FLOAT NOT NULL,
        star TEXT NOT NULL REFERENCES stars);

CREATE TABLE moons (
        moon_name TEXT PRIMARY KEY,
        planet TEXT NOT NULL REFERENCES planets);

INSERT INTO stars (star_name, temp) VALUES ('The Sun', 5800), ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets (planet_name, orbital_period_in_years, star)
    VALUES ('Earth', 1.00, 'The Sun'), ('Mars', 1.882, 'The Sun'), ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'), ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (moon_name, planet)
    VALUES ('The Moon', 'Earth'), ('Phobos', 'Mars'), ('Deimos', 'Mars');

SELECT planet_name AS planet, star_name AS star, COUNT(moon_name) AS moon_count
    FROM planets AS p
    LEFT OUTER JOIN stars AS s ON p.star = s.star_name
    LEFT OUTER JOIN moons As m ON p.planet_name = m.planet
    GROUP BY planet_name, star_name
    ORDER BY planet_name ASC;