# Adds the current branch to the bash prompt when the working directory is
# part of a Git repository. Includes color-coding and indicators to quickly

killbrowser() { kill -s 9 "$(ps --user patrick | grep browser | cut -d ' ' -f 2)"; }

push_docs2github() {
    cddocu    
    source ~/docu/sphinx/env/bin/activate
    make html
    cp -r ~/docu/sphinx/_build/html/* ~/docu/docs/
    git add --all
    git commit -m "upping html to github"
    git push --no-verify
}

showinstalled() {
    grep 'apt-get install ' /var/log/apt/history.log | cut -d ':' -f2 |awk '!seen[$0]++' | sed -e 's/^ //'  
}

pusshy() {
	git status
	read  -n 1 -p "cancel:ctrl-c continue:enter"
	git commit -m "synching $(show_repository) ..."
	git push
}

show_repository() {
    echo $(git_repo) | cut -d. -f1
}

get_activeScreens() {
  activeScreens=( $(xrandr -q | awk '$2=="connected" {print $1}') )
  length=${#activeScreens[@]}
}

launchTerminal() {
 xfce4-terminal --title="HOME" --working-directory=~/ -e 'sh -ic "apt-get moo; exec bash"' --show-borders \
   --tab -T DOCU --working-directory=$HOME/docu/sphinx/ -e 'sh -ic "vim cisco.rst; exec bash"' \
   --tab -T AUTOBUILD -e 'sh -ic "cd $HOME/docu/sphinx && . $HOME/docu/sphinx/env/bin/activate && sphinx-autobuild -b html -H 127.0.0.1 -p 6666 ./ _build/html/; exec bash"' \
   --tab -T VIM --working-directory=$HOME/docu/sphinx/ -e 'sh -ic "vim vim.rst; exec bash"' \
   --tab -T CmdScripting --working-directory=$HOME/docu/sphinx/ -e 'sh -ic "vim -o commands.rst scripting.rst; exec bash"' \
   --tab -T OTHER -e 'sh -ic "apt-get moo; exec bash"'
}
