# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt --description 'Write out the prompt'
	if test -z $WINDOW
   printf '%s%s %s%s%s%s > ' (set_color CC66FF) (echo \U2643) (set_color 6699FF) (prompt_pwd) (set_color normal) (__fish_git_prompt)
 else
   printf '%s%s %s(%s)%s%s%s%s > ' (set_color CC66FF) (echo \U2643) (set_color white) (echo $WINDOW) (set_color 6699FF) (prompt_pwd) (set_color normal) (__fish_git_prompt)
 end
end
