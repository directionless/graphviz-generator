require "graphviz/generator/version"
require "graphviz/generator/cluster"
require "graphviz/generator/procedure"
require 'graphviz'


module Graphviz
  class Generator
    def initialize(graphviz: nil)
      @graphviz = if graphviz.nil?
                    GraphViz::new( "G" )
                  else
                    graphviz
                  end

      @cluster_number = 0
      @graphviz = graphviz
      @clusters = {}
      @procedures = {}

    end

    def cluster_options(**opts)
      {
        color: 'lightgrey',
        style: 'filled',
      }.merge(opts)
    end

    def node_options(**opts)
      {
        color: 'white',
        style: 'filled',
      }.merge(opts)
    end

    def clusters()
      @clusters.keys
    end

    def add_cluster(name, options={})
      cluster_name = "cluster#{@cluster_number}_#{clean(name)}"

      gv_object = Graphviz::Generator::Cluster.new(@graphviz, cluster_name, cluster_options(label: name), node_options)
      @clusters[name] = gv_object

      @cluster_number += 1

      # @gv_object = @graphviz.add_graph(@cluster_name, cluster_options.merge(options))

    end

    def cluster(name)
      unless @clusters.include?(name)
        self.add_cluster(name)
      end
      @clusters.fetch(name)
    end


    def procedures()
      @procedures.keys
    end

    def add_procedure(name, options = {})
      p = Graphviz::Generator::Procedure.new(self, @graphviz, name, options)
      @procedures[name] = p
      return p
    end

    def procedure(name, options = {})
      unless @procedures.include?(name)
        self.add_procedure(name, options)
      else
        @procedures.fetch(name)
      end
    end

    def clean(str)
      str.gsub(/[^a-zA-Z0-9]/, '_')
    end


  end
end
