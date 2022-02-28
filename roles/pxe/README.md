QNAP issues:

* qnap default python is 2 and ansible fails to detect is custom location
* preinstalled python is missing a critical stdlib component: ast
  https://github.com/ansible/ansible/issues/73140
* python3 can be installed using... gui
