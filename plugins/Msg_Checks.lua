local function run(msg, matches)
if is_momod(msg) or is_robot(msg) then
return false
else
local group = load_data('bot/group.json')
local group_mute_all = group[tostring(msg.chat_id)]['settings']['mute_all']
if group_mute_all == 'yes' then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_photo']
local is_photo_msg = msg.text:match("!!!photo:")
if group_mute_photo == 'yes' and is_photo_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_english = group[tostring(msg.chat_id)]['settings']['lock_english']
local is_english_msg = msg.text:match("[a-z]") or msg.text:match("[A-Z]")
local is_not_english_msg = msg.text:match("!!!photo:") or msg.text:match("!!!tgservice:") or msg.text:match("!!!edit:") or msg.text:match("!!!video:") or msg.text:match("!!!audio:") or msg.text:match("!!!voice:") or msg.text:match("!!!document:")
if group_lock_english == 'yes' and is_english_msg and not is_not_english_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_persian = group[tostring(msg.chat_id)]['settings']['lock_persian']
local is_persian_msg = msg.text:match("[\216-\219][\128-\191]")
if group_lock_persian == 'yes' and is_persian_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_tgservice = group[tostring(msg.chat_id)]['settings']['lock_tgservice']
local is_tgservice_msg = msg.text:match("!!!tgservice:")
if group_lock_tgservice == 'yes' and is_persian_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_tgservice = group[tostring(msg.chat_id)]['settings']['lock_sticker']
local is_tgservice_msg = msg.text:match("!!!sticker:")
if group_lock_tgservice == 'yes' and is_persian_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_lock_spam = group[tostring(msg.chat_id)]['settings']['lock_spam']
local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
local _nl, real_digits = string.gsub(msg.text, '%d', '')
if group_lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_video']
local is_video_msg = msg.text:match("!!!video:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_voice']
local is_video_msg = msg.text:match("!!!voice:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_document']
local is_video_msg = msg.text:match("!!!document:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_gif']
local is_video_msg = msg.text:match("!!!gif:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_contact']
local is_video_msg = msg.text:match("!!!contact:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_mute_photo = group[tostring(msg.chat_id)]['settings']['mute_audio']
local is_video_msg = msg.text:match("!!!audio:")
if group_mute_video == 'yes' and is_video_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_link_lock = group[tostring(msg.chat_id)]['settings']['lock_link']
local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://")
if is_link_msg and group_link_lock == 'yes'then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_edit_lock = group[tostring(msg.chat_id)]['settings']['lock_edit']
local is_edit_msg = msg.text:match("!!!edit:")
if group_edit_lock == 'yes' and is_edit_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_fwd_lock = group[tostring(msg.chat_id)]['settings']['lock_fwd']
if group_fwd_lock == 'yes' and msg.forward_info_ then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_reply_lock = group[tostring(msg.chat_id)]['settings']['lock_reply']
if group_reply_lock == 'yes' and msg.reply_to_message_id_ then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_caption_lock = group[tostring(msg.chat_id)]['settings']['lock_caption']
if group_caption_lock == 'yes' and msg.content_.caption_ then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_inline_lock = group[tostring(msg.chat_id)]['settings']['lock_inline']
if group_inline_lock == 'yes' and msg.via_bot_user_id_ then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_location_lock = group[tostring(msg.chat_id)]['settings']['lock_location']
if group_location_lock == 'yes' and msg.content_.location_ then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
local group_username_lock = group[tostring(msg.chat_id)]['settings']['lock_username']
local is_username_msg = msg.text:match("@")
if group_username_lock == 'yes' and is_username_msg then
bot.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
end
end
return {
  patterns = {
    "^(.*)$",
  },
  run = run
}

