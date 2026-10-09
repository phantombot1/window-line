#!/bin/bash
# ───────────────────────────────────────────────────────────────
#  Window-Line — site online zetten of bijwerken
#  Dubbelklik dit bestand in Finder, of druk op play in VS Code.
#  Eerste keer: rechtsklik > Open, zodat macOS het mag draaien.
# ───────────────────────────────────────────────────────────────

# ══ INSTELLINGEN ═══════════════════════════════════════════════
GITHUB_GEBRUIKER="phantombot1"        # je GitHub-accountnaam
REPO_NAAM="window-line"               # de naam van de repository
BOODSCHAP="Site bijgewerkt"           # tekst bij deze wijziging
TAK="main"                            # branch, bijna altijd main
# ═══════════════════════════════════════════════════════════════

set -e
cd "$(dirname "$0")"
echo "Map: $(pwd)"
echo

if [ ! -d .git ]; then
  echo "── Eerste keer: repository aanmaken ──"
  git init
  git branch -M "$TAK"
  git remote add origin "https://github.com/$GITHUB_GEBRUIKER/$REPO_NAAM.git"
  echo "Repository klaargezet voor $GITHUB_GEBRUIKER/$REPO_NAAM"
  echo
  echo "LET OP: maak die repository nu eerst aan op github.com/new"
  echo "        (naam: $REPO_NAAM, Public, zonder README of .gitignore)"
  echo "        Druk daarna op Enter om door te gaan."
  read -r _
fi

git add -A

if git diff --cached --quiet; then
  echo "Niets gewijzigd, er valt niets te versturen."
else
  git commit -m "$BOODSCHAP"
  echo "Wijziging vastgelegd: $BOODSCHAP"
fi

echo
echo "── Versturen naar GitHub ──"
git push -u origin "$TAK"

echo
echo "Klaar."
echo "Standaardadres: https://$GITHUB_GEBRUIKER.github.io/$REPO_NAAM/"
echo "Na een push duurt het meestal 30 tot 60 seconden voor de site vernieuwt."
echo
echo "Druk op Enter om dit venster te sluiten."
read -r _
