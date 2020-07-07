# rubocop:disable Style/ConditionalAssignment
require 'telegram_bot'
require_relative 'motivation.rb'
require_relative 'jokes.rb'

all_qoute = Motivate.new
single_qoute = all_qoute.select_random
jokes = Jokes.new
a_joke = jokes.my_joke
token = '1247899419:AAEDYdLqMaIbKITIFh5YtIY-xk05X0VSjTo'
bot = TelegramBot.new(token: token)
puts '.. bot is running..'
bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.first_name} wrote: #{message.text}"
  message.reply do |reply|
    case message.get_command_for(bot)
    when '/start'
      reply.text = 'Reply with /joke, /motivate or your first name'
    when '/motivate'
      reply.text = single_qoute['text']
    when '/joke'
      a_joke[1].even? ? reply.text = "#{message.from.first_name},  #{a_joke[0]} " : reply.text = "#{a_joke[0]} "
    when message.from.first_name
      reply.text = "#{message.from.first_name}, #{jokes.initial_joke}"
    else
      reply.text = 'Reply with /joke, /motivate or your first name'
    end
    puts "you replied: #{reply.text.inspect}"
    reply.send_with(bot)
  end
end
# rubocop:enable Style/ConditionalAssignment
