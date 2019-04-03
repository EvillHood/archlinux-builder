FROM archlinux/base
MAINTAINER EvillHood

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
RUN pacman -S which --noconfirm
RUN pacman -S qt5-tools --noconfirm

#voodoo magic
#############
RUN set -x; strip --remove-section=.note.ABI-tag /usr/lib/libQt5Core.so.5

#build gammaray
#############
RUN git clone git://github.com/KDAB/GammaRay.git; cd GammaRay; cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/gammaray .; cmake --build build --target install -j8;

# docker settings
#################

# map /source to host source data path (used to )
VOLUME /source

# map /data to host defined data path (used to store data from app)
VOLUME /data

# run 
CMD ["/bin/bash"]
