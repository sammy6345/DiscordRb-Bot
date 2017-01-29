require 'discordrb'
require 'configatron'
require_relative 'config.rb'


bot = Discordrb::Commands::CommandBot.new token: configatron.token , client_id: 271228733749329920, prefix: '!$'


bot.message(content: 'Ping!') do |event|
  m = event.respond('Pong!')
  m.edit("Pong! Time taken: #{Time.now - event.timestamp} seconds.")
  end

#bot.message(content: 'Invite me') do |event|
#  event.respond("My invite link is https://discordapp.com/api/oauth2/authorize?client_id=271228733749329920&scope=bot&permissions=0")
#  end

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

bot.run :async
#print "Bot is now running"
bot.sync 
