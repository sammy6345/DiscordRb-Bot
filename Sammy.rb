require 'discordrb'
require 'configatron'
require_relative 'config.rb'


bot = Discordrb::Commands::CommandBot.new token: configatron.token , client_id: 271228733749329920, prefix: '!$'

#bot.update_status(status, game="Type !$ for help")

bot.message(content: 'Ping!') do |event|
  m = event.respond('Pong!')
  m.edit("Pong! Time taken: #{Time.now - event.timestamp} seconds.")
  end

bot.command(:invite) do |event|
  event.respond("My invite link is https://discordapp.com/api/oauth2/authorize?client_id=271228733749329920&scope=bot&permissions=0")
  end

bot.command(:eval, help_available: false) do |event, *code|
  break unless event.user.id == 138116156488679425
  begin
    eval code.join(' ')
  rescue
    'An error occurred 😞'
  end
end

bot.command(:exit, help_available: false) do |event|
  break unless event.user.id == 138116156488679425
  bot.send_message(event.channel.id, "The bot is shutting down now.")
  exit
end

#bot.command(:help) do |event|
#  event << 

bot.command(:purge) do |event, rm_arg|
  while rm_arg > 100 do
    rm_messages = channel.history(100)
    message_no -= 100
  end
  rm_messgaes = channel.history(rm_arg)  
  event.message.delete(rm_messages)

bot.run  :async
#print "Bot is now running"
bot.sync

