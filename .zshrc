ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Source Powerlevel10k Theme
source /home/tomas/dotfiles/.p10k.zsh

zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit ice depth=1
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions

alias nrebuild="nh os switch /home/tomas/dotfiles"

# Enable word movement using ctrl + arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word