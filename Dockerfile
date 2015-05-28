FROM boot2docker/boot2docker:latest
MAINTAINER Tuzki Zhang <rabbitzhang52@gmail.com>

RUN rm $ROOTFS/etc/rc.d/automount-shares && \
    sed -i "s/\/etc\/rc.d\/automount-shares//g" $ROOTFS/opt/bootscript.sh && \
    echo "/usr/local/etc/init.d/nfs-client start" >> $ROOTFS/opt/bootscript.sh

RUN mkdir $ROOTFS/Users && \
    echo "10.0.2.2:/Users /Users  nfs     rw,async,noatime,rsize=32768,wsize=32768,proto=tcp      0       0" >> $ROOTFS/etc/fstab

# for bug...
RUN sed -i "s/echo \"Need TLS certs for \$CERTHOSTNAMES\"/CERTHOSTNAMES=\"boot2docker,127.0.0.1,10.0.2.15,192.168.59.103\"\n        echo \"Need TLS certs for \$CERTHOSTNAMES\"/g" $ROOTFS/usr/local/etc/init.d/docker

RUN /make_iso.sh
CMD cat boot2docker.iso
