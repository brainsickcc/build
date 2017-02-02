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

FROM centos:6

ARG BUILD_UID

RUN yum install -y sudo && \
    echo '%wheel  ALL=(ALL)  NOPASSWD: ALL' >> /etc/sudoers && \
    useradd -m build -Uu "$BUILD_UID" -G wheel && \
    echo 'build:build' | chpasswd

WORKDIR /home/build
COPY bootstrap .
RUN chown build:build bootstrap
RUN su build -c ./bootstrap
RUN rm bootstrap

RUN gpasswd -d build wheel && \
    yum remove -y sudo

COPY build build-appimage ./
RUN chown build:build build build-appimage
USER build
ENTRYPOINT ["/home/build/build"]
