require "graphviz/generator/procedure"
require "graphviz/generator"
require 'graphviz'


describe Graphviz::Generator::Procedure do
  let(:graphviz) { GraphViz::new( "G" ) }
  let(:g) { Graphviz::Generator.new(graphviz: graphviz) }
  let(:testp) { Graphviz::Generator::Procedure.new(g, graphviz, 'testp', steps) }

  describe 'no steps' do
    let(:steps) { %w() }

    it 'is empty' do
      expect(testp).to be_a_kind_of(Graphviz::Generator::Procedure)
      expect(testp.to_s).to eql('Graphviz::Generator::Procedure(testp)')
      expect(testp.edges).to eql([])
      expect(graphviz.edge_count).to eql(0)
    end
  end

  describe 'a process' do
    let(:steps) { %w(clust3/node1 clust3/node2 clust4/node1) }
    it 'has edges' do
      expect(testp.edges.length).to eql(2)
      expect(graphviz.edge_count).to eql(3)
    end
  end
end
