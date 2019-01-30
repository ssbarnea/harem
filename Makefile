.PHONY: list dsm n2

.EXPORT_ALL_VARIABLES:

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

env:
	ansible-galaxy install -r requirements.yml

dsm:
	ansible-playbook playbooks/dsm.yml

mon:
	ansible-playbook playbooks/mon.yml

matrix:
	ansible-playbook playbooks/matrix.yml

leno:
	ansible-playbook playbooks/leno.yml

mac:
	ansible-playbook playbooks/mac.yml

nodes: env
	ansible-playbook playbooks/nodes.yml

q:
	ansible-playbook playbooks/q.yml

n2:
	./bin/reprov n2

n0:
	./bin/reprov n0

kube: env
	# ansible-playbook --become --become-user=root contribs/kubespray/remove-node.yml -l n2
	ansible-playbook --become --become-user=root contribs/kubespray/cluster.yml

