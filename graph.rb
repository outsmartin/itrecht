require "graphviz"

require 'graphviz'

 g = GraphViz.new( :G, :type => :digraph )

 # Create two nodes
 hello = g.add_node( "$310" )
 world = g.add_node( "World" )

 # Create an edge between the two nodes
 g.add_edge( hello, world )

 # Generate output image
 g.output( :png => "hello_world.png" )
