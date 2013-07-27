
require 'poker'

describe "#Deck" do
  subject(:deck) { Deck.new}
  it "create hand of five random cards" do
    hand = deck.deal(5)
    hand.length.should == 5 && deck.deck.length.should == 47
  end
  it "gives 2 cards" do
    two = deck.deal(2)
    two.length.should == 2
  end
  it "should have 52 uniq cards" do
    deck.deck.uniq.length == 52
  end
end

describe "#Hand" do
  it "finds pair" do
    hand = Hand.new([Card.new("A", "H"), Card.new("A", "S"), Card.new("3", "H"),
                     Card.new("4", "H"), Card.new("5", "H")])
    hand.pair?.should == true
  end
  it "finds two pair" do
    hand = Hand.new([Card.new("A", "H"), Card.new("A", "S"), Card.new("3", "H"),
                     Card.new("3", "S"), Card.new("5", "H")])
    hand.two_pair?.should == true
  end
  it "distinguishes between two pair and three of a kind" do
    hand = Hand.new([Card.new("A", "H"), Card.new("A", "S"), Card.new("A", "C"),
                     Card.new("3", "S"), Card.new("5", "H")])
    hand.two_pair?.should == false
  end
  it "finds three of a kind" do
    hand = Hand.new([Card.new("A", "H"), Card.new("A", "S"), Card.new("A", "C"),
                     Card.new("4", "H"), Card.new("5", "H")])
    hand.three_of_kind?.should == true
  end
  it "finds straight" do
    hand = Hand.new([Card.new("2", "H"), Card.new("3", "H"), Card.new("4", "H"),
                     Card.new("5", "H"), Card.new("6", "H")])
    hand.straight?.should == true
  end
  it "finds straight that starts with Ace" do
    hand = Hand.new([Card.new("2", "H"), Card.new("3", "H"), Card.new("4", "H"),
                     Card.new("5", "H"), Card.new("A", "H")])
    hand.straight?.should == true
  end
  it "finds flush" do
    hand = Hand.new([Card.new("2", "H"), Card.new("3", "H"), Card.new("4", "H"),
                     Card.new("5", "H"), Card.new("6", "H")])
    hand.flush?.should == true
  end
  it "finds straight flush" do
    hand = Hand.new([Card.new("2", "H"), Card.new("3", "H"), Card.new("4", "H"),
                     Card.new("5", "H"), Card.new("6", "H")])
    hand.straight_flush?.should == true
  end
end

