# Ohjelmistotestit

## Sisäänkirjautuminen (Päivitetty 17.4.2025)

Taustapalvelimessa suoritettiin sisäänkirjautumis-testi. Testissä syötettiin käyttäjän käyttäjätunnukset, joiden avulla suoritettiin kirjautuminen Kubiokseen. Vastaus tulostettiin konsoliin.

Testin suoritus:
- 1. Taustapalvelin päälle `npm run dev`- komennolla.
- 2. `source tests/.venv/Scripts/activate` -komennolla virtuaaliympäristö päälle.
- 3. `robot --outputdir outputs tests/login-server-test.robot` -komennolla suoritettiin testit ja ohjattiin tulokset outputs-kansioon.

Tulokset:

- [Testi](../tests/login-server-test.robot)
- [log.html](log.html)
- [output.xml](output.xml)
- [report.html](report.html)

Testeistä suoritettiin yksi epäonnistunut.

Huom! Testiä piti hiukan muuttaa asetusten vuoksi. Env- tiedostosta tulee nyt "huonot" käyttäjätunnukset. Lopputulos sama, eli epäonnistuu.

## Sisäänkirjautuminen (viikko 5)

Sovellukseen suoritettiin kaksi sisäänkirjautumistestiä, joissa toisesta kirjauduttiin ensin väärillä tunnuksilla (invalid) ja toisessa oikeilla tunnuksilla (valid).

Testin suoritus:
- 1. Taustapalvelin ja selain päälle `npm run dev`- komennolla.
- 2. `source tests/.venv/Scripts/activate` -komennolla virtuaaliympäristö päälle.
- 3. `robot --outputdir outputs tests/login-invalid-login.robot` -komennolla suoritettiin väärän kirjautumisen testit ja ohjattiin tulokset outputs-kansioon.
- 4. `robot --outputdir outputs tests/login-valid-login.robot` -komennolla suoritettiin oikean kirjautumisen testit ja ohjattiin tulokset outputs-kansioon.

Tulokset:

- Testi 1 [Sisäänkirjautuminen (invalid)](../tests/login-invalid-login.robot)
- Testi 2 [Sisäänkirjautuminen (valid)](../tests/login-valid-login.robot)
- [log.html](log.html)
- [output.xml](output.xml)
- [report.html](report.html)

## Taustapalvelimen testaus (viikko 6)

Sovellukseen suoritettiin taustapalvelimen testaus, jossa haettiin käyttäjän työvuorot, jonka jälkeen syötettiin uusi vuoro.

Testin suoritus:
- 1. Taustapalvelin ja selain päälle `npm run dev`- komennolla.
- 2. `source tests/.venv/Scripts/activate` -komennolla virtuaaliympäristö päälle.
- 3. `robot --outputdir outputs tests/server-test.robot` -komennolla suoritettiin taustapalvelimen testit ja ohjattiin tulokset outputs-kansioon.

Tulokset:

- Testi [Taustapalvelin-vuorot-haku-syöttö](../tests/server-test.robot)
- [log.html](log.html)
- [output.xml](output.xml)
- [report.html](report.html)

## Github.io sivun luominen (viikko 7)

Sovelluksen repositio muutettiin julkiseksi, ja sille luotiin Github.io- sivu, josta opettajat pystyvät katsomaan testien raportteja, koodiratkaisuja ja raportteja.

## Lokit, tulostukset ja raportit

#### Lokit ---> [log.html](log.html)
#### Raportit ---> [report.html](report.html)
#### Tulostukset ---> [output.xml](output.xml)