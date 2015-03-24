
Choices = { "r" => "Rock", "p" => "Paper", "s" => "Scissors"}


def win_or_lose(choice1,choice2)
  if choice1 == choice2
    puts "You both went the same, it's a tie!"
  else
    case choice1
      when "p" then puts choice2 == "s" ? "You went #{Choices[choice1]}, Computer went Scissors, you win!" : "You went #{Choices[choice1]}, computer went Rock, you lose!"
      when "r" then puts choice2 == "s" ? "You went #{Choices[choice1]}, Computer went Scissors, you lose!" : "You went #{Choices[choice1]}, computer went Paper, you win!"
      when "s" then puts choice2 == "p" ? "You went #{Choices[choice1]}, Computer went Paper, you win!" : "You went #{Choices[choice1]}, computer went Rock, you lose!"
    end  
  end
end


loop do

puts "Lets play rock paper scissors!"
begin
  puts "Make a choice (r,p,s)"
  player_choice = gets.chomp.downcase
end until Choices.keys.include?(player_choice)

computer_choice = Choices.keys.sample

win_or_lose(player_choice,computer_choice)

puts "play again? (y/n)"
if gets.chomp.downcase == 'n'
  puts "Thanks for playing"
  break
end 
end