module Graphviz
  class Generator
    class Procedure
      attr_reader :edges

      def to_s
        "Graphviz::Generator::Procedure(#{@name})"
      end

      def initialize(generator, graphviz, name, options = {}, node_options = {})
        @generator = generator
        @graphviz = graphviz
        @name = name

        @options = options
        @node_options = node_options

        @edges = []
      end

      def steps(steps)
        # Make edges for each step
        # Use the implicit creates the rest of Generator provides
        last_node = nil
        steps.each do |step|
          cluster, node = step.split('/')
          this_node = @generator.cluster(cluster).node(node)
          edge = [last_node, this_node]
          unless @edges.include?(edge) || last_node.nil?
            @graphviz.add_edges(*edge, @options)
            @edges << edge
          end
          last_node = this_node
        end
      end

      def ledgend()
        #if @edges.length > 0
        #  # fake a ledgend
        #  ledgends = @generator.cluster('')
        #  ledgends.add(@name, {style: 'none', color: 'none'})
        #  @graphviz.add_edges(@edges.last, ledgends.node(@name), @options.merge(style: 'dotted'))
        #end
      end

    end
  end
end
