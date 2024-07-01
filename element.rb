#Element Class
class Element
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def compare_to(element)
        fail "This method should be overridden"
    end 
end

#Again, most of this content was implemented the same as what
#was described in the project.
#Used switch cases and compared against each class for the result
class Rock < Element
    def compare_to(element)
        case element.name
        when 'Rock'
            return "Rock equals Rock", "Tie"
        when 'Paper'
            return "Paper covers Rock", "Lose"
        when 'Scissors'
            return "Rock crushes Scissors", "Win"
        when 'Lizard'
            return "Rock crushes Lizard", "Win"
        when 'Spock'
            return "Spock vaporizes Rock", "Lose"
        end
    end
end

class Paper < Element
    def compare_to(element)
        case element.name
        when 'Rock'
            return "Paper covers Rock", "Win"
        when 'Paper'
            return "Paper equals Paper", "Tie"
        when 'Scissors'
            return "Scissors cut Paper", "Lose"
        when 'Lizard'
            return "Lizard eats Paper", "Lose"
        when 'Spock'
            return "Paper disproves Spock", "Win"
        end
    end
end

class Scissors < Element
    def compare_to(element)
        case element.name
        when 'Rock'
            return "Rock crushes Scissors", "Lose"
        when 'Paper'
            return "Scissors cut Paper", "Win"
        when 'Scissors'
            return "Scissors equals Scissors", "Tie"
        when 'Lizard'
            return "Scissors decapitate Lizard", "Win"
        when 'Spock'
            return "Spock smashes Scissors", "Lose"
        end
    end
end

class Lizard < Element
    def compare_to(element)
        case element.name
        when 'Rock'
            return "Rock crushes Lizard", "Lose"
        when 'Paper'
            return "Lizard eats Paper", "Win"
        when 'Scissors'
            return "Scissors decapitate Lizard", "Lose"
        when 'Lizard'
            return "Lizard equals Lizard", "Tie"
        when 'Spock'
            return "Lizard poisons Spock", "Win"
        end
    end
end

class Spock < Element
    def compare_to(element)
        case element.name
        when 'Rock'
            return "Spock vaporizes Rock", "Win"
        when 'Paper'
            return "Paper disproves Spock", "Lose"
        when 'Scissors'
            return "Spock smashes Scissors", "Win"
        when 'Lizard'
            return "Lizard poisons Spock", "Lose"
        when 'Spock'
            return "Spock equals Spock", "Tie"
        end
    end
end

#create global moves array
rock  = Rock.new('Rock')
paper = Paper.new('Paper')
scissors = Scissors.new('Scissors')
lizard = Lizard.new('Lizard')
spock = Spock.new('Spock')
$moves = [rock,paper,scissors,lizard,spock]