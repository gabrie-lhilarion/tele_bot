require 'telegram_bot'
require_relative 'motivation.rb'
require_relative 'jokes.rb'

token = '1247899419:AAEDYdLqMaIbKITIFh5YtIY-xk05X0VSjTo'
bot = TelegramBot.new(token: token)
puts '.. bot is running..'
bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.first_name} wrote: #{message.text}"
  chatee_text = message.get_command_for(bot)
  message.reply do |reply|
    case chatee_text
    when /start/i
      reply.text = 'Nice to start chating'
    when /motivate/i
      values = Motivate.new
      value = values.select_random
      reply.text = value['text'].to_s
    when /joke/i
      joke = Jokes.new
      y = joke.my_joke
      if y[1].even?
        mes = message.from.first_name
        mes += ' ' + y[0]
      else
        mes = y[0]
      end
      reply.text = mes.to_s

    else
      reply.text = 'Please say something!'
    end
    puts "you replied: #{reply.text.inspect}"
    reply.send_with(bot)
  end
end
