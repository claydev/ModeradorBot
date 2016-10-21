local triggers = {
		'^/(mensaje) (.*) (.*)$',
		'^/(responder) (.*)'
		}

local action = function(msg, blocks)
 --if msg.from.id == config.admin or mag.from.id == config.support then
-- return
-- end
 if blocks[1] == 'mensaje' then
    idto = blocks[3]
    message = blocks[2]
    nameowner = msg.from.first_name
	api.sendMessage(idto, message.. '\n\nSent by: ' ..nameowner.. '\n_Answer with / answer [reply]_', true)
	api.sendMessage(msg.chat.id, 'Message sent!')
end
 if blocks[1] == 'responder' then  
 	iduser = msg.from.id
  name = msg.from.first_name
  user = msg.from.username
 	message = blocks[2]
 	api.sendMessage(config.admin, make_text'' ..message.. '\n\n_ID_: ' ..iduser.. '\n_Name_: ' ..name.. '\n_User_: @' ..user, true)
 	api.sendMessage(config.support, make_text'' ..message.. '\n\n_ID_: ' ..iduser.. '\n_Name_: ' ..name.. '\n_User_: @' ..user, true)
 	api.sendMessage(msg.chat.id, 'Reply sent!')
 	end
-- if blocks[1] == 'duda' or blocks[1] == 'ayuda' or blocks[1] == 'soporte' then
--    api.sendMessage(config.support, message.. '\n\n_ID Del Usuario:_ ' ..iduser, true)
-- 	api.sendMessage(msg.chat.id, '¡Respuesta enviada al equipo de soporte!')
-- end
 end
 
 return {
 	triggers = triggers,
 	action = action
 	}
