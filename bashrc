# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Added by nvm installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##### ALIASES
alias g='git'
alias vim="nvim"
alias vi="nvim"

########################################################################
# Matthew's Git Bash Prompt - TODO: Add url for credit, I forgot where
# I got this from :(
########################################################################
        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
    GREEN="\[\033[0;32m\]"
       BLUE="\e[1;94m"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) '"
  diverge_pattern="Your branch and (.*) have diverged"

  if [[ ! ${git_status}} =~ "nothing to commit, working tree clean" ]]; then
    state="${RED} 🙉"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead of" ]]; then
      remote="${YELLOW}↑"
    elif [[ ${BASH_REMATCH[1]} == "up to date with" ]]; then
      remote="${GREEN}✓"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}

    if [[ (${state}) || (${remote}) ]]; then
      echo " (${branch}) ${remote}${state}"
    else
      echo " (${branch}) ${GREEN}✓"
    fi
  fi
}

function prompt_func() {
    prompt="${BLUE}\u@\h ${YELLOW}\w${GREEN}$(parse_git_branch)${BLUE}${COLOR_NONE}"
    PS1="${prompt}\n${RED}$ ${WHITE}"
}

PROMPT_COMMAND=prompt_func
