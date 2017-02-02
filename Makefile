# Copyright © 2017 Iain Nicol

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

PREFIX ?= /usr/local

.PHONY: all
all:
	@ # According to <https://docs.docker.com/engine/reference/run/>
	@ # we should be able to use “--cap-add=SYS_ADMIN
	@ # --device=/dev/fuse” instead of the slightly blunter
	@ # “--privileged”.  But the former didn't work on a Fedora 25
	@ # host.
	docker run \
	       --privileged \
	       --volume="$$(pwd):/brainsick:Z,rw" \
	       brainsick/build \
	       --rm

.PHONY: install
install:
	mkdir -p "${PREFIX}/bin"
	cp "out/bin/bscc-$$(arch).AppImage" "${PREFIX}/bin/bscc"
