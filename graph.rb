require "rubygems"
require "graphviz"

#require 'graphviz'

 g = GraphViz.new( :G, :type => :digraph )

 # Create two nodes
 anbahnung = g.add_node( "Vertragsanbahnung" )
 annahme = g.add_node( "Vertragsannahme" )
 kv = g.add_node( "Kaufvertrag" )
 wv = g.add_node( "Werkvertrag" )
 dv = g.add_node( "Dienstvertrag" )
 mv = g.add_node( "Mietvertrag" )

 # Create an edge between the two nodes
 g.add_edge( anbahnung, annahme )
 g.add_edge( annahme, kv )
 g.add_edge( annahme, wv )
 g.add_edge( annahme, dv )
 g.add_edge( annahme, mv )

 # Generate output image
 g.output( :png => "schuldrecht.png" )
