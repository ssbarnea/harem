PHONY: all


all:
	ANSIBLE_FORCE_COLOR=true ansible-playbook playbooks/dsm.yml