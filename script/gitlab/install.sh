#!/bin/sh
sudo yum update -y

sudo useradd nrousseau1 && mkdir /home/nrousseau1/.ssh && chown 700 /home/nrousseau1/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvwgaHUhGuH9F1/Wirck6dRFKzIrxv9GkUMZHyRN1aFeNA5QyVuZnQgOaDgEfwvHVOnCks9IRg0jD345wwY0l71hW/ULadCJFMhuz4gslsn/kz36mBT0xDe8E3+04MPqR7XylCVllDYZxtMJk0uwazotFPsyOnPGLJRzAVvuuzQick/Onm4gWBxbtpPeK+V3rGqVIYNC0k4LUwf5OHW0PVL4+4xekHHZ3j3++r6m6WgkpR7foVcIMQH1FkuNmybpCyfLHa5sVC7S16f9e+6EmaxiR8R1MwR7/zlY8AzFxrtEhn6NVhFTeNiQ1QJBGIo5VDhvCCmN/jdrhtpnVYwiswiWCeBIwlAoXdX7zgTGlHN5pmvosuW5OeK1uYHMaq/QlATROQkjMvER5cPF19eaoP8gNtpcxDNLZgjRJ6wbcdQcqbdtyM7kOfgfKkiXn7sji6pYZvg7wQsCtACnYhSKLoYfoXt+bj6TF/lWTsU7/FwgtyneAvtMAFDk39J8xeB8Ly/jxrH0xjNmHR+dP6BkGjW+U7sxIwwnTxc296S60k1QsKM6PZLWRZAqrQktGGlYDGhZxdKP0Yy0+nbf5n2z88f2AlCD4O9Ou2h+gAc0ah5BO5LRj6ULCrdsEk/Dx8TzuPp7MYDamn7TL9KJQrQxt09LsnBY9NDR6etVdLxf30Bw== nrousseau1" > /home/nrousseau1/.ssh/authorized_keys && chmod 600 /home/nrousseau1/.ssh/authorized_keys && chown -R nrousseau1:nrousseau1 /home/nrousseau1
sudo useradd ahedjaz && mkdir /home/ahedjaz/.ssh && chown 700 /home/ahedjaz/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZ8jpyUwBG1xZqjwyNCDNDigPN4k63rzlNwyxB1RhYIgnMw4h9v6NE7AaSwOrS/dcpeGeX5MMlIoBEFOaGUK8yCy7GvzC9JAufw3EQEEr2I0fpovQV5+NULPlzj1q/18d+SA57S1oNkkyUXF71EddTvnVijTMI9XIaqKmGlHele1WmK0z5E9chJrrFymyA3B/61yyg4VdkNslcSFHXBiaVh9CLCxAgE7tRMc52Nd8ZokqHSnl2899ZsCTpBV7xhZ+zsFb6hcrONN7/Icpf0/MwZL6pzpMoKvGQV7EPhNfA+NWzGyvJ5ZInpN8zcyVwVV97TzCAyuD8svmtpCGQy/adx6LMwkmFBOGlC8orGwdFHA9eCvB590l8nCto59D4uUH6YGyXxb6LuYwC/dxssdOD8qfw2Ry+1cQdgcNOGEjoSEtsO1fQvsLaUd2sybG4lFF7pcqqFNlqPNsOnqizMMoTG01oVB+VzFNZW83Mc6cPuHnbn8vK/nRjr4rZf5gRCn/OYifOrk+hLbFoI0JdpXmdOnTk7nZibulnHHWl6/W3KCXWsV0Q1UITXm03Xwh7VsgGxeYu02KCbzNIiyT8Mu3zZw+PJFtWnG/VRpB2kyJDS/onfhhTAHcyjdIppBltwUuvhseeWOBd6RJY2511C3VEstrdoFURA6+Zyb/EYG+oLQ== ali.hedjaz@gfi.fr" > /home/ahedjaz/.ssh/authorized_keys && chmod 600 /home/ahedjaz/.ssh/authorized_keys && chown -R ahedjaz:ahedjaz /home/ahedjaz

sudo echo "nrousseau1 ALL=(ALL) ALL" >> /etc/sudoers
sudo echo "ahedjaz ALL=(ALL) ALL" >> /etc/sudoers

#Mount Disk
sudo mkfs -t ext4 /dev/xvdg
sudo mkdir /data
sudo mount /dev/xvdg /data
sudo su
sudo echo "/dev/xvdg    /data    ext4     defaults    0 2 " >> /etc/fstab


#Installation Docker
sudo mkdir /data/docker
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-edge
sudo yum install docker-ce -y
sudo systemctl start docker
sudo systemctl stop docker
sudo sed 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=\/usr\/bin\/dockerd -g \/data\/docker/g' /lib/systemd/system/docker.service > /lib/systemd/system/docker.service.tmp
sudo mv /lib/systemd/system/docker.service.tmp  /lib/systemd/system/docker.service
sudo systemctl start docker

sudo systemctl enable docker

sudo mkdir /data/gitlab

#Installation openjdk 10
sudo curl https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz -o openjdk-10.0.2_linux-x64_bin.tar.gz

sudo tar zxf openjdk-10.0.2_linux-x64_bin.tar.gz -C /usr/local
sudo mv /usr/local/jdk-10.0.2 /usr/local/jdk-10
sudo alternatives --install /usr/bin/java java /usr/local/jdk-10/bin/java 1

sudo alternatives --install /usr/bin/jar jar /usr/local/jdk-10/bin/jar 1
sudo alternatives --install /usr/bin/javac javac /usr/local/jdk-10/bin/javac 1
sudo alternatives --set jar /usr/local/jdk-10/bin/jar
sudo alternatives --set javac /usr/local/jdk-10/bin/javac

sudo mkdir /data/gitlab
sudo mkdir /data/gitlab/config
sudo mkdir /data/gitlab/logs
sudo mkdir /data/gitlab/data

sudo docker run --detach \
    --publish 8082:80  \
    --name gitlab \
    --restart always \
    --volume /data/gitlab/config:/etc/gitlab \
    --volume /data/gitlab/logs:/var/log/gitlab \
    --volume /data/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
