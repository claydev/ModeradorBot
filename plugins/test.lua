local triggers = {
	'^/test'
}

local function on_each_msg(msg, ln)
	return msg
end

local action = function(msg, blocks, ln)
if blocks[1] == 'isbanned' and blocks[2] then
      if is_blocked(blocks[2]) then
        api.sendReply(msg, '✅ This user if this globally banned.')
      else
        api.sendReply(msg, '❌❗️ This user is not globally banned or have entered the alias instead of the ID. If you want to report you can report it by deprived @saadthamer or @saadthamer_bot. Thank you.')
      end
    end
end

return {
	action = action,
	triggers = triggers,
	test = true
}
