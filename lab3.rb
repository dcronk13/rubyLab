require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < David Cronk >					 	#
#  < cronkd@oregonstate.edu >	        #
#										#
#########################################

#Function to run game
def game(rounds)
	#print starting remarks. use empty puts for next line
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	puts
	#Prompt for type of players
	puts "Please choose two players:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"

	#initialize choices so they can be used outside next loop
	pOne = 0
	pTwo = 0

	#loop until break
	loop do
		#prompt user for choices
		print "Select player 1: "
		#Converts get to an integer. If it can't be converted, returns nil
		pOne = Integer(gets) rescue nil
		print "Select player 2: "
		pTwo = Integer(gets) rescue nil

		#If either one returned nil, invalid and restart
		if pOne == nil or pTwo == nil
			puts "Invalid choice(s) - start over"
			puts
		#else both inputs were integers
		else
			#if p1 choice is not within bounds, loop
			if pOne > 5 or pOne < 1
				puts "Invalid choice(s) - start over"
				puts
			#if p2 choice not within bounds, loop
			elsif pTwo > 5 or pTwo < 1
				puts "Invalid choice(s) - start over"
				puts
			#else, choice is valid so break loop
			else
				break
			end
		end
	end

	#declare player 1 and 2 objects so they can be used outside statements
	p1 = nil
	p2 = nil

	#switch case for player one. Used print statements to not give next line
	case pOne
	#if 1, stupid bot, print begining statement "p1 vs. "
	when 1
		p1 = StupidBot.new('StupidBot', History.new)
		print "StupidBot vs. "
	#if 2, random bot, print begining statement "p1 vs. "
	when 2
		p1 = RandomBot.new('RandomBot', History.new)
		print "RandomBot vs. "
	#if 3, iterative bot, print begining statement "p1 vs. "
	when 3
		p1 = IterativeBot.new('IterativeBot', History.new)
		print "IterativeBot vs. "
	#if 4, lastplay bot, print begining statement "p1 vs. "
	when 4
		p1 = LastPlayBot.new('LastPlayBot', History.new)
		print "LastPlayBot vs. "
	#if 5, human, print begining statement "p1 vs. "
	when 5
		p1 = Human.new('Human', History.new)
		print "Human vs. "
	end

	#Same switch case for p2, print rest of statement
	case pTwo
	when 1
		p2 = StupidBot.new('StupidBot', History.new)
		puts "StupidBot"
		puts
	when 2
		p2 = RandomBot.new('RandomBot', History.new)
		puts "RandomBot"
		puts
	when 3
		p2 = IterativeBot.new('IterativeBot', History.new)
		puts "IterativeBot"
		puts
	when 4
		p2 = LastPlayBot.new('LastPlayBot', History.new)
		puts "LastPlayBot"
		puts
	when 5
		p2 = Human.new('Human', History.new)
		puts "Human"
		puts
	end

	#Main game loop
	#Make count variable that increments as game goes on
	count = 1
	#Loop until condition met
	loop do
		#If count greater than 5, stop loop
		if count > 5
			break
		end
		#Print round count
		puts "Round #{count}:"

		#Play both p1 and p2 turns. I created this so it returns an int 0-4 for choices
		p1move = p1.play()
		p2move = p2.play()

		#Log opponent plays
		p1.history.log_opponent_play(p2move)
		p2.history.log_opponent_play(p1move)

		#Print what p1 and p2 chose
		puts "Player 1 chose #{$moves[p1move].name}"
		puts "Player 2 chose #{$moves[p2move].name}"
		#get the results and store in values. Since compare_to returns
		#2 variables, results[0] is result, results[1] is win, lose, or tie
		values = $moves[p1move].compare_to($moves[p2move])
		#print result
		puts values[0]

		#If win, that means p1 won.
		if values[1] == "Win"
			puts "Player 1 won the round"
			puts
			#Add score to p1
			p1.history.add_score()
		#If lose, p2 won
		elsif values[1] == "Lose"
			puts "Player 2 won the round"
			puts
			#Add score to p2
			p2.history.add_score()
		#Else, it was a tie
		else
			puts "Round was a tie"
			puts
		end
		#End of loop, increment count
		count += 1
	end

	#Print final results by getting score for each player
	puts "Final score is #{p1.history.score} to #{p2.history.score}"

	#Win con 
	#If p1 score > p2, p1 won
	if p1.history.score > p2.history.score
		puts "Player 1 wins"
	#Vice versa, p2 won
	elsif p1.history.score < p2.history.score
		puts "Player 2 wins"
	#Else it was a tie
	else
		puts "Game was a draw"
	end
end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)