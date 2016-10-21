local action = function(msg, blocks, ln)
	
if not(msg.chat.type == 'private') and not is_mod(msg) then	

    if db:hget('chat:'..msg.chat.id..':settings', 'spam') == 'disable' then
	local iduser = msg.from.id
    local name = msg.from.first_name
    if msg.from.username then name = name..' (@'..msg.from.username..')' end
    math.randomseed(os.time());
 	var = math.random(0,4);
    if var == 0 then
        api.sendMessage(msg.chat.id, 'Hey *' ..name.. '* ID '..iduser..', Do not send links from other groups or you will be expelled', true)
	elseif var == 1 then
 	   	api.sendMessage(msg.chat.id, 'Recuerda *' ..name.. '* ID '..iduser..', If you send links from other groups you will be expelled', true)
	elseif var == 2 then
 	   	api.sendMessage(msg.chat.id, 'Lo siento, *' ..name.. '*, ID '..iduser..', expelled for spammer', true)
 	   api.kickUser(msg.chat.id, msg.from.id)
	elseif var == 3 then
  	   	api.sendMessage(msg.chat.id, '*' ..name.. '* ID '..iduser..', if you keep sending spam you will be definitely banned', true)
  	elseif var == 4 then
  	   	api.sendMessage(msg.chat.id, 'Lo siento *' ..name.. '*, ID '..iduser..', banned for spammer.', true)
 	   api.kickChatMember(msg.chat.id, msg.from.id)
  end
end
end
end

 return {
	action = action,
	triggers = {
            "[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee](.*)",
            "[Cc][Aa][Nn][Aa][Ll](.*)@(.*)",
            "[Cc][Hh][Aa][Nn][Nn][Ee][Ll](.*)@(.*)"
}
}
