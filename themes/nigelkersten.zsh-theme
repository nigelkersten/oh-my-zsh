# I should probably restructure this as a plugin of some kind.
#
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

function vmfusionlist() {
  vms=$(vmrun list | gawk 'BEGIN { ORS=":" ; FS="/" }  { if (NR>1) {sub(/.vmx/, "", $NF) ; print $NF} }')
  echo ${vms%%:}
}

# worse with 3.0...
function puppetversion() {
  verfile=~/src/puppet/lib/puppet.rb
  if [ -f ~/src/puppet/lib/puppet/version.rb ]; then
    verfile=~/src/puppet/lib/puppet/version.rb
  fi
  gawk 'BEGIN { ORS=" " } /PUPPETVERSION =/ { gsub("\047", "") ; printf $3 }' $verfile
}

PROMPT='⌈%{$fg[red]%}(%{$fg[white]%}%h%{$fg[red]%}) %{$fg[blue]%}%~ %{$reset_color%}% %{$reset_color%}%{$fg[white]%} vms(%{$fg[magenta]%}%{$(vmfusionlist)%}%{$fg[white]%}) puppet(%{$fg[magenta]%}%{$(puppetversion)%}%{$fg[white]%})%{$reset_color%}
⌊%{$fg[black]%}%# '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"


