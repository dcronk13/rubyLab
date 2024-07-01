#History class
#Only thing to mention here is that I got errors in count without the self
#call. Don't know if this was due to the way I called the function,
#but works with self.
class History
    attr_accessor :plays
    attr_accessor :opponent_plays
    attr_accessor :score

    def initialize()
        @plays = Array.new
        @opponent_plays = Array.new
        @score = 0
    end

    def log_play(move)
        plays.push(move)
    end

    def log_opponent_play(move)
        opponent_plays.push(move)
    end

    def add_score()
        self.score += 1
    end
end