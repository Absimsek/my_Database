CREATE TABLE Orchestra (
    Name VARCHAR(200) PRIMARY KEY,
    City VARCHAR(100),
    Country VARCHAR(100),
    MusicDirector VARCHAR(200)
);

CREATE TABLE Musician (
    MusicianNumber INT PRIMARY KEY,
    Name VARCHAR(200),
    Instrument VARCHAR(100),
    AnnualSalary DECIMAL(12,2),
    OrchestraName VARCHAR(200) NOT NULL,
    FOREIGN KEY (OrchestraName) REFERENCES Orchestra(Name)
);

CREATE TABLE Degree (
    MusicianNumber INT,
    DegreeName VARCHAR(200),
    PRIMARY KEY (MusicianNumber, DegreeName),
    FOREIGN KEY (MusicianNumber) REFERENCES Musician(MusicianNumber)
);

CREATE TABLE Composer (
    Name VARCHAR(200) PRIMARY KEY,
    Country VARCHAR(100),
    DateOfBirth DATE
);

CREATE TABLE Composition (
    CompositionName VARCHAR(200),
    ComposerName VARCHAR(200),
    YearComposed INT,
    PRIMARY KEY (CompositionName, ComposerName),
    FOREIGN KEY (ComposerName) REFERENCES Composer(Name)
);

CREATE TABLE Recording (
    OrchestraName VARCHAR(200),
    CompositionName VARCHAR(200),
    ComposerName VARCHAR(200),
    Year INT,
    Price DECIMAL(12,2),
    PRIMARY KEY (OrchestraName, CompositionName, ComposerName),
    FOREIGN KEY (OrchestraName) REFERENCES Orchestra(Name),
    FOREIGN KEY (CompositionName, ComposerName) 
        REFERENCES Composition(CompositionName, ComposerName)
);
