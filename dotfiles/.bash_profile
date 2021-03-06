# Add stuff to `$PATH`
export GOPATH="/home/jejs/repo/go"
export GOROOT="/usr/local/go"
export PATH="$HOME/bin:$GOPATH/bin:$GOROOT/bin:$PATH"

# set editor
export editor=nvim

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
fi

# add colors
export CLICOLOR=1

# load ssh keys
ssh-add -A 2> /dev/null

# add colors to `go test`
function go_test() {
    go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}

# sexy bash prompt
. ~/.bash_prompt

# aliases
alias run_conductor='docker run -it --rm -u annar -w /home/annar -v ~/repo/joshuaejs/annar:/home/annar/annar conductor bash'
