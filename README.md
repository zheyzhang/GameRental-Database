# GameRental-Database

A database was created for a shop that rents out game discs, with 4 tables.

The first table is the game information data, which contains the game information of most games on the market (price, official price, name, release date, platform).

The second is the game disc information owned by the shop (platform, release date, name and ID).

The third database is the rental information (rental date, return date, rent).

The fourth database is the information of the person who rented the disc (rental game ID, last name, first name, email address).

Setting the corresponding foreign keys and triggers for these four databases, when a disc is rented out, the return date is empty and the rent is 0, when the return date is updated, the rent will be calculated automatically.
