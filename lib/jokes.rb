class Jokes
  attr_reader :list_of_jokes

  def initialize
      @list_of_jokes = list_of_jokes
  end

 @list_of_jokes = [
     'please stop tallking, your mouth stinks, I can barely breath',
     'at age 60 you still play snake and lader',
     'your gottee looks good on you, it reminds me of the goat we killed for easter celebration',
     'ooh, you are the programmer right? Do you remember the day you got stuck in the bathroom 
     because the instruction on the soap cover said: Lather, Rinse, Repeat',
    ]

 def get_joke 
    @list_of_jokes 

 end

end    

any_joke = Jokes.new
puts any_joke.get_joke