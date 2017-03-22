function fish_prompt
 printf '%s\U2643 %s%s%s > %s'\
   (set_color blue)\
   (set_color cyan --bold)\
   (prompt_pwd)\
   (set_color "#848484" --dim)\
   (set_color normal)
end
