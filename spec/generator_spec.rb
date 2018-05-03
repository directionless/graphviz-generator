require "graphviz/generator"
require 'graphviz'


describe Graphviz::Generator do
  let(:graphviz) { GraphViz::new( "G" ) }
  let(:g) { Graphviz::Generator.new(graphviz: graphviz) }

  it 'no clusters yet' do
    expect(g).to be_a_kind_of(Graphviz::Generator)
    expect(g.clusters).to eql(%w())
  end

  it 'make clusters' do
    g.add_cluster('clust1')
    g.cluster('clust2')
    expect(g.clusters).to eql(%w(clust1 clust2))
    expect(g.cluster('clust1')).to be_a_kind_of(Graphviz::Generator::Cluster)
    expect(g.cluster('clust2')).to be_a_kind_of(Graphviz::Generator::Cluster)
  end

  it 'make clusters and nodes' do
    # using some implicit creates here
    node31 = g.cluster('clust3').node('node1')
    node32 = g.cluster('clust3').node('node2')
    node41 = g.cluster('clust4').node('node1')
    expect(graphviz.edge_count).to eql(0)
    graphviz.add_edges(node31, node32)
    graphviz.add_edges(node31, node41)
    expect(graphviz.edge_count).to eql(2)
  end

  it 'makes a procedure' do
    steps = %w(clust3/node1 clust3/node2 clust4/node1)
    g.add_procedure('Flow', steps)
    expect(graphviz.edge_count).to eql(3)
  end

end
