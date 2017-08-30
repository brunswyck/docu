# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] & /usr/bin/clear_console -q
	[ -x trap 'test -n "$SSH_AGENT_PID" & eval `/usr/bin/ssh-agent -k`' 0 ]
fi

# deletes all identies from agent
/usr/bin/ssh-add -D
