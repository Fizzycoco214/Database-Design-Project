CREATE TABLE "Date" (
	"dateID"	INTEGER,
	"year"	INTEGER,
	"month"	INTEGER,
	"day"	INTEGER,
	PRIMARY KEY("dateID" AUTOINCREMENT)
)

CREATE TABLE "End_Date" (
	"endDateID"	INTEGER,
	"dateID"	INTEGER,
	FOREIGN KEY("dateID") REFERENCES "Date"("dateID"),
	PRIMARY KEY("endDateID" AUTOINCREMENT)
)

CREATE TABLE "Match" (
	"matchID"	INTEGER,
	"roundID"	INTEGER,
	FOREIGN KEY("roundID") REFERENCES "Round"("roundID"),
	PRIMARY KEY("matchID" AUTOINCREMENT)
)

CREATE TABLE "Match_Performance" (
	"performanceID"	INTEGER,
	"matchID"	INTEGER,
	"teamID"	INTEGER,
	"placement"	INTEGER,
	"eliminations"	INTEGER,
	FOREIGN KEY("matchID") REFERENCES "Match"("matchID"),
	FOREIGN KEY("teamID") REFERENCES "Team"("teamID"),
	PRIMARY KEY("performanceID" AUTOINCREMENT)
)

CREATE TABLE "Player" (
	"playerID"	INTEGER,
	"teamID"	INTEGER,
	"name"	TEXT,
	"age"	INTEGER,
	"nationality"	TEXT,
	PRIMARY KEY("playerID" AUTOINCREMENT),
	FOREIGN KEY("teamID") REFERENCES "Team"("teamID")
)

CREATE TABLE "Round" (
	"roundID"	INTEGER,
	"tournamentID"	INTEGER,
	"name"	TEXT,
	FOREIGN KEY("tournamentID") REFERENCES "Tournament"("tournamentID"),
	PRIMARY KEY("roundID" AUTOINCREMENT)
)

CREATE TABLE "Start_Date" (
	"startDateID"	INTEGER,
	"dateID"	INTEGER,
	PRIMARY KEY("startDateID" AUTOINCREMENT),
	FOREIGN KEY("dateID") REFERENCES "Date"("dateID")
)

CREATE TABLE "Team" (
	"teamID"	INTEGER,
	PRIMARY KEY("teamID" AUTOINCREMENT)
)

CREATE TABLE "Tournament" (
	"tournamentID"	INTEGER,
	"startDateID"	INTEGER,
	"endDateID"	INTEGER,
	"name"	TEXT,
	PRIMARY KEY("tournamentID" AUTOINCREMENT),
	FOREIGN KEY("startDateID") REFERENCES "Start_Date"("startDateID"),
	FOREIGN KEY("endDateID") REFERENCES "End_Date"("endDateID")
)