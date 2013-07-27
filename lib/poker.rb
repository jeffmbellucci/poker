SUITS = %w{S H D C}

RANKS = {
  "2" => 1,
  "3" => 2,
  "4" => 3,
  "5" => 4,
  "6" => 5,
  "7" => 6,
  "8" => 7,
  "9" => 8,
  "10" => 9,
  "J" => 10,
  "Q" => 11,
  "K" => 12,
  "A" => 13
}

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

end



class Deck
  attr_reader :deck

  def initialize
    build_deck
    shuffle
  end

  def build_deck
    @deck = []
    RANKS.keys.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(suit, rank)
      end
    end
    @deck = @deck.shuffle
  end

  def deal(cards)

    @deck.pop(cards)
  end

  def shuffle
    @deck.shuffle
  end
end





class Hand
  #Holds five cards
  attr_reader :hand, :rank

  def initialize(arr_cards)
    @hand = arr_cards
  end

  def show_hand
    card_string = ""
    @hand.each do |card|
      card_string << card.rank + card.suit + " "
    end
    print card_string
  end

  def get_ranks_hash
    card_values = Hash.new(0)
    rank_array = []
    @hand.each do |card|
      rank_array << RANKS[card.rank]
    end
    rank_array
    rank_array.each do |rank|
      card_values[rank] += 1
    end
    card_values
  end



  def pair?
    rank_hash = get_ranks_hash
    rank_hash.values.include?(2)
  end

  def two_pair?
    rank_hash = get_ranks_hash
    rank_hash.keys.uniq.length == 3
  end

  def three_of_kind?
    rank_hash = get_ranks_hash
    rank_hash.values.include?(3)
  end

  def straight?
    rank_hash = get_ranks_hash
    sorted_values = rank_hash.keys.sort
    sorted_values.each_with_index do |value, i|
      next if i == 4
      return false unless ((value + 1) == sorted_values[i + 1])
    end
    true
  end

  def

  def four_of_kind?
    rank_hash = get_ranks_hash
    rank_hash.values.include?(4)
  end

  def full_house?


  end


end




class Game
  # def play
#     shuffle
#     deal_hand
#     # bet
# #     discard
# #     deal_draw
# #     bet
#     showdown
#   end
end
