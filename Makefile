# \ var
MODULE  = $(notdir $(CURDIR))
OS      = $(shell uname -s)
MACHINE = $(shell uname -m)
NOW     = $(shell date +%d%m%y)
REL     = $(shell git rev-parse --short=4 HEAD)
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
CORES   = $(shell grep processor /proc/cpuinfo| wc -l)
# / var

# \ dir
CWD     = $(CURDIR)
BIN     = $(CWD)/bin
DOC     = $(CWD)/doc
TMP     = $(CWD)/tmp
LIB     = $(CWD)/lib
SRC     = $(CWD)/src
TEST    = $(CWD)/test
GZ      = $(HOME)/gz
# / dir

# \ tool
CURL    = curl -L -o
REBAR   = $(HOME)/.mix/rebar3
ERLC    = erlc
ERL     = erl
MIX     = mix
IEX     = iex
# / tool

# \ src
E      += $(shell find src       -type f -regex ".+.erl$$" | egrep -v "_[a-z]+er.erl$$")
X      += $(shell find lib       -type f -regex ".+.ex$$")
X      += $(shell find test      -type f -regex ".+.exs$$")
X      += $(shell find config    -type f -regex ".+.exs$$")
X      += .formatter.exs mix.exs
# / src
S      += $(Y) $(N) $(E) $(X) $(C) $(LL)

# \ all
.PHONY: all
all:

.PHONY: repl
repl:
	$(IEX)  -S mix
	$(MAKE) format
	$(MAKE) $@

.PHONY: test
test:
	$(MIX) test

.PHONY: format
format: tmp/format
tmp/format: \
	$(X)
	$(MAKE) test
	$(MIX)  format
	touch $@
# / all


# \ doc
.PHONY: doc
doc: \

.PHONY: doxy
doxy: doxy.gen
	doxygen $< 1>/dev/null
# / doc

# \ install
.PHONY: install update
install: $(OS)_install doc
	$(MIX)  local.hex
	$(MAKE) update
update: $(OS)_update
	$(MIX)  deps.get
	$(MIX)  deps.compile
	$(MIX)  ecto.create

.PHONY: Linux_install Linux_update
Linux_install Linux_update:
	sudo apt update
	sudo apt install -u `cat apt.txt`
# / install

# \ merge
MERGE  = README.md LICENSE Makefile .gitignore apt.txt apt.dev .vscode $(S)
MERGE += bin doc lib src test tmp
MERGE += static templates
MERGE += geo

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(BRANCH)_$(NOW)_$(REL).src.zip \
	HEAD

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout ponymuck -- $(MERGE)

.PHONY: ponymuck
ponymuck:
	git push -v
	git checkout $@
	git pull -v
# / merge
