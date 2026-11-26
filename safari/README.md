# App-Store-Version (Safari-Erweiterung für iPhone, iPad und Mac)

Safari lädt Erweiterungen nur, wenn sie in einer App stecken. Die App ist nur ein
Rahmen, die Funktion ist dieselbe Erweiterung wie in `extension/`.

## Was du brauchst

- Apple Developer Program (99 US-$ pro Jahr): https://developer.apple.com/programs/
- **Xcode** aus dem Mac App Store (groß, einige GB). Danach im Terminal:
  `sudo xcode-select -s /Applications/Xcode.app`
- Ein Mac, den du hast.

## Schritte

1. `sh safari/convert.sh` erzeugt das Xcode-Projekt in `safari/xcode/`.
   (Name und Kennung der App stehen oben im Skript, die Kennung `io.github.kong003.akkordtoene`
   muss weltweit einmalig sein und lässt sich nach der Veröffentlichung nicht mehr ändern.)
2. `safari/xcode/Chord Staff Harmony/Chord Staff Harmony.xcodeproj` in Xcode öffnen.
3. Bei **beiden** Targets (App und Extension) unter *Signing & Capabilities* dein Team wählen.
4. Das Icon ersetzen: in Xcode `Assets.xcassets` → `AppIcon` öffnen und
   `safari/AppIcon-1024.png` hineinziehen.
5. Zielgerät "Any iOS Device" wählen, *Product → Archive*, dann *Distribute App → App Store Connect*.
6. In App Store Connect (https://appstoreconnect.apple.com) die App anlegen:
   Name, Beschreibung, Screenshots (iPhone und iPad), Kategorie, Datenschutz
   ("Daten werden nicht erhoben"), Alterseinstufung. Dann zur Prüfung einreichen.

Zum Testen vorher: *TestFlight* (Teil von App Store Connect) lädt bis zu 10 000 Tester ein.
Die Tester brauchen die App *TestFlight* und einen Link von dir.

## Was Apple beachtet

- **Nicht offiziell:** Der Name und die Beschreibung dürfen nicht so wirken, als käme die
  App von SongTreasures. Sag in der Beschreibung ausdrücklich, dass sie inoffiziell ist.
  Der Name enthält deshalb nicht "SongTreasures". Frag vorher bei SongTreasures nach.
- **Mindestfunktion (Richtlinie 4.2):** Apple lehnt Apps ab, die kaum etwas tun. Eine
  Erweiterung mit klarer Funktion (Akkordzeile, Harmony) ist hier eigentlich in Ordnung,
  die App braucht aber eine kurze Anleitung zum Einschalten in Safari auf ihrer Startseite.
  Der Rahmen, den Xcode erzeugt, zeigt einen Platzhaltertext. Den solltest du ersetzen.
- **Datenschutzerklärung:** App Store Connect verlangt eine Adresse. Eine einfache Seite genügt
  ("Die Erweiterung erhebt und überträgt keine Daten").
- Das Skript und diese Anleitung sind **nicht** auf einem Mac mit Xcode ausprobiert worden.
  Kleine Abweichungen der Optionen von `safari-web-extension-converter` sind möglich.
