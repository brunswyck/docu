# Adds the current branch to the bash prompt when the working directory is
# part of a Git repository. Includes color-coding and indicators to quickly

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
	git commit -m "synching $show_repository ..."
	git push
}

show_repository() {
    show_repository=$(echo $(git_repo) | cut -d. -f1)
}
