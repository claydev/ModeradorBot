local triggers = {
	'^/(beta)$'
}

local action = function(msg, blocks, ln)

if blocks[1] == 'beta' then
	username = msg.from.username
    	api.sendDocument(msg.from.id, './org.telegram.plus-3.10.1.0.apk')
    	api.sendMessage(msg.chat.id, 'Keeper Bot Best Bot In TeleGram.\n*BOT BY SAADTHAMER* :)\n\nBeta a: @' ..username, true)
    end
    end
    
 return {
	action = action,
	triggers = triggers
}
