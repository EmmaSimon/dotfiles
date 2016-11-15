function fish_prompt
 printf '%s\U2643 %s%s%s > '\
   (set_color blue)\
   (set_color cyan)\
   (prompt_pwd)\
   (set_color normal)
end
