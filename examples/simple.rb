$:.unshift File.dirname(__FILE__)+"/../lib"

require "graphviz/generator"
require 'graphviz'

graphviz =  GraphViz::new( "G" )
g =  Graphviz::Generator.new(graphviz: graphviz)


g.procedure('Web Request', { color: 'dodgerblue1' }).steps([
                                                                          'db1/mysql',
                                                                          'db1/proxysql',
                                                                          'app1/worker',
                                                                          'web1/nginx',
                                                                          'lb/lb',
                                                                        ])



graphviz.output(pdf: "#{$0}.pdf",
                png: "#{$0}.png",
                dot: "#{$0}.dot")

