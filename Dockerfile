FROM archlinux/base
MAINTAINER EvillHood

# install packages
#############

# Build tools
#############
RUN pacman -Sy extra/cmake extra/qt5-base extra/boost git extra/clang  extra/clazy core/make core/gcc --noconfirm
RUN pacman -Sy core/openssh which qt5-tools core/gettext community/cppcheck --noconfirm

# libraries
#############
RUN pacman -Sy extra/boost-libs   --noconfirm

# Add radio components
#############
RUN pacman -Sy extra/qt5-svg extra/qwt community/gnuradio --noconfirm

# Install vnc, xvfb in order to create a 'fake' display.
#############
RUN pacman -Sy extra/x11vnc   extra/xorg-twm --noconfirm
RUN pacman -Syu --noconfirm

#voodoo magic
#############
RUN set -x &&  strip --remove-section=.note.ABI-tag /usr/lib/libQt5Core.so.5

# docker settings
#################

# map /source to host source data path (used to )
VOLUME /source

# map /data to host defined data path (used to store data from app)
VOLUME /data

# run 
CMD ["/bin/bash"]
