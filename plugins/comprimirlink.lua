 local action = function(msg, matches, ln)
	api.sendMessage(msg.chat.id, make_text '*link tablet.*\n\nHello! I invite you to enter this [link](' ..matches[1].. ')\n\n_Forward it to your friends to see._', true)
	mystat('/comprimir') --save stats
end

return {
	action = action,
	triggers = {
		'^/[Cc]omprimir (.*)$'
	}
}
