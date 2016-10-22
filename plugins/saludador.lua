local action = function(msg, blocks, ln)

--	if not (msg.chat.type == 'private') and is_mod(msg) then return end

    if db:hget('chat:'..msg.chat.id..':settings', 'saludo') == 'enable' then
	local iduser = msg.from.id
    local name = msg.from.first_name
    if msg.from.username then name = name..' (@'..msg.from.username..')' end
    math.randomseed( os.time() );
 	var = math.random(0,4);
	if var == 0 then
   		api.sendMessage(msg.chat.id, 'Hello *' ..name.. '*', true)
	elseif var == 1 then
 	   api.sendMessage(msg.chat.id, 'Hello *' ..name.. '*All good?', true)
	elseif var == 2 then
 	   api.sendMessage(msg.chat.id, 'Cool*' ..name.. '*, Nice to see you :)', true)
	elseif var == 3 then
  	   api.sendMessage(msg.chat.id, '*' ..name.. '* :) Hello', true)
  	elseif var == 4 then
  	   api.sendMessage(msg.chat.id, 'Mr *' ..name.. '*, good to see you around here.', true)  
  end
end
end
return {
	action = action,
	triggers = {
            "[Hh][Oo][Ll][Aa]",
--            "[Hh][Ii]",
            "[Qq][Uu][Ee](.*)[Oo][Nn][Dd][Aa]",            
}
}
