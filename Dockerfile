FROM boot2docker/boot2docker:latest
MAINTAINER Tuzki Zhang <rabbitzhang52@gmail.com>

RUN rm $ROOTFS/etc/rc.d/vbox && \
    sed -i "s/\/etc\/rc.d\/vbox//g" $ROOTFS/opt/bootscript.sh && \
    echo "/usr/local/etc/init.d/nfs-client start" >> $ROOTFS/opt/bootscript.sh && \
    sed -i "s/0.boot2docker.pool.ntp.org\ 1.boot2docker.pool.ntp.org\ 2.boot2docker.pool.ntp.org\ 3.boot2docker.pool.ntp.org/1.cn.pool.ntp.org\ 1.asia.pool.ntp.org\ 0.asia.pool.ntp.org/g" $ROOTFS/etc/rc.d/ntpd

RUN mkdir $ROOTFS/Users && \
    echo "10.0.2.2:/Users /Users  nfs     rw,async,noatime,rsize=32768,wsize=32768,proto=tcp      0       0" >> $ROOTFS/etc/fstab

COPY localtime $ROOTFS/etc/localtime

RUN /make_iso.sh
CMD cat boot2docker.iso
