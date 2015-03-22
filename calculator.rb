require 'pry'
def say(arg)
  puts "=> Please Enter a #{arg}: "
end

begin
  say('number')
  num1 = gets.chomp
  num1_converted = num1.to_i
end until num1_converted >= 0


begin
  say('second number')
  num2 = gets.chomp
  num2_converted = num2.to_i
end until num2_converted >=0

begin
  puts "Enter 1 to Add, 2 to Subtract, 3 to Multiply or 4 to Divide"
  op = gets.chomp
end until op == "1" || op == "2" || op == "3" || op == "4"

case op
  when "1"
    puts "#{num1_converted} + #{num2_converted} = #{num1_converted + num2_converted}"
  when "2"
    puts "#{num1_converted} - #{num2_converted} = #{num1_converted - num2_converted}"
  when "3"
    puts "#{num1_converted} x #{num2_converted} = #{num1_converted * num2_converted}"
  when "4"
    puts "#{num1_converted} / #{num2_converted} = #{num1_converted.to_f / num2_converted.to_f}"
end