# Adds the current branch to the bash prompt when the working directory is
# part of a Git repository. Includes color-coding and indicators to quickly

push_docs2github() {
    goto-sphinx    
    source ~/docu/sphinx/env/bin/activate
    make html
    cp -r ~/docu/sphinx/_build/html/* ~/docu/docs/
    git add --all
    git commit -m "upping html to github"
    git push --no-verify
}
