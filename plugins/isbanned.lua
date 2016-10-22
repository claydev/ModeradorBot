local action = function(msg, blocks)
	
	if blocks[1] == 'isbanned' then
		if not blocks[2] then
		if not msg.reply then
			api.sendReply(msg, '🔰Respond to know if someone is banned globally (in groups) and will send the result by private or private consultation by attaching the ID: /isbanned (ID) for example: /isbanned 970783')
			return
		else
			id = msg.reply.from.id
			end
		else
			id = blocks[2]
		end
		if msg.reply then
		local grep = io.popen("grep "..id.. " ./data/gbans")
		local list = grep:read("*a")
		end
		if blocks[2] then
		local grep = io.popen("grep -o "..blocks[2].. " ./data/gbans")
		local list = grep:read("*a")
		end
		if is_blocked_global(id) or list == "" then
        api.sendMessage(msg.from.id, '✅ This user if this globally banned.')
      else
        api.sendMessage(msg.from.id, '❌❗️ This user is not globally banned. If you want to report you can do so by private to @saadthamer or @saadthamer_bot . thanks.')
      end
    end

end

return {
   action = action,
   triggers = {
'^/(isbanned)$',
'^/(isbanned) (%d+)$'
	}
}

