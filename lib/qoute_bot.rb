# rubocop:disable Metrics/CyclomaticComplexity
require 'telegram_bot'
require_relative 'motivation.rb'
require_relative 'jokes.rb'

token = '1247899419:AAEDYdLqMaIbKITIFh5YtIY-xk05X0VSjTo'
bot = TelegramBot.new(token:token)
puts '.. bot is running..'
bot.get_updates(fail_silently: true) do |message| 
  puts "@#{message.from.first_name} wrote: #{message.text}"
  chatee_text = message.get_command_for(bot)
  message.reply do |reply|
    case chatee_text 
    when /start/i
      reply.text = "Nice to start chating"
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
      reply.text = "Please say something!"  
    end  
    puts "you replied: #{reply.text.inspect}"
    reply.send_with(bot)
  end  
end  
=begin
class MyBot
  def initialize
    token = '1247899419:AAEDYdLqMaIbKITIFh5YtIY-xk05X0VSjTo'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome! Use  /start to start the bot,  /stop to end the bot, /motivate to get a diffrent motivational quote everytime you request for it, /joke to get a joke everytime you request for it or just enter your first name")
        when '/stop'

          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)

        when message.from.first_name
          joke = Jokes.new
          y = joke.initial_joke

          bot.api.send_message(chat_id: message.chat.id, text: "Lol!, #{message.from.first_name}, #{y} ", date: message.date)

        when '/joke'
          joke = Jokes.new
          y = joke.my_joke
          if y[1].even?
            mes = message.from.first_name
            mes += ' ' + y[0]
          else
            mes = y[0]
          end

          bot.api.send_message(chat_id: message.chat.id, text: mes.to_s, date: message.date)

        when '/motivate'
          values = Motivate.new
          value = values.select_random
          bot.api.schend_message(at_id: message.chat.id, text: value['text'].to_s, date: message.date)
        else bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, use /start,/stop,/motivate,/joke or just enter your First Name")
        end
      end
    end
  end
end
=end
# rubocop:enable Metrics/CyclomaticComplexity
