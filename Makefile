all: addingssh

addingssh:
	eval $(ssh-agent)
	ssh-add ~/.ssh/github_key