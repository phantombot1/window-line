# Window-Line — online zetten

## Wat er in deze map zit

```
index.html          de site zelf, 86 kB
fotos/              73 beelden, samen 1,4 MB
publiceer.command   dubbelklikken om naar GitHub te sturen
.nojekyll           zorgt dat GitHub niets aan je bestanden verandert
```

De site opent ook gewoon lokaal: dubbelklik `index.html`. Alles blijft
instelbaar in het `INSTELLINGEN`-blok bovenaan `index.html`.

---

## 1. Repository aanmaken

Op **github.com/new**:

- Repository name: `window-line`
- **Public** (bij een gratis account werkt Pages niet op private)
- Vink **niets** aan — geen README, geen .gitignore, geen licentie

## 2. Deze map versturen

Zet bovenaan `publiceer.command` je gegevens goed:

```bash
GITHUB_GEBRUIKER="phantombot1"
REPO_NAAM="window-line"
```

Dan dubbelklikken. De eerste keer vraagt macOS om toestemming:
rechtsklik → Open. Hij vraagt om je GitHub-wachtwoord — gebruik daar een
**personal access token**, niet je gewone wachtwoord
(github.com/settings/tokens → Generate new token (classic) → scope `repo`).

Vanaf dan is bijwerken: tekst of foto's aanpassen, `BOODSCHAP` wijzigen,
dubbelklikken.

## 3. Pages aanzetten

In de repository: **Settings → Pages**

- Source: `Deploy from a branch`
- Branch: `main`, map `/ (root)`
- Save

Na een minuut staat de site op
`https://phantombot1.github.io/window-line/`

Controleer hem daar eerst volledig voor je een domein koppelt.

## 4. Eigen domein

Koop het domein (Versio, waar windowline.be ook staat). Dan:

**Bij Versio — DNS-records voor het kale domein:**

| Type | Naam | Waarde |
|---|---|---|
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |
| AAAA | @ | 2606:50c0:8000::153 |
| AAAA | @ | 2606:50c0:8001::153 |
| AAAA | @ | 2606:50c0:8002::153 |
| AAAA | @ | 2606:50c0:8003::153 |
| CNAME | www | phantombot1.github.io. |

Zet **DNSSEC uit** bij Versio — anders faalt het certificaat.

**Bij GitHub — Settings → Pages → Custom domain:** vul je domein in en
bewaar. GitHub maakt dan zelf een `CNAME`-bestand in de repository aan.
Haal dat bestand nooit weg.

Wacht tot er onder het veld **"DNS check successful"** staat, vink dan
**Enforce HTTPS** aan. Dat kan tot 24 uur duren; het certificaat komt
vanzelf.

---

## Vóór je het domein rondbazuint

**Het formulier.** Zolang `FORMULIER_ENDPOINT` leeg is, opent het
formulier het mailprogramma van de bezoeker in plaats van te versturen.
Op telefoons zonder ingestelde mailapp gebeurt er dan niets en ben je de
aanvraag kwijt. Maak een gratis account op **formspree.io**, maak een
form aan, en plak de endpoint-URL in `INSTELLINGEN`:

```javascript
FORMULIER_ENDPOINT: "https://formspree.io/f/xxxxxxxx",
```

Test hem daarna één keer met je eigen mailadres.

**Fotorechten.** De projectfoto's en de twee interieurfoto's komen bij
ARW vandaan. Vraag de fotograaf om toestemming, en bij de interieurfoto's
ook de bewoner.

**Nakijken na het koppelen:** het formulier, de WhatsApp-knop, de
telefoonlink en de route-link naar de toonzaal — alle vier op een echte
telefoon, niet alleen op je Mac.
