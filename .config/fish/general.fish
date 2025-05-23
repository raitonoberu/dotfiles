﻿# declarative alternative to fish_add_path
function add_path --argument path
    if test -d $path && not contains -- $path $PATH
        set -p PATH $path
    end
end

# apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

add_path ~/.local/bin
add_path ~/.rye/shims
add_path ~/go/bin
