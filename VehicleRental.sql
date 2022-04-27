CREATE TABLE `klienci` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `ulica` varchar(50) NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `miasto` varchar(30) NOT NULL,
  `pesel` varchar(11) UNIQUE NOT NULL,
  `nr_seria` varchar(10) UNIQUE NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `email` varchar(30),
  `dokument_id` int UNIQUE NOT NULL
);

CREATE TABLE `dokumenty` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `typ_dokumentu` varchar(20) NOT NULL,
  `nazwa_pliku` varchar(40) UNIQUE NOT NULL
);

CREATE TABLE `typ_pojazdu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nazwa` varchar(20) UNIQUE NOT NULL
);

CREATE TABLE `pojazdy` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `typ_pojazdu` int NOT NULL,
  `marka` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `wersja` varchar(20) NOT NULL,
  `dostepny` boolean NOT NULL,
  `uip` varchar(40) UNIQUE NOT NULL,
  `stan` varchar(20) NOT NULL,
  `przebieg` varchar(20) NOT NULL,
  `paliwo` varchar(10) NOT NULL,
  `nr_kluczyka` int UNIQUE NOT NULL,
  `mnoznik_st_kw_wp` varchar(10) NOT NULL
);

CREATE TABLE `wypozyczenia` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_klienta` int UNIQUE NOT NULL,
  `id_pojazdu` int UNIQUE NOT NULL,
  `kwota_wypozyczenia_dzien` varchar(10) NOT NULL,
  `data_rozpoczecia` datetime NOT NULL,
  `data_zakonczenia` datatime NOT NULL,
  `dod_ubezpieczenie` boolean NOT NULL,
  `skan_umowy` int UNIQUE NOT NULL
);

ALTER TABLE `dokumenty` ADD FOREIGN KEY (`id`) REFERENCES `klienci` (`dokument_id`);

ALTER TABLE `pojazdy` ADD FOREIGN KEY (`typ_pojazdu`) REFERENCES `typ_pojazdu` (`id`);

ALTER TABLE `wypozyczenia` ADD FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id`);

ALTER TABLE `wypozyczenia` ADD FOREIGN KEY (`id_pojazdu`) REFERENCES `pojazdy` (`id`);

ALTER TABLE `dokumenty` ADD FOREIGN KEY (`id`) REFERENCES `wypozyczenia` (`skan_umowy`);
