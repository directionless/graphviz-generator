module Graphviz
  class Generator
    class Cluster

      def initialize(graphviz, name, options = {}, node_options = {})
        @graphviz = graphviz
        @name = name
        @nodes = {}
        @node_options = node_options
        @gv_object = @graphviz.add_graph(@name, options)

        return @gv_object
      end

      def to_s
        "Graphviz::Generator::Cluster(#{@name})"
      end

      def add(name, options={})
        node_name = "#{clean(@name)}_#{clean(name)}"
        all_options = @node_options.merge({label: name}).merge(options)

        obj = @gv_object.add_nodes(node_name, all_options)
        @nodes[name] = obj
      end

      def node(node)
        unless @nodes.keys.include? node
          self.add(node)
        end
        @nodes.fetch(node)
      end

      def clean(str)
        str.gsub(/[^a-zA-Z0-9]/, '_')
      end

      def nodes()
        @nodes.keys
      end
    end
  end
end
