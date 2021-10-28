use [Biblioteka];

SELECT * FROM Autorzy;

ALTER TABLE Autorzy
	ADD
		DEFAULT
		NEXT VALUE FOR dbo.LiczAutorzy
		FOR IdAutora
;

ALTER TABLE Autorzy
ADD DrugieImie nvarchar(20);

INSERT INTO Autorzy values
(
	DEFAULT, 'Adam','Mickiewicz'
);
INSERT INTO Autorzy values
(
	DEFAULT, 'Juliusz','S³owacki'
);
INSERT INTO Autorzy values
(
	DEFAULT, 'Boles³aw','Prus',null
);
INSERT INTO Autorzy values
(
	DEFAULT, 'Umberto','Eco',null
);


INSERT INTO Autorzy values
(
	DEFAULT, 'Stephen','King',null
);

SELECT * FROM Kategoria;

ALTER TABLE Kategoria
	ADD 
		DEFAULT
		NEXT VALUE FOR dbo.LiczKategoria
		FOR IdKategorii
	;

INSERT INTO [Kategoria] values
(
	DEFAULT, 'Krymina³'
);
INSERT INTO [Kategoria] values
(
	DEFAULT, 'Romans'
);
INSERT INTO [Kategoria] values
(
	DEFAULT, 'Sci-Fi'
);
INSERT INTO [Kategoria] values
(
	DEFAULT, 'Fantastyka'
);
INSERT INTO [Kategoria] values
(
	DEFAULT, 'Edukacja'
);
INSERT INTO [Kategoria] values
(
	DEFAULT, 'Historyczna'
);
------------------------------------------------------
ALTER TABLE [Wydawcy]
	ADD
	DEFAULT
	NEXT VALUE dbo.LiczWydawcy
	FOR IdWydawcy;

INSERT INTO [Wydawcy]
(
	DEFAULT, 'Zielona Sowa'
);

INSERT INTO [Wydawcy]
(
	DEFAULT, 'PWN'
);
	
INSERT INTO [Wydawcy]
(
	DEFAULT,'Super Ksiazka'
);

INSERT INTO [Wydawcy]
(
	DEFAULT, 'Pearson'
);






