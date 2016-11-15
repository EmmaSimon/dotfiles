# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints 'yes'

# Status Chars
set __fish_git_prompt_char_dirtystate '↡'
set __fish_git_prompt_char_stagedstate '↥'
set __fish_git_prompt_char_untrackedfiles '↯'
set __fish_git_prompt_char_stashstate '⇲'
set __fish_git_prompt_char_invalidstate '✕'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
set __fish_git_prompt_char_cleanstate ''

# Status colors
set __fish_git_prompt_color blue
set __fish_git_prompt_color_flags red
set __fish_git_prompt_color_branch cyan
set __fish_git_prompt_color_upstream magenta
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_stashstate blue

function fish_right_prompt
  printf '%s %s%s'\
    (__fish_git_prompt;or echo '')\
    (set_color blue; date "+%a %-H:%M")\
    (set_color normal)
end
