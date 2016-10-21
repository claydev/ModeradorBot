local action = function(msg, blocks, ln)
	
	if not (msg.chat.type == 'private') and is_mod(msg) then return end

    if db:hget('chat:'..msg.chat.id..':settings', 'groseria') == 'disable' then
	   local iduser = msg.from.id
    local name = msg.from.first_name
    if msg.from.username then name = name..' (@'..msg.from.username..')' end
    math.randomseed( os.time() );
    var = math.random(0,4); math.random(0,4); math.random(0,4);
    if var == 0 then
        api.sendMessage(msg.chat.id, 'Hey *' ..name.. '* ID '..iduser..',Watch your language or you will be expelled ', true)
	   elseif var == 1 then
 	   	api.sendMessage(msg.chat.id, 'Recuerda *' ..name.. '* ID '..iduser..', expelled /a by rude /a', true)
	   elseif var == 2 then
 	   	api.sendMessage(msg.chat.id, 'Lo siento, *' ..name.. '*, ID '..iduser..', expelled /a by rude /a', true)
 	   api.kickUser(msg.chat.id, msg.from.id)
	   elseif var == 3 then
  	   	api.sendMessage(msg.chat.id, '*' ..name.. '* ID '..iduser..', if you keep sending bad words you will be banned /definitely', true)
  	 elseif var == 4 then
  	   	api.sendMessage(msg.chat.id, 'Lo siento *' ..name.. '*, ID '..iduser..', banned /a by rude /a.', true)
 	   api.kickChatMember(msg.chat.id, msg.from.id)
  end
end
end
 return {
	action = action,
	triggers = {
            "[Pp][Uu][Tt](.*)",
            "[Mm][Ii][Ee][Rr][Dd][Aa]",
            "[Pp][Ee][Rr][Rr](.*)",
            "[Gg][Aa][Yy]",          
            "[Pp][Aa][Rr][Ii][Dd](.*)",
            "[Ff][Uu][Cc][Kk]",
            "[Ss][Hh][Ii][Tt]"   
--            "[Cc][Hh][Aa][Nn][Nn][Ee][Ll](.*)@(.*)"
}
}
