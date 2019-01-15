.PHONY: build run kill enter push pull
#MAINTAINER jiang_yi_bo <admin@sinzuo.com>
#VPATH 设置 make run 默认映射当前目录 或者 make run VPATH=/home/jiang
#   sudo docker run -d -it --restart=always --name myantdesign -v /home/jiang:/mnt -p 9091:8000 jyb-antdesign:1.0 /bin/sh
#   sudo docker run -d --name business -e "PUBLICHOST=localhost" -e "ADDED_FLAGS=-d -d" -v /home/jiang:/mnt -p 9091:80 business:1.0

ifneq ($(VPATH),)
VPATH?=$(VPATH)
else
VPATH?=$(PWD)
endif

build:
	sudo cp -rf rootfs/* squashfs-root/

run:
	sudo docker run -d --restart=always  --name tftp -v $(VPATH):/mnt -p 69:69/udp sinzuotftp:1.0
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill tftp
	-sudo docker rm tftp

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags
clean:
	sudo rm -rf squashfs-root
	rm -rf kernel.bin
	rm -rf secondchunk.bin
	rm -rf pifii-rom.bin
	rm -rf root.squashfs
pull:
	git pull
