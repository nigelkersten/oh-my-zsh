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

PROMPT='⌈%{$fg[red]%}(%{$fg[white]%}%h%{$fg[red]%}) %{$fg[blue]%}%~ %{$reset_color%}% %{$reset_color%}%{$fg[white]%} vms(%{$fg[blue]%}%{$(vmfusionlist)%}%{$fg[white]%}) puppet(%{$fg[blue]%}%{$(puppetversion)%}%{$fg[white]%})%{$reset_color%} %{$(git_prompt_info)%}
%{$fg[black]%}⌊ %# '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[white]%}) "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[white]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[blue]%}ಠ_ಠ%{$reset_color%}"


