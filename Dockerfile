# docker build -t qemu_esp32/ubuntu -f ./Dockerfile .
# run image with:
# docker run -v ~/shared-vm:/home/src  -p 1234:1234 -ti qemu_esp32/ubuntu /bin/bash
# where ~/shared-vm is a shared folder, and /home/src is where you work in this docker container.
# In windows
# docker run -v C:\work\qemu_esp32\:/home/src -p 1234:1234 -ti qemu_esp32/ubuntu   /bin/bash
# The esp32flash.bin must be in the shared-vm path

FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

# Make sure the image is updated, install some prerequisites,
 RUN ls
 RUN apt-get update && apt-get install -y xz-utils libpixman-1-0 libpng16-16 libjpeg8 libglib2.0
 RUN apt-get install -y wget curl unzip
 RUN curl -L -o 7660221.zip -u octocat:d185e982770a84612b41235071d9bd569264d836 "https://api.github.com/repos/eds000n/qemu-xtensa-esp32/actions/artifacts/7660221/zip"
 RUN wget https://github.com/espressif/qemu/raw/esp-develop/pc-bios/esp32-r0-rom.bin
 RUN unzip 7660221.zip  -d .

 EXPOSE 1234

 # Start from a Bash prompt
 CMD [ "/bin/bash" ]

#&& \
#   echo 'export PATH=/clang_8.0.0/bin:$PATH' >> ~/.bashrc && \
#   echo 'export LD_LIBRARY_PATH=/clang_8.0.0/lib:LD_LIBRARY_PATH' >> ~/.bashrc
