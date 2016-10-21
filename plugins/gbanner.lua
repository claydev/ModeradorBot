local action = function(msg, matches)

 		if not(msg.chat.type == 'private') and not is_mod(msg) then return end

if matches[1] == "gban" then
	if matches[2] then
		os.execute('echo "' ..matches[2].. '," >> ./data/gbans')
		api.sendReply(msg, "ID " ..matches[2].. " *globally banned*.", true)
		bot_init(true)
 	end
 
 	if not matches[2] then
		if msg.reply then
			os.execute('echo "' ..msg.reply.from.id.. '," >> ./data/gbans')
			api.sendReply(msg, "ID " ..msg.reply.from.id.. " *globally banned*.", true)
			bot_init(true)
		else
			api.sendMessage(msg.chat.id, "This command needs to answer")
		end
	end
end

if matches[1] == "ungban" then
	
 	if matches[2] then
		os.execute('sed -i "/' ..matches[2].. '/d" ./data/gbans')
		api.sendReply(msg, "ID " ..matches[2].. " *globally unbanned*.", true)
		bot_init(true)
	end
	
	 if not matches[2] then
		if msg.reply then
			os.execute('sed -i "/' ..msg.reply.from.id.. '/d" ./data/gbans')
			api.sendReply(msg, "ID " ..msg.reply.from.id.. " *globally unbanned*.", true)
			bot_init(true)
		else
			api.sendMessage(msg.chat.id, "This command needs to answer")
		end
 	 end
end

if matches[1] == "isban" then

	 if matches[2] then
			os.execute('grep -o "' ..matches[2].. '" ./data/gbans')
			api.sendReply(msg, "ID " ..matches[2].. " *ID is in BD*.", true)
			else
			os.execute('grep -o "' ..matches[2].. '" ./data/gbans')
			api.sendReply(msg, "ID " ..matches[2].. " *ID is not in BD*.", true)			
			bot_init(true)
		end


	 if not matches[2] then
	 	if msg.reply then
			os.execute('grep -c "' ..msg.reply.from.id.. '," ./data/gbans')
			api.sendReply(msg, "ID " ..msg.reply.from.id.. " *ID is in BD*.", true)
			bot_init(true)
		 else
		api.sendMessage(msg.chat.id, "This command needs to answer")
	end
end
end
end

return {
	action = action,
	triggers = {
				'^/(gban)$',
				'^/(gban) (%d+)$',
				'^/(ungban)$',
				'^/(ungban) (%d+)$',
				'^/(isban)$',
				'^/(isban) (%d+)$'
				}
		}

