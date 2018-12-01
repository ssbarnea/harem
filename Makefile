.PHONY: list dsm n2

.EXPORT_ALL_VARIABLES:

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

dsm:
	ansible-playbook playbooks/dsm.yml

n2:
	./bin/reprov n2