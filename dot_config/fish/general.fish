# enable Wayland support for different applications
if [ "$XDG_SESSION_TYPE" = wayland ]
    set -gx WAYLAND 1
    set -gx QT_QPA_PLATFORM 'wayland;xcb'
    set -gx GDK_BACKEND 'wayland,x11'
    set -gx MOZ_DBUS_REMOTE 1
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx BEMENU_BACKEND wayland
    set -gx CLUTTER_BACKEND wayland
    set -gx ECORE_EVAS_ENGINE wayland_egl
    set -gx ELM_ENGINE wayland_egl
end

# apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# declarative alternative to fish_add_path
function add_path --argument path
    if test -d $path && not contains -- $path $PATH
        set -p PATH $path
    end
end

add_path ~/.local/bin
add_path ~/.rye/shims
add_path ~/go/bin
