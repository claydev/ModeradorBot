local action = function(msg, blocks, ln)
 	
	if not(msg.chat.type == 'private') and not is_owner(msg) then return end
	
if blocks[1] == "gban" then
			local id
			local name
		if not blocks[2] then
			if not msg.reply then
				api.sendReply(msg, 'This command requires a response, or ID to run')
				return
			else
			id = msg.reply.from.id
			name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			end
		else
		id = blocks[2]
		name = msg.from.first_name
    	if msg.from.username then name = name..' (@'..msg.from.username..')' end
		end
		if msg.reply then
			os.execute('echo "' ..id.. '," >> ./data/gbans')
			bot_init(true)
		end
		if blocks[2] then
		os.execute('echo "' ..blocks[2].. '," >> ./data/gbans')
		bot_init(true)
		end
		local response = db:sadd('bot:blocked', id)
		local text
		if response == 1 then
			text = '\n' ..name.. ', ID ' ..id.. ' It has been blocked and Baneado Globally by @' ..bot.username.. ', if you think this is an error, contact @saadthamer or @saadthamer_bot so you can review your case, thanks. 🔰\n'				
--			text = id..' Has sido Bloqueado y expulsado Globalmente'
		 else			
			text = '\n' ..name.. ', ID ' ..id.. 'It has already been blocked and Baneado Globally by @' ..bot.username.. ', if you think this is an error, contact @saadthamer or @saadthamer_bot so you can review your case, thanks. 🔰\n'
--			text = id..' Ya estás Bloqueado y expulsado Globalmente'
		end
		api.sendReply(msg, text)
	end

	if blocks[1] == 'ungban' then
			local id
			local name
		if not blocks[2] then
			if not msg.reply then
				api.sendReply(msg, 'This command requires a response, or ID to run')
				return
			else
			id = msg.reply.from.id
			name = msg.from.first_name
    		if msg.from.username then name = name..' (@'..msg.from.username..')' end
			end
		else
		id = blocks[2]
		name = msg.from.first_name
    	if msg.from.username then name = name..' (@'..msg.from.username..')' end
		end
		if msg.reply then
			os.execute('sed -i "/' ..id.. '/d" ./data/gbans')
			bot_init(true)
		end
		if blocks[2] then
			os.execute('sed -i "/' ..blocks[2].. '/d" ./data/gbans')
			bot_init(true)
		end
		local response = db:srem('bot:blocked', id)
		local text
		if response == 1 then
			make_text = '\n' ..name.. ', el ID ' ..id.. ' It has been unlocked and unbanned Globally by (@' ..bot.username.. '), if it was a mistake, sorry for the inconvenience, thanks. 🔰\n'							
--			text = id..' Has sido Desbloqueado y desbaneado Globalmente'
		else
			make_text = '\n' ..name.. ', el ID ' ..id.. ' It has already been unlocked and unbanned Globally by (@' ..bot.username.. '), Thank you. 🔰\n'
--			text = id..' Ya estás Desbloqueado y desbaneado Globalmente'
		end
		api.sendReply(msg, make_text)
	end

	if blocks[1] == "isgban" then
	if blocks[2] then
		local grep = io.popen("grep -o "..blocks[2].. " ./data/gbans")
		local list = grep:read("*a")
		if list == "" then
		api.sendMessage(msg.chat.id, "_This ID is not globally banned_", true)
		else
			api.sendReply(msg, "La ID "..blocks[2].." is * globally banned*", true)
--			api.sendMessage(msg.chat.id, "*Demasiado seguro*\nSe encontraron las siguientes coincidencias:\n\n_"..list.."_", true)
			end
	end
	
 	if not blocks[2] then
		if msg.reply then
			local grep = io.popen("grep "..msg.reply.from.id.. " ./data/gbans")
		local list = grep:read("*a")
		if list == "" then
		api.sendReply(msg, "_This ID is not globally banned_", true)
		else
	        api.sendReply(msg, "ID "..msg.reply.from.id.."is * globally banned *", true)
		end
		end
		end
end
end

return {
   action = action,
   triggers = {
	'^/(gban) (%d+)$',
	'^/(gban)$',
	'^/(ungban) (%d+)$',
	'^/(ungban)$',
	'^/(isgban)$',
	'^/(isgban) (%d+)$'
	}
}
