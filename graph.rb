require "rubygems"
require "graphviz"

#require 'graphviz'

g = GraphViz.new( :G, :type => :digraph )
g.node["shape"] = "box"

# Create nodes
schuldrecht = g.add_nodes( "Schuldrecht" )

vorraus = g.add_nodes("Vorraussetzungen", "shape" => "record", "label" => "{
  Vorraussetzungen:|
  Geschäftsfähigkeit §104}")
wille = g.add_nodes("Willenserklärung", "shape" => "record", "label" => "{
  Willenserklärung: |
  geheimer Vorbehalt §116 |
  Scheingeschäft §117 |
  Scherzerklärung §118 |
  Formmangel §125ff |
  gesetzl. Verbot §134 |
  Sittenwidrigkeit §138 |
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
antrag_erloescht = g.add_nodes( "Erlöschen §146" )
antrag_neu = g.add_nodes( "neuer Antrag §150 Abs.1" )
antrag_aender= g.add_nodes( "abändernde Annahme §150 Abs.2" )
annahme = g.add_nodes( "Vertragsannahme" , "shape" => "record", "label" => "{
  Vertragsannahme: |
  Anwesenheit §147 Abs.1 |
  Abwesenheit §147 Abs.2 |
  verspäteter Zugang §149 |
  gleichwertige Annahmehandlung §151}")
dissens= g.add_nodes( "Dissens" , "shape" => "record", "label" => "{
  Dissens: |
  offener §154 |
  versteckter §154}")

schuldverh = g.add_nodes("allg. Schuldverhältnis")
schuldner = g.add_nodes("Schuldner", "shape" => "record", "label" => "{
  Schuldner: |
  Hauptleistungspflicht §241 Abs.1 |
  Schutzpflicht §241 Abs.2 |
  Leistungsort §269 |
  Zahlungsort §270 |
  Gefahrenübergang §446f + §474 + §644 }")
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

spez_schuldverh = g.add_nodes("spez. Schuldverhältnis")

kv = g.add_nodes( "Kaufvertrag" )
wv = g.add_nodes( "Werkvertrag" )
dv = g.add_nodes( "Dienstvertrag" )
mv = g.add_nodes( "Mietvertrag" )

# Create edges between the nodes
g.add_edges( schuldrecht, vorraus , "style" => "bold")

g.add_edges( vorraus, wille , "style" => "bold")
g.add_edges( wille, vertreter )
g.add_edges( vertreter, nicht_vertreter )
g.add_edges( wille, anfecht )
g.add_edges( anfecht, anfecht_ersatz )
g.add_edges( anfecht, wille )
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

g.add_edges( annahme, schuldverh, "style" => "bold")
g.add_edges( annahme, spez_schuldverh, "style" => "bold")
g.add_edges( schuldverh, glaeubiger , "style" => "bold")
g.add_edges( schuldverh, schuldner , "style" => "bold")
g.add_edges( schuldner, schuldner_pflichtverl )
g.add_edges( schuldner_pflichtverl, schuldner_verantw )
g.add_edges( schuldner_verantw, schuldner_schadensers )

g.add_edges( spez_schuldverh, kv , "style" => "bold")
g.add_edges( spez_schuldverh, wv , "style" => "bold")
g.add_edges( spez_schuldverh, dv , "style" => "bold")
g.add_edges( spez_schuldverh, mv , "style" => "bold")

# Generate output image
g.output( :png => "schuldrecht.png" )
