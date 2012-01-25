require "rubygems"
require "graphviz"

#require 'graphviz'

 g = GraphViz.new( :G, :type => :digraph )
 g.node["shape"] = "box"

 # Create nodes
 anbahnung = g.add_nodes( "Vertragsanbahnung" )

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
 anfechtersatz = g.add_nodes("Schadensersatz §122")
 intent = g.add_nodes("Letter of Intent §133 + §157")
 wirk = g.add_nodes("Wirksamwerden §130")

 annahme = g.add_nodes( "Vertragsannahme" )
 kv = g.add_nodes( "Kaufvertrag" )
 wv = g.add_nodes( "Werkvertrag" )
 dv = g.add_nodes( "Dienstvertrag" )
 mv = g.add_nodes( "Mietvertrag" )

 # Create edges between the nodes
 g.add_edges( anbahnung, vorraus )
 g.add_edges( vorraus, wille )
 g.add_edges( wille, anfecht )
 g.add_edges( anfecht, anfechtersatz )
 g.add_edges( anfecht, wille )
 g.add_edges( wille, intent)
 g.add_edges( intent, wille)
 g.add_edges( wille, wirk )
 g.add_edges( wirk, annahme )
 g.add_edges( annahme, kv )
 g.add_edges( annahme, wv )
 g.add_edges( annahme, dv )
 g.add_edges( annahme, mv )

 # Generate output image
 g.output( :png => "schuldrecht.png" )
