class Bowling
  def roll(pins)
  end

  def score
    
  end
end

class Bowling

  FRAME_COUNT = 10

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push pins
  end

  def score
    score, attempt = 0, 0
    FRAME_COUNT.times do 
      if strike?(attempt)
        score += strike_score(attempt)
        attempt += 1
      elsif spare?(attempt)
        score += spare_score(attempt)
        attempt += 2
      else
        score += @rolls[attempt] + @rolls[attempt + 1]
        attempt += 2
      end
    end
    score
  end

  private

  def strike?(attempt)
    @rolls[attempt] == 10
  end

  def spare?(attempt)
    @rolls[attempt] + @rolls[attempt + 1] == 10
  end

  def strike_score(attempt)
    10 + @rolls[attempt + 1] + @rolls[attempt + 2]
  end

  def spare_score(attempt)
    10 + @rolls[attempt + 2]
  end
end
