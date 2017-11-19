HYPATH = ~/.local/bin/hy

build:
	php ./build.php

test:
	$(HYPATH) ./tools/testsuite/run-tests.hy --dir tests --exe "php ./src/Quack.php %s"
	python ./tools/testsuite/run-tests.py --dir tests --exe "php ./src/Quack.php %s"

count_lines:
	@(cd src; git ls-files | xargs wc -l | sort -t '_' -k 1n | sed -E "s/([0-9]+) (.*)/| \1 - \2/g" | awk '{$$1=$$1}1;' | column)

configure:
	pip install --user hy==0.11.1
	pip install --user termcolor
	pear install PHP_CodeSniffer

lint:
	phpcs --standard=PSR2 ./src/*

todo:
	grep -r 'TODO' src/
