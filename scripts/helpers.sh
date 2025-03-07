

#
#  I use an env var TMUX_BIN to point at the used tmux, defined in my
#  tmux.conf, in order to pick the version matching the server running,
#  or when the tmux bin is in fact tmate :)
#  If not found, it is set to whatever is in path, so should have no negative
#  impact. In all calls to tmux I use $TMUX_BIN instead in the rest of this
#  plugin.
#
[ -z "$TMUX_BIN" ] && TMUX_BIN="tmux"



get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value=$($TMUX_BIN show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

get_tmux_version() {
  $TMUX_BIN -V | cut -d " " -f 2
}

