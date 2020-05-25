# noqa D100
from __future__ import print_function
import pytest
import subprocess
from pipes import quote
from pathlib import Path


# def pytest_collect_file(parent, path):
#     # print(parent, path)
#     # if parent == ".git":
#     # pytest_collect_file
#     ext = path.ext
#     if ext == '.yaml':
#         return GitRepo(path, parent)

def test_ansible_lint(repo):  # noqa D103
    cmd = ["ansible-lint", "-v", "--force-color", "-p"]
    print("running: %s (from %s)" % (" ".join(quote(arg) for arg in cmd), repo))
    try:
        # Workaround for STDOUT/STDERR line ordering issue:
        # https://github.com/pytest-dev/pytest/issues/5449
        p = subprocess.Popen(
            cmd,
            cwd=repo,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            universal_newlines=True,
        )
        for line in p.stdout:
            print(line, end="")
        p.wait()
        if p.returncode != 0:
            pytest.fail(
                "Error code %s returned by: %s" % (p.returncode, " ".join(cmd)),
                pytrace=False,
            )
    except Exception as e:
        pytest.fail(
            "Exception %s returned by: %s" % (e, " ".join(cmd)), pytrace=False
        )


def pytest_generate_tests(metafunc):  # noqa D103
    if "repo" in metafunc.fixturenames:
        results = [x.parent for x in Path(".").rglob("*.git")]
        metafunc.parametrize("repo", results)


# class GitRepo(pytest.File):
#     def collect(self):
#         yield TestItem("test", self)

#     def __str__(self):
#         return str(self.fspath.relto(os.getcwd()))

# class RepoItem(pytest.Item):
#     def __init__(self, name, parent):
#         super(RepoItem, self).__init__(name, parent)
#         # stream = open(str(self.fspath), "r")
#         # data = yaml.load(stream, Loader=yaml.SafeLoader)
#         # we add the driver as mark
#         # self.molecule_driver = data["driver"]["name"]
#         # self.add_marker(self.molecule_driver)
