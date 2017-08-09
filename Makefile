all:
	@echo "Targets:\ngen - Generate torrc files\nplay - Execute Ansible playbook\nclean - Remove temporary files"

clean:
	rm -f *.retry

gen:
	pushd conf/$$dir >/dev/null && make gen

play:
	@echo "Remember to run ssh-agent/ssh-add first."
	ansible-playbook -K torrc.yaml
