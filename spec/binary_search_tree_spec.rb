require 'spec_helper'
require './lib/binary_search_tree'

RSpec.describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  it 'exists' do
    expect(tree).to be_a BinarySearchTree
  end

  it 'inserts a node into the tree' do
    node1 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    node2 = tree.insert(16, "Johnny English")
    node3 = tree.insert(92, "Sharknado 3")
    node4 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(node1).to eq 0
    expect(node2).to eq 1
    expect(node3).to eq 1
    expect(node4).to eq 2
  end

  it 'checks if a score is included in the BST' do
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.include?(16)).to be true
    expect(tree.include?(72)).to be false
  end

  it 'returns a depth of a score if included in BST' do
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.depth_of(92)).to eq 1
    expect(tree.depth_of(50)).to eq 2
    expect(tree.depth_of(54)).to eq nil
  end

  it 'returns the data of movie with max score' do
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expect(tree.max).to eq({"Sharknado 3" => 92})
  end

  it 'returns the data of movie with min score' do
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(92, "Sharknado 3")

    expect(tree.min).to eq({"Johnny English" => 16})
  end

  it 'sorts the data min score to max score' do
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")

    expect(tree.sort).to eq([{"Johnny English"=>16},
      {"Hannibal Buress: Animal Furnace"=>50},
      {"Bill & Ted's Excellent Adventure"=>61},
      {"Sharknado 3"=>92}])
  end

  it 'load txt data and creates binary_search_tree' do

    expect(tree.load('movies.txt')).to eq(99)
  end

  it 'reports the health of tree' do
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    expect(tree.health(0)).to eq([[98, 7, 100]])
    expect(tree.health(1)).to eq([[58, 6, 85]])
    expect(tree.health(2)).to eq([[36, 2, 28], [93, 3, 42]])
  end
end
