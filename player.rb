require_relative "element"
require_relative "history"

#Did most of this section as described by assignment. Will leave most 
#of this uncommented except for undescribed functionality
class Player
    attr_reader :name, :history
    def initialize(name,history)
        @name = name
        @history = history
    end
    def play()
        fail "This method should be overridden"
    end 
end

class StupidBot < Player
    def play()
        #I made it so the return is an int, which I use for
        #indexing the $moves global array. Since it starts at
        #0, and 0 is rock, stupid bot only returns 0

        #Log rock and return 0
        history.log_play(0)
        return 0
    end
end

class LastPlayBot < Player
    def play()
        #If length of opponents_plays is < 1 (basically 0),
        #No moves for last play bot to get, give rock
        if history.opponent_plays.length < 1
            history.log_play(0)
            return 0
        else
            #Else, plays last move opponent played, which would be
            #the opponents_play array last index [-1]
            history.log_play(history.opponent_plays[-1])
            return history.opponent_plays[-1]
        end
    end
end

class RandomBot < Player
    def play()
        #rand(5) returns random number between 0-4
        choice = rand(5)
        history.log_play(choice)
        return choice
    end
end

class IterativeBot < Player
    def play()
        #If no plays played, play rock
        if history.plays.length < 1
            history.log_play(0)
            return 0
        #else, get last move plays[-1] and add 1
        else
            choice = history.plays[-1] + 1
            #If this makes the move greater than 5, set back to rock
            if choice > 4
                history.log_play(0)
                return 0
            #else, play move
            else
                history.log_play(choice)
                return choice
            end
        end
    end
end

class Human < Player
    def play()
        #Loop for choices
        loop do
            puts "(1) Rock"
            puts "(2) Paper"
            puts "(3) Scissors"
            puts "(4) Lizard"
            puts "(5) Spock"
            print "Enter your move: "
            #Get input, chomp trailing \n
            input = gets.chomp
            #Switch case for input
            case input
            #If 1, rock was selected. Since valid, return
            #Note, each option is one less than input due to
            #indexing mentioned before
            when '1'
                history.log_play(0)
                return 0
            #Paper
            when '2'
                history.log_play(1)
                return 1
            #scissors
            when '3'
                history.log_play(2)
                return 2
            #lizard
            when '4'
                history.log_play(3)
                return 3
            #spock
            when '5'
                history.log_play(4)
                return 4
            #If not 1-5, not a valid choice, go to loop again
            else
                puts "Invalid move - try again"
            end
        end
    end
end