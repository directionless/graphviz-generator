require "graphviz/generator/cluster"
require 'graphviz'


describe Graphviz::Generator::Cluster do
  let(:graphviz) { GraphViz::new( "G" ) }
  let(:testcl) { Graphviz::Generator::Cluster.new(graphviz, 'testcl') }

  it 'no nodes yet' do
    expect(testcl).to be_a_kind_of(Graphviz::Generator::Cluster)
    expect(testcl.to_s).to eql('Graphviz::Generator::Cluster(testcl)')
    expect(testcl.nodes).to eql([])
  end

  it 'add(node)' do
    # This should add the node
    testcl.add('node1')
    expect(testcl.nodes).to eql(%w(node1))

    node = testcl.node('node1')
    expect(testcl.nodes).to eql(%w(node1))
    expect(node).to be_a_kind_of(GraphViz::Node)
  end

  it '[node]' do
    node = testcl.node('node1')
    expect(testcl.nodes).to eql(%w(node1))
    expect(node).to be_a_kind_of(GraphViz::Node)
  end

  it 'two node and an edge' do
    node1 = testcl.node('node1')
    node2 = testcl.node('node2')
    expect(graphviz.edge_count).to eql(0)
    expect(testcl.nodes).to eql(%w(node1 node2))

    graphviz.add_edges(node1, node2)
    expect(graphviz.edge_count).to eql(1)
  end
end
