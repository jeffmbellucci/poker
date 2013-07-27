
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

