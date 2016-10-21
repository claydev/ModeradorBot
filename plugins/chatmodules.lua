local action = function(msg, blocks, ln)

if not (msg.chat.type == 'private') and is_mod(msg) then end

 if blocks[1] == 'groseria' then
		if not blocks[2]:match('^(enable)$') and not blocks[2]:match('^(disable)$') then
			api.sendReply(msg, '*ERROR*\nIt is used in this way:\n`/groseria enable|disable`', true)
			return
		end
		local status = blocks[2]
		local current = db:hget('chat:'..msg.chat.id..':settings', 'groseria')
		if current == status then
			grep = status:gsub('^enable$', 'permitida'):gsub('^disable$', 'prohibida')
			api.sendMessage(msg.chat.id, 'Los groseria ya estaba *'..grep..'*', true)		
		else
			db:hset('chat:'..msg.chat.id..':settings', 'groseria', status)
			grep = status:gsub('^enable$', 'permitida'):gsub('^disable$', 'prohibida')
			api.sendMessage(msg.chat.id, 'Ahora la groseria estará *'..grep..'*', true)
		end
	end
  

 if blocks[1] == 'bots' then
		if not blocks[2]:match('^(enable)$') and not blocks[2]:match('^(disable)$') then
			api.sendReply(msg, '*ERROR*\nIt is used in this way:\n`/bots enable|disable`', true)
			return
		end
		local status = blocks[2]
		local current = db:hget('chat:'..msg.chat.id..':settings', 'bots')
		if current == status then
			grep = status:gsub('^enable$', 'permitidos'):gsub('^disable$', 'prohibidos')
			api.sendMessage(msg.chat.id, 'The bots were already *'..grep..'*', true)		
		else
			db:hset('chat:'..msg.chat.id..':settings', 'bots', status)
			grep = status:gsub('^enable$', 'permitidos'):gsub('^disable$', 'prohibidos')
			api.sendMessage(msg.chat.id, 'Now the bots are *'..grep..'*', true)
		end
	end
 

 if blocks[1] == 'spam' then
		if not blocks[2]:match('^(enable)$') and not blocks[2]:match('^(disable)$') then
			api.sendReply(msg, '*ERROR*\nIt is used in this way:\n`/spam enable|disable`', true)
			return
		end
		local status = blocks[2]
		local current = db:hget('chat:'..msg.chat.id..':settings', 'spam')
		if current == status then
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, '*El spam ya estaba *'..grep..'*', true)		
		else
			db:hset('chat:'..msg.chat.id..':settings', 'spam', status)
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, '*Spam is now *'..grep..'*', true)
		end
	end
  
 if blocks[1] == 'codes' then
		if not blocks[2]:match('^(enable)$') and not blocks[2]:match('^(disable)$') then
			api.sendReply(msg, '*ERROR*\nIt is used in this way:\n`/codes enable|disable`', true)
			return
		end
		local status = blocks[2]
		local current = db:hget('chat:'..msg.chat.id..':settings', 'codes')
		if current == status then
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, 'The codex was already *'..grep..'*', true)		
		else
			db:hset('chat:'..msg.chat.id..':settings', 'codes', status)
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, 'Now the codex will be *'..grep..'*', true)
		end
	end

 if blocks[1] == 'saludo' then
		if not blocks[2]:match('^(enable)$') and not blocks[2]:match('^(disable)$') then
			api.sendReply(msg, '*ERROR*\nIt is used in this way:\n`/saludo enable|disable`', true)
			return
		end
		local status = blocks[2]
		local current = db:hget('chat:'..msg.chat.id..':settings', 'saludo')
		if current == status then
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, 'The greeting was already *'..grep..'*', true)		
		else
			db:hset('chat:'..msg.chat.id..':settings', 'saludo', status)
			grep = status:gsub('^enable$', 'permitido'):gsub('^disable$', 'prohibido')
			api.sendMessage(msg.chat.id, 'Now the greeting will be *'..grep..'*', true)
		end
	end
end

return {
	action = action,
	triggers = {
	'^/(groseria) (%a+)$',
	'^/(groseria)(.-)$',
	'^/(bots) (%a+)$',
	'^/(bots)(.-)$',
	'^/(spam) (%a+)$',
	'^/(spam)(.-)$',
	'^/(codes) (%a+)$',
	'^/(codes)(.-)$',
	'^/(saludo) (%a+)$',
	'^/(saludo)(.-)$'
	}
}
