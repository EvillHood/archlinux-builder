FROM archlinux/base
MAINTAINER red wine

# install packages
#############
RUN pacman -Suy --noconfirm
RUN pacman -Sy extra/cmake --noconfirm
RUN pacman -S extra/qt5-base --noconfirm
RUN pacman -S extra/boost --noconfirm
RUN pacman -S extra/boost-libs --noconfirm
RUN pacman -S core/gcc --noconfirm
RUN pacman -S extra/clang --noconfirm 
RUN pacman -S community/cppcheck --noconfirm  
RUN pacman -S extra/clazy --noconfirm
RUN pacman -S core/gettext --noconfirm
RUN pacman -S git --noconfirm
RUN pacman -S core/openssh --noconfirm
RUN pacman -S core/make --noconfirm

# docker settings
#################

# map /source to host source data path (used to )
VOLUME /source

# map /data to host defined data path (used to store data from app)
VOLUME /data

# run 
CMD ["/bin/bash"]
