local action = function(msg, blocks) 
	
	if not(msg.chat.type == 'private') and is_owner(msg) then
	
 if blocks[1] == "plugins" then
  if not blocks[2] then
	api.sendMessage(msg.chat.id, "*Plugins activated*\n"..load_plugins(), true)
  end

   if blocks[2] == "enable" then
	 enabled = enable_plugin(msg, blocks)
	 if enabled == true then
	 	api.sendReply(msg, "✅ Plugin _"..blocks[3]..".lua_ *deactivated* successfully.", true)
	 	bot_init(true)
	 else
	 	api.sendReply(msg, "❌ the plugin _"..blocks[3]..".lua_ *and it was previously deactivated *.", true)
	 end
   end
 
   if blocks[2] == "disable" then
	 disabled = disable_plugin(msg, blocks)
	 if disabled == true then
	 	api.sendReply(msg, "✅ Plugin _"..blocks[3]..".lua_ *deactivated* successfully.", true)
	 	bot_init(true)
	 else
	 	api.sendReply(msg, "❌ the plugin _"..blocks[3]..".lua_ *and it was previously deactivated *.", true)
	 end
   end  
 end
 else
 api.sendMessage(msg.chat.id, "🚫 To make this option *requires permits creator *.", true)
end
end

return {
action = action,
triggers = {
	'^/(plugins)$',
	'^/(plugins) (enable) (.+)',
	'^/(plugins) (disable) (.+)'
    }
}
