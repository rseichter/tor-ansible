all:
	@echo "Targets:\ngen - Generate torrc files\nplay - Execute Ansible playbook\nclean - Remove temporary files"

clean:
	rm -f *.retry

gen:
	for dir in conf*; do \
		pushd $$dir >/dev/null || exit 1; \
		make -f ../Makefile torrc; \
		popd >/dev/null; \
	done

play:
	@echo "Remember to run ssh-agent/ssh-add first."
	ansible-playbook -K torrc.yaml

torrc:
	../gen-torrc
