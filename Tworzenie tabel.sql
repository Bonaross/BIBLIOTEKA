use [Biblioteka];


CREATE SEQUENCE dbo.LiczPracownicy	-- licznik wierszy
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczKsiazki	-- licznik wierszy
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczKlienci	-- licznik wierszy
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczLokalizacja
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczStanowiska
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczWypozyczoneKsiazki
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczZwroty
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczKategoria
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczAutorzy
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczKara
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE dbo.LiczWydawcy
AS bigint
START WITH 1
INCREMENT BY 1;

CREATE TABLE [Pracownicy]
(
	IdPracownika int PRIMARY KEY 
	,ImiePracownika nvarchar(30) not null 
	,DrugieImiePracownika nvarchar(30)
	,NazwiskoPracownika nvarchar(30) not null
	,PeselPracownika nvarchar(11) unique not null
	,EmailPracownika nvarchar(50) not null
	,NrTelefonuPracownika nvarchar(20) not null
	,DataZatrudnienia datetime not null
);

ALTER TABLE [Pracownicy] ALTER COLUMN IdPracownika int not null; -- niepotrzebne


SELECT * FROM [Pracownicy];

CREATE TABLE [Klienci]
(
	IdKlienta int PRIMARY KEY
	,ImieKlienta nvarchar(30) not null
	,NazwiskoKlienta nvarchar(3) not null
	,EmailKlienta nvarchar(50) not null
	,NrTelefonuKlienta nvarchar(20) not null
);

CREATE TABLE [Autorzy]
(
	IdAutora int PRIMARY KEY
	,ImieAutora nvarchar(30) not null
	,NazwiskoAutora nvarchar(30) not null
);

CREATE TABLE [Wydawcy]
(
	IdWydawcy int not null
	,NazwaWydawcy nvarchar(50) not null
);
ALTER TABLE [Wydawcy] ADD PRIMARY KEY (IdWydawcy);

CREATE TABLE [Kategoria] 
(
	IdKategorii int PRIMARY KEY not null
	,NazwaKategorii nvarchar(30) not null
);

CREATE TABLE [Lokalizacja] 
(
	IdLokalizacji int PRIMARY KEY not null
	,NrAlei int not null
	,NrRegalu int not null
	,NrPolki int not null
	,FK_IdKategorii int FOREIGN KEY REFERENCES [Kategoria](IdKategorii)
	,FK_IdKsiazki int not null
);



CREATE TABLE [Ksiazki]
(
	IdKsiazki int PRIMARY KEY not null
	,TytulKsiazki nvarchar(255) not null
	,FK_IdAutora int FOREIGN KEY REFERENCES [Autorzy](IdAutora) not null
	,FK_IdLokalizacji int FOREIGN KEY REFERENCES [Lokalizacja](IdLokalizacji) not null
	,FK_IdKategorii int FOREIGN KEY REFERENCES [Kategoria](IdKategorii) not null
	,FK_IdWydawcy int FOREIGN KEY REFERENCES [Wydawcy](IdWydawcy) not null
	,RokWydania datetime 	
);

CREATE TABLE [WypozyczoneKsiazki]
(
	IdWypozyczoneKSiazki int PRIMARY KEY not null
	,FK_IdKsiazki int FOREIGN KEY REFERENCES [Ksiazki](IdKsiazki) not null
	,FK_IdKlienta int FOREIGN KEY REFERENCES [Klienci](IdKlienta) not null
	,FK_IdZwroty int not null
);

CREATE TABLE [Kary]
(
	IdKary int PRIMARY KEY not null 
	,WysokoscKary decimal(10,2)
	,FK_IdKlienta int not null
	,FK_IdWypozyczoneKsiazki int not null
);

CREATE TABLE [Stanowiska]
(
	IdStanowiska int PRIMARY KEY not null
	,NazwaStanowiska nvarchar(255) not null
);

CREATE TABLE [ZWROTY]
(
	IdZwroty int PRIMARY KEY not null
	,FK_IdKsiazki int not null
	,FK_IdKlienta int not null
	,DataWypozyczenia datetime not null
	,DataZwrotu datetime not null
	,FK_IdKary int not null
);