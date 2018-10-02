#!/bin/sh

sudo useradd nrousseau1 && mkdir /home/nrousseau1/.ssh && chown 700 /home/nrousseau1/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvwgaHUhGuH9F1/Wirck6dRFKzIrxv9GkUMZHyRN1aFeNA5QyVuZnQgOaDgEfwvHVOnCks9IRg0jD345wwY0l71hW/ULadCJFMhuz4gslsn/kz36mBT0xDe8E3+04MPqR7XylCVllDYZxtMJk0uwazotFPsyOnPGLJRzAVvuuzQick/Onm4gWBxbtpPeK+V3rGqVIYNC0k4LUwf5OHW0PVL4+4xekHHZ3j3++r6m6WgkpR7foVcIMQH1FkuNmybpCyfLHa5sVC7S16f9e+6EmaxiR8R1MwR7/zlY8AzFxrtEhn6NVhFTeNiQ1QJBGIo5VDhvCCmN/jdrhtpnVYwiswiWCeBIwlAoXdX7zgTGlHN5pmvosuW5OeK1uYHMaq/QlATROQkjMvER5cPF19eaoP8gNtpcxDNLZgjRJ6wbcdQcqbdtyM7kOfgfKkiXn7sji6pYZvg7wQsCtACnYhSKLoYfoXt+bj6TF/lWTsU7/FwgtyneAvtMAFDk39J8xeB8Ly/jxrH0xjNmHR+dP6BkGjW+U7sxIwwnTxc296S60k1QsKM6PZLWRZAqrQktGGlYDGhZxdKP0Yy0+nbf5n2z88f2AlCD4O9Ou2h+gAc0ah5BO5LRj6ULCrdsEk/Dx8TzuPp7MYDamn7TL9KJQrQxt09LsnBY9NDR6etVdLxf30Bw== nrousseau1" > /home/nrousseau1/.ssh/authorized_keys && chmod 600 /home/nrousseau1/.ssh/authorized_keys && chown -R nrousseau1:nrousseau1 /home/nrousseau1
sudo useradd ahedjaz && mkdir /home/ahedjaz/.ssh && chown 700 /home/ahedjaz/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZ8jpyUwBG1xZqjwyNCDNDigPN4k63rzlNwyxB1RhYIgnMw4h9v6NE7AaSwOrS/dcpeGeX5MMlIoBEFOaGUK8yCy7GvzC9JAufw3EQEEr2I0fpovQV5+NULPlzj1q/18d+SA57S1oNkkyUXF71EddTvnVijTMI9XIaqKmGlHele1WmK0z5E9chJrrFymyA3B/61yyg4VdkNslcSFHXBiaVh9CLCxAgE7tRMc52Nd8ZokqHSnl2899ZsCTpBV7xhZ+zsFb6hcrONN7/Icpf0/MwZL6pzpMoKvGQV7EPhNfA+NWzGyvJ5ZInpN8zcyVwVV97TzCAyuD8svmtpCGQy/adx6LMwkmFBOGlC8orGwdFHA9eCvB590l8nCto59D4uUH6YGyXxb6LuYwC/dxssdOD8qfw2Ry+1cQdgcNOGEjoSEtsO1fQvsLaUd2sybG4lFF7pcqqFNlqPNsOnqizMMoTG01oVB+VzFNZW83Mc6cPuHnbn8vK/nRjr4rZf5gRCn/OYifOrk+hLbFoI0JdpXmdOnTk7nZibulnHHWl6/W3KCXWsV0Q1UITXm03Xwh7VsgGxeYu02KCbzNIiyT8Mu3zZw+PJFtWnG/VRpB2kyJDS/onfhhTAHcyjdIppBltwUuvhseeWOBd6RJY2511C3VEstrdoFURA6+Zyb/EYG+oLQ== ali.hedjaz@gfi.fr" > /home/ahedjaz/.ssh/authorized_keys && chmod 600 /home/ahedjaz/.ssh/authorized_keys && chown -R ahedjaz:ahedjaz /home/ahedjaz
sudo useradd mverhegge && mkdir /home/mverhegge/.ssh && chown 700 /home/mverhegge/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuyCesmbL2KRDGXlSm58gchEQ02jTinV3GEaDiFXTIEq7Nfjh5OCSVMwOT9NYk0XS9QeyiAhcX5WDI63xQDMrNUd6O5ergPUMq6546adDO28+uWHzj9lnwunzf7ueOT76AcDOt+nZ7COD5V7FdReXijgEXJEhJgiHMvybGllEjHUWXl8M4bnNPPP46AoM70pn+8LDgO0GHP1+cSroqv0+vj+VsjndAg3MiW54lW19o3fhwaxj+31HYUKpjwu/4jCo3UCSLYnAhmIV7Odua1wZsgufrTc1nVeg6YXkxbq2a4XicQw4TM6Sk+O3AZcXGqeKzyU4izXYlX8rXZTbLgN5wQ==" > /home/mverhegge/.ssh/authorized_keys && chmod 600 /home/mverhegge/.ssh/authorized_keys && chown -R mverhegge:mverhegge /home/mverhegge
sudo useradd mabbi && mkdir /home/mabbi/.ssh && chown 700 /home/mabbi/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhm/JFfxv7nGafS/gQz7m6bT7nhVhZtl/K/hgrReYV8sMcubq7NOwFk/1MypiHgDxe4ayMPgWzTXmwyGtrKFFQF5QV5ZU2uWQWg7VX9csGprkMDmzqKGjkw1A2SfEnkh1rr84Ft0HlEC02ohKA2wmnocHl2zn1wfYZHdNWCw3bdl18KSO0xmvoHR0xliQ5RATVJKG/i9JaHj0zth4w5y97Q7NfygfmLuiaxK/KXConDYFyHuyx/UGQKu7a9tKVETGudLcRrAgDRsJM13zEGXPaAZDUo3j3RjEg+dbp4Iwp0XLvLBU4aF+y7JZd9uozykE8Q9n8BldfPASBH1b6ml/jQ==" > /home/mabbi/.ssh/authorized_keys && chmod 600 /home/mabbi/.ssh/authorized_keys && chown -R mabbi:mabbi /home/mabbi

sudo amazon-linux-extras install epel
sudo yum update -y
sudo yum install nginx -y

sudo systemctl enable nginx

sudo systemctl start nginx

sudo aws s3 cp s3://mutex-configuration/nginx/tomcat1.conf /etc/nginx/default.d/tomcat1.conf
sudo aws s3 cp s3://mutex-configuration/nginx/traefik.conf /etc/nginx/default.d/traefik.conf
sudo aws s3 cp s3://mutex-configuration/nginx/nsi.conf /etc/nginx/default.d/nsi.conf
sudo aws s3 cp s3://mutex-configuration/nginx/keycloak.conf /etc/nginx/default.d/keycloak.conf
sudo aws s3 cp s3://mutex-configuration/nginx/ci.conf /etc/nginx/default.d/ci.conf
sudo aws s3 cp s3://mutex-configuration/nginx/nginx.conf /etc/nginx/nginx.conf


sudo mkdir /etc/ssl/private
sudo openssl req -x509 -nodes -days 900 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=Global Security/OU=Nord Mut Department/CN=gfi.Fr"

sudo systemctl reload nginx

