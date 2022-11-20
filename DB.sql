CREATE TABLE GameTitle (
title TEXT NOT NULL,
release_year INTEGER NOT NULL,
platform TEXT NOT NULL,
price REAL,
PRIMARY KEY (title,release_year,platform)
);

CREATE TABLE GameLicense (
title TEXT NOT NULL,
release_year INTEGER NOT NULL,
platform TEXT NOT NULL,
license_id TEXT PRIMARY KEY NOT NULL,
CHECK (length(license_id) == 5),
CHECK (cast(substr(license_id,1,4) AS integer) == substr(license_id,1,4)),
CHECK (substr(license_id,5,1) == substr(substr(license_id,1,1)*1 + substr(license_id,2,1)*3 + substr(license_id,3,1)*1 + substr(license_id,4,1)*3, -1,1))
);

CREATE TABLE gameRental (
gamer_id INTEGER,
license_id TEXT,
date_out TEXT NOT NULL,
date_back TEXT,
rental_cost REAL,
FOREIGN KEY (license_id) REFERENCES GameLicense(license_id),
FOREIGN KEY (gamer_id) REFERENCES Gamer(gamer_id)
ON UPDATE CASCADE
);

CREATE TABLE Gamer (
gamer_id INTEGER PRIMARY KEY NOT NULL,
first_name TEXT NOT NULL,
last_name TEXT,
email TEXT
);