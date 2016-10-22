local function do_keyboard_public()
    local keyboard = {}
    keyboard.inline_keyboard = {
 
	    {
    		{text = '📢 Channel', url = 'https://telegram.me/'..config.channel:gsub('@', '')},
	        {text = '📕 All commands', callback_data = '!user'},
        },
    	{
    		{text = '✅ Dev', url = 'https://telegram.me/saadthamer'},
    	},	
    	
		{
		    {text = '🔙', callback_data = '!user'}
        }
	}
	return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'You must first start', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end

local action = function(msg, blocks, ln)
            local keyboard = do_keyboard_public()
            if blocks[1] == 'links' then
            if msg.chat.type == 'private' then
                local message = make_text(lang[ln].help.private, msg.from.first_name:mEscape())
                local keyboard = do_keyboard_public()
                api.sendKeyboard(msg.from.id, message, keyboard, true)
                return
            end
            local res = api.sendKeyboard(msg.from.id, 'Here are some links of interest, you want to appear here ?, contact @saadthamer ', keyboard, true)
            if res then
                api.sendMessage(msg.chat.id, 'Links have been sent by private chat', true)
            else
                api.sendKeyboard(msg.chat.id, lang[ln].help.group_not_success, do_keyboard_startme(), true)
            end
        end
        return
    end

return {
	action = action,
	triggers = {
		'^/(links)$'
	}
}
