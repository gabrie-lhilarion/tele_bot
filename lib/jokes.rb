class Jokes
  def get_joke 
    list_of_jokes = [
        'at age 60 you still play snake and lader',
        'Son: dad what is today. Father: today is monday. Son: dad is today always monday?',
        'please stop tallking, your mouth stinks, I can barely breath',
        'Girl: hey guy did you get it? Boy: no I did not. Girl: just check in your sperm folder, sorry spam folder',
        'your gottee looks good on you, it reminds me of the goat we killed for easter celebration',
        'Interviewer: madam what is the sex of your baby? Woman: please!, please! this is still a baby, it does not have sex yet',
        'ooh, you are the programmer right? Do you remember the day you got stuck in the bathroom because the instruction on the soap cover said: Lather, Rinse, Repeat',
       ]
    x = list_of_jokes.sample
    [x,list_of_jokes.index(x)]

  end

end    


 