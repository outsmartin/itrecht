#encoding: UTF-8
require "rubygems"
require "graphviz"

#require 'graphviz'

g = GraphViz.new( :G, :type => :digraph)
g.node["shape"] = "box"
subg = GraphViz.new( :SUBG, :type => :digraph )
subg.node["shape"] = "box"

# Create nodes
schuldrecht = g.add_nodes( "Schuldrecht")

vorraus = g.add_nodes("Vorraussetzungen", "shape" => "record", "label" => "{
  Vorraussetzungen:|
  Geschäftsfähigkeit §104}")
wille = g.add_nodes("Willenserklärung", "shape" => "record", "label" => "{
  Willenserklärung: |
  geheimer Vorbehalt §116 | Scheingeschäft §117 |
  Scherzerklärung §118 | Formmangel §125ff |
  gesetzl. Verbot §134 | Sittenwidrigkeit §138 |
  Auslegung §133}")
vertreter = g.add_nodes("Vertreter §164")
nicht_vertreter = g.add_nodes("Vertreter ohne Vertretungvollmacht §177")
anfecht = g.add_nodes("Anfechtung", "shape" => "record", "label" => "{
  Anfechtung: §142 Abs.1 |
  Irrtum §119 |
  Übermittlungsfehler §120}")
anfecht_ersatz = g.add_nodes("Schadensersatz §122")
intent = g.add_nodes("Letter of Intent §133 + §157")
anbahn = g.add_nodes("Vertragsanbahnung §311 Abs.2")
anbahn_pflicht = g.add_nodes("Pflichten §241 Abs.2")
anbahn_schaden = g.add_nodes("Schadensersatz §280 Abs.1 Satz 1")
wirk = g.add_nodes("Wirksamwerden §130")

antrag = g.add_nodes("Antrag", "shape" => "record", "label" => "{
  Antrag: |
  Bindung §145 |
  Annahmefrist §148}")
antrag_erloescht = subg.add_nodes( "Erlöschen §146" )
antrag_neu = subg.add_nodes( "neuer Antrag §150 Abs.1" )
antrag_aender= subg.add_nodes( "abändernde Annahme §150 Abs.2" )
annahme = g.add_nodes( "Vertragsannahme" , "shape" => "record", "label" => "{
  Vertragsannahme: |
  Anwesenheit §147 Abs.1 |
  Abwesenheit §147 Abs.2 |
  verspäteter Zugang §149 |
  gleichwertige Annahmehandlung §151 |
  Versteigerung §156}")
agb = g.add_nodes( "AGB" , "shape" => "record", "label" => "{
  AGB: |
  Nutzung §305 +  §305a |
  Unwirksamkeit §305b+c + §306 + §306a + §307 + §308 + §309 |
  Anwendungsbereich §310}")
dissens= g.add_nodes( "Dissens" , "shape" => "record", "label" => "{
  Dissens: |
  offener §154 |
  versteckter §154}")

vertrag = g.add_nodes( "Vertrag" )
schuldverh = g.add_nodes("allg. Schuldverhältnis", "shape" => "record", "label" => "{
  Allg. Schuldverhältniss §311}")

erfuellung = g.add_nodes("Erfüllung", "shape" => "record", "label" => "{
  Erfüllung: |
  durch Leistung §362 + §364 |
  Hinterlegung §372ff |
  Aufrechnung §387ff |
  Erlass §397}")

schuldner = g.add_nodes("Schuldner", "shape" => "record", "label" => "{
  Schuldner: |
  Hauptleistungspflicht §241 Abs.1 |
  Schutzpflicht §241 Abs.2 |
  Leistungsort §269 |
  Zahlungsort §270}")
schuldner_pflichtverl = ("Pflichtverletzung")
schuldner_verantw = g.add_nodes("Verantwortlichkeit", "shape" => "record", "label" => "{
  Vertretenmüssen: |
  Verantwortlichkeit §276 |
  Sorgfalt §277 |
  Verantw. für Dritte/Verrichtungsgeh.-Haft. §278 + §831}")
schuldner_schadensers = g.add_nodes("Schadensersatz", "shape" => "record", "label" => "{
  Schadensersatz: |
  wegen Pflichtverletzung §280 Abs.1 |
  statt der Leistung §281 |
  Schutzpflichtverletzung §282 |
  bei Ausschluss der Leistungspflicht §283 |
  Ersatz vergeblicher Aufwendungen §284 |
  bei Verzug §286 + §287 + §288}")

glaeubiger = g.add_nodes("Gläubiger", "shape" => "record", "label" => "{
  Gläubiger: |
  Annahmeverzug §293 |
  Wirkungen des Gläubigerverzugs §300}")
glaeubiger_rueck = g.add_nodes("Rücktritt", "shape" => "record", "label" => "{
  Rücktritt: |
  keine/falsche Leistung  §323 |
  Pflichtverletzung §324 |
  Wirkungen §346 |
  Erklärung §349}")
glaeubiger_verbraucher = g.add_nodes("Verbraucher", "shape" => "record", "label" => "{
  Verbraucher: |
  Widerruf  §355 |
  Rückgabe §356 |
  Rechtsfolgen Widerr./Rückg. §357}")

spez_schuldverh = g.add_nodes("spez. Schuldverhältnis")

kv = g.add_nodes( "Kaufvertrag", "shape" => "record", "label" => "{
  Kaufvertrag: |
  Pflichten §433 |
  Sache §90
  Verbrauchsgüter §474}")
kv_kaeufer = g.add_nodes("Käufer")
kv_maengel = g.add_nodes( "Mängel", "shape" => "record", "label" => "{
  Mängel: |
  Sachmangel §434 |
  Rechtsmangel §435 |
  Rechte des Käufers bei Mängeln §437 |
  Verjährung §438 |
  Nacherfüllung §439 |
  keine Frist §440 |
  Minderung §441 |
  Kenntniss d. Käufers §442 |
  Beweislastumkehr §476}")
kv_gefahr = g.add_nodes("Gefahrenübergang §446f + §474")
kv_verkaeufer = g.add_nodes("Verkäufer")
kv_regress = g.add_nodes("Regress §478")

wv = g.add_nodes( "Werkvertrag" , "shape" => "record", "label" => "{
  Werkvertrag: |
  Individualsoftware §651}")
wv_besteller = g.add_nodes( "Besteller" )
wv_unternehmer = g.add_nodes( "Unternehmer" )
wv_gefahr = g.add_nodes("Gefahrenübergang §644")
wv_maengel = g.add_nodes( "Mängel_dv", "shape" => "record", "label" => "{
  Mängel: |
  Rechte des Bestellers §634 |
  Verjährung §634a |
  Nacherfüllung §635 |
  Selbstvornahme §637 |
  Minderung §638}")
wv_abnahme = g.add_nodes("Abnahme §640")
wv_verguetung = g.add_nodes("Vergütung §641 + §271 + §320")

dv = g.add_nodes( "Dienstvertrag" )
dv_kuendigung = g.add_nodes( "Kündigung_dv", "shape" => "record", "label" => "{
  Kündigung: |
  Schriftform §632}")

mv = g.add_nodes( "Mietvertrag" , "shape" => "record", "label" => "{
  Mietvertrag: |
  Hauptpflichten §535}")
mv_mieter = g.add_nodes( "Mieter" )
mv_maengel = g.add_nodes( "Mängel2" , "shape" => "record", "label" => "{
  Mängel: |
  Mietminderung §536 |
  Schadens-/Aufwendungsanspruch §536a |
  Kenntnis von Mängeln §536b}")
mv_kuend = g.add_nodes("Kündigung", "shape" => "record", "label" => "{
  Kündigung: §314 |
  aussderordentlich §543}")

# Create edges between the nodes
g.add_edges( schuldrecht, vorraus , "style" => "bold")

g.add_edges( vorraus, wille , "style" => "bold")
g.add_edges( wille, vertreter )
g.add_edges( vertreter, nicht_vertreter )
g.add_edges( wille, anfecht )
g.add_edges( anfecht, anfecht_ersatz )
g.add_edges( anbahn, anbahn_pflicht)
g.add_edges( anbahn_pflicht, anbahn_schaden)
g.add_edges( wille, intent, "style" => "dashed")
g.add_edges( intent, wille, "style" => "dashed")
g.add_edges( wille, wirk , "style" => "bold")
g.add_edges( wirk, anbahn , "style" => "bold")

g.add_edges( anbahn, antrag , "style" => "bold")
g.add_edges( antrag, annahme , "style" => "bold")
g.add_edges( antrag, antrag_aender)
g.add_edges( antrag_aender, antrag)
g.add_edges( antrag, antrag_erloescht )
g.add_edges( antrag_erloescht, antrag_neu)
g.add_edges( antrag_neu, antrag)
g.add_edges( annahme, dissens)
g.add_edges( antrag, agb)
g.add_edges( agb, antrag)
g.add_edges( annahme, vertrag, "style" => "bold")

g.add_edges( vertrag, schuldverh, "style" => "bold")
g.add_edges( vertrag, spez_schuldverh, "style" => "bold")
g.add_edges( schuldverh, glaeubiger , "style" => "bold")
g.add_edges( schuldverh, erfuellung , "style" => "bold")
g.add_edges( glaeubiger, glaeubiger_rueck)
g.add_edges( glaeubiger, glaeubiger_verbraucher)
g.add_edges( glaeubiger_rueck, schuldner_schadensers, "label" => "§325")
g.add_edges( schuldverh, schuldner , "style" => "bold")
g.add_edges( schuldner, schuldner_pflichtverl )
g.add_edges( schuldner_pflichtverl, schuldner_verantw )
g.add_edges( schuldner_verantw, schuldner_schadensers )

g.add_edges( spez_schuldverh, kv , "style" => "bold")
g.add_edges( kv, kv_kaeufer)
g.add_edges( kv, kv_verkaeufer)
g.add_edges( kv_kaeufer, kv_maengel)
g.add_edges( kv, kv_gefahr)
g.add_edges( kv_verkaeufer, kv_regress)

g.add_edges( spez_schuldverh, wv , "style" => "bold")
g.add_edges( wv, wv_besteller)
g.add_edges( wv, wv_unternehmer)
g.add_edges( wv, wv_gefahr)
g.add_edges( wv_besteller, wv_maengel)
g.add_edges( wv_besteller, wv_abnahme)
g.add_edges( wv_unternehmer, wv_verguetung)

g.add_edges( spez_schuldverh, dv , "style" => "bold")
g.add_edges( dv, dv_kuendigung)

g.add_edges( spez_schuldverh, mv , "style" => "bold")
g.add_edges( mv, mv_mieter )
g.add_edges( mv, mv_kuend )
g.add_edges( mv_mieter, mv_maengel )

# Generate output image
g.output( :png => "schuldrecht.png")
g.output( :dot => "schuldrecht.dot")

