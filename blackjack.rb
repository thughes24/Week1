=begin
create deck
dealer gets first card
you get both cards
hit or stay until stay
dealer gets second card
hit until > 17
compare values
decide winner
=end

require 'pry'

def make_deck(arr)
  suits = %w[ Hearts Diamonds Clubs Spades ]
  values = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
  suits.each do |suit|
    values.each do |value|
      arr << "#{value} of #{suit}"
    end
  end
end

def card_totals(cards)
  total = 0
  cards.each do |x|
    value = x.split(' ').first
    if value == "Jack" || value == "Queen" || value == "King"
      value = 10
      total += value
    elsif value == "Ace"
      value = 11
      total += value
    else 
      total += value.to_i
    end
  end
  total
end

def player_card(d,c)
  card = d.sample 
  c << d.delete(card)
  card
end

def dealer_card(d,c)
  card = d.sample
  c << d.delete(card)
  card
end

def start_game(d,p,c)
  make_deck(d)
  puts " Your first card is #{player_card(d, p)}"
  puts " Your second card is #{player_card(d, p)}"
  puts " Dealers first card is #{dealer_card(d, c)}"
  puts " You are on #{card_totals(p)}"
  puts " Dealer is on #{card_totals(c)}"
end

def hit_or_stay(d, c)
  begin
    puts "Do you want to hit or stay?"
    result = gets.chomp.downcase
    case result
      when "h"
        puts "You drew #{player_card(d, c)}"
        puts "You are now on #{card_totals(c)}"
        if card_totals(c) > 21
          return "bust"
        end
      when "s"
    end
  end until result == 's'
  return card_totals(c)
end

def dealers_move(d,p,c)
  puts "Dealer drew #{dealer_card(d, c)}"
  puts "Dealer is now on #{card_totals(c)}" 
  if card_totals(c) < 17 && card_totals(c) < card_totals(p)
    begin
      puts "Dealer drew #{dealer_card(d, c)}"
      puts "Dealer is now on #{card_totals(c)}"
      if (card_totals(c) > card_totals(p)) && card_totals(c) < 22
        return card_totals(c)
      elsif card_totals(c) > 21
        return "bust"
      end
    end while card_totals(c) < 17 && (card_totals(c) < card_totals(p))
  end
  return card_totals(c)
end


begin
  system 'clear'
  deck = []
  players_cards = []
  dealers_cards = []
  start_game(deck,players_cards, dealers_cards)
  if hit_or_stay(deck, players_cards) != "bust"
    if dealers_move(deck, players_cards, dealers_cards) != "bust"
      puts "Dealer Wins"
    else
      puts "Dealer Bust! Player Wins"
    end
  else
    puts "You Bust! Dealer Wins"
  end
  puts "play again? (y/n)"
  finished = gets.chomp.downcase
end until finished == "n"












