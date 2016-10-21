local action = function(msg, blocks)
if blocks[1] == 'a' then
api.sendReply(msg, make_text '*ERROR*\n`You must enter a text after the command`.', true)
end
end

return {
     action = action,
     triggers = {
         '^/[Cc]aracolamagic(a)$',
         '^/[Cc]aracol(a)$',
         '^/ser(a)$'
}
}
