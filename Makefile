# Licensed to Crate (https://crate.io) under one or more contributor license
# agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  Crate licenses this file to you
# under the Apache License, Version 2.0 (the "License"); you may not use this
# file except in compliance with the License.  You may obtain a copy of the
# License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.
#
# However, if you have executed another commercial license agreement with Crate
# these terms will supersede the license and you may use the software solely
# pursuant to the terms of the relevant commercial agreement.


.EXPORT_ALL_VARIABLES:

ROOT_DIR   := .
STYLE_DIR  := .style
STYLE_MAKE := $(MAKE) -C $(ROOT_DIR) -f $(STYLE_DIR)/utils/rules.mk

# Default target
.PHONY: help
help:
	@ printf 'Documentation Utils\n'
	@ echo
	@ printf 'Run `make <TARGET>`, where <TARGET> is one of:\n'
	@ echo
	@ printf '\033[34m  lint        \033[00m Lint the documentation\n'
	@ echo
	@ printf '\033[34m  lint-watch  \033[00m Lint the documentation (and watch'
	@ printf                               ' for changes)\n'
	@ echo
	@ printf '\033[34m  clean       \033[00m Clean the lint files\n'
	@ echo
	@ printf '\033[34m  clean-all   \033[00m Clean everything\n'

$(STYLE_DIR):
	mkdir -p $@
	cp -R utils $@/utils

.PHONY: lint
lint: $(STYLE_DIR)
	@ $(STYLE_MAKE) $@

.PHONY: lint-watch
lint-watch: $(STYLE_DIR)
	@ $(STYLE_MAKE) $@

.PHONY: clean
clean: $(STYLE_DIR)
	@ $(STYLE_MAKE) $@

.PHONY: clean-all
clean-all: clean
	rm -rf $(STYLE_DIR)
