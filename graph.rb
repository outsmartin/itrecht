require "rubygems"
require "graphviz"

#require 'graphviz'

g = GraphViz.new( :G, :type => :digraph )
g.node["shape"] = "box"

# Create nodes
schuldrecht = g.add_nodes( "Schuldrecht" )

vorraus = g.add_nodes("Vorraussetzungen", "shape" => "record", "label" => "{Vorraussetzungen:| Geschäftsfähigkeit §104}")
wille = g.add_nodes("Willenserklärung", "shape" => "record", "label" => "{Willenserklärung: |
   geheimer Vorbehalt §116 |
   Scheingeschäft §117 |
   Scherzerklärung §118 |
   Formmangel §125ff |
   gesetzl. Verbot §134 |
   Sittenwidrigkeit §138 |
   Auslegung §133}")
anfecht = g.add_nodes("Anfechtung", "shape" => "record", "label" => "{Anfechtung: §142 Abs.1 | Irrtum §119 | Übermittlungsfehler §120}")
anfecht_ersatz = g.add_nodes("Schadensersatz §122")
intent = g.add_nodes("Letter of Intent §133 + §157")
anbahn = g.add_nodes("Vertragsanbahnung §311 Abs.2")
anbahn_pflicht = g.add_nodes("Pflichten §241 Abs.2")
anbahn_schaden = g.add_nodes("Schadensersatz §280 Abs.1 Satz 1")
wirk = g.add_nodes("Wirksamwerden §130")

annahme = g.add_nodes( "Vertragsannahme" )
kv = g.add_nodes( "Kaufvertrag" )
wv = g.add_nodes( "Werkvertrag" )
dv = g.add_nodes( "Dienstvertrag" )
mv = g.add_nodes( "Mietvertrag" )

# Create edges between the nodes
g.add_edges( schuldrecht, vorraus , "style" => "bold")
g.add_edges( vorraus, wille , "style" => "bold")
g.add_edges( wille, anfecht )
g.add_edges( anfecht, anfecht_ersatz )
g.add_edges( anfecht, wille )
g.add_edges( wille, anbahn)
g.add_edges( anbahn, anbahn_pflicht)
g.add_edges( anbahn_pflicht, anbahn_schaden)
g.add_edges( wille, intent, "style" => "dashed")
g.add_edges( intent, wille, "style" => "dashed")
g.add_edges( wille, wirk , "style" => "bold")
g.add_edges( wirk, annahme , "style" => "bold")
g.add_edges( annahme, kv , "style" => "bold")
g.add_edges( annahme, wv , "style" => "bold")
g.add_edges( annahme, dv , "style" => "bold")
g.add_edges( annahme, mv , "style" => "bold")

# Generate output image
g.output( :png => "schuldrecht.png" )
