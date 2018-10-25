#!/bin/sh

sudo useradd isow && mkdir /home/isow/.ssh && chown 700 /home/isow/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4HsdsnkNa/Czac5duRGzD39BcFFd7407kY7s1dRfGBabccv7UXNyjRJ1weMxYpj5GWwv0AXxA9Se4rndysM2jELWFGNE8OxHZJE8SXB3dU+yjlT03na6SGk87OKmEEAYO5Q1PXkwfrhUZbLkPRyoZukbU72W9O9gznFFas+HEsCDkTaPhmwfVlOWHDzqFQj7Q3cSMrJu+1sErh1yyir/uweruuC4u5hqYutm9KDdNXH2EYFlPFf5l5rr7A0nvOJEF5nDk2INQTM5VB8TJJ7JbaCNijVpc2ixj1kxSwt5c8hKM8rBMpilMNB+gkk0inWo3Jxv4rn076mOba8NuMTPio/9ukUDl2UcOJkmXpAJdcC9IdnNLNH0z9bROej999bUVolcMn4DaGq+LDaVXW6cEMRl3/k0hy5PJ5J9j2/AawjElD4uNAPAndgNxVmU1Dc2CZ0b/Z5lrAmUAx2tOHw76tgN2BTdYKSgkEIPif+ygcOIurh5QZYY3U5W2IUouAoNmuehFKZ8gPS6DRBcnq9uLJ5V9TjcVOcUSQp3cziZ6zJYIp161zIo0QGxmNj/lALke++2gCETul2jxyLxiFjdtXmJwo6nxeky2caMg0j4P1YR0fq/mJKMW5fokwFnovdstSbN0RlaY7zgNIgT1bmwOHixFd89GJdgUDlsfEqz8JQ== ibrahim.sow@mutex-exterieur.fr" > /home/isow/.ssh/authorized_keys && chmod 600 /home/isow/.ssh/authorized_keys && chown -R isow:isow /home/isow
sudo useradd pparant && mkdir /home/pparant/.ssh && chown 700 /home/pparant/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0xACzEmw2xS804LNXFAts14uRxb89E46hdrJd0sNlu9vWviSDXWfO9M9N2U9DtMVmy5oLGThziivlqftemOVvXj5Nnq0OfBk2UXFKiPpQtjsiiXyNW+5HrVew+e9wMkR+FyeTy8XhFicw9FgLroigSdo036OCSYFgLuOBfBCPDdqwhCaDy4PLCwi0uSW0ZWpYZXslTdnZd+4n7t71WscH2mgW9FQNej7W750nhc6vYWvqB4RURDFrXeAwgM1zJQtULHB0jsi0U3AStuXe9WupiJVtkQTVy3wldK7FSQEdoCmqS1kYW1r4GOy5LFC154Kc65qeR8bY7Hj1kUy11sUxQ== parant" > /home/pparant/.ssh/authorized_keys && chmod 600 /home/pparant/.ssh/authorized_keys && chown -R pparant:pparant /home/pparant
# sudo useradd mverhegge && mkdir /home/mverhegge/.ssh && chown 700 /home/mverhegge/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuyCesmbL2KRDGXlSm58gchEQ02jTinV3GEaDiFXTIEq7Nfjh5OCSVMwOT9NYk0XS9QeyiAhcX5WDI63xQDMrNUd6O5ergPUMq6546adDO28+uWHzj9lnwunzf7ueOT76AcDOt+nZ7COD5V7FdReXijgEXJEhJgiHMvybGllEjHUWXl8M4bnNPPP46AoM70pn+8LDgO0GHP1+cSroqv0+vj+VsjndAg3MiW54lW19o3fhwaxj+31HYUKpjwu/4jCo3UCSLYnAhmIV7Odua1wZsgufrTc1nVeg6YXkxbq2a4XicQw4TM6Sk+O3AZcXGqeKzyU4izXYlX8rXZTbLgN5wQ==" > /home/mverhegge/.ssh/authorized_keys && chmod 600 /home/mverhegge/.ssh/authorized_keys && chown -R mverhegge:mverhegge /home/mverhegge
# sudo useradd mabbi && mkdir /home/mabbi/.ssh && chown 700 /home/mabbi/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhm/JFfxv7nGafS/gQz7m6bT7nhVhZtl/K/hgrReYV8sMcubq7NOwFk/1MypiHgDxe4ayMPgWzTXmwyGtrKFFQF5QV5ZU2uWQWg7VX9csGprkMDmzqKGjkw1A2SfEnkh1rr84Ft0HlEC02ohKA2wmnocHl2zn1wfYZHdNWCw3bdl18KSO0xmvoHR0xliQ5RATVJKG/i9JaHj0zth4w5y97Q7NfygfmLuiaxK/KXConDYFyHuyx/UGQKu7a9tKVETGudLcRrAgDRsJM13zEGXPaAZDUo3j3RjEg+dbp4Iwp0XLvLBU4aF+y7JZd9uozykE8Q9n8BldfPASBH1b6ml/jQ==" > /home/mabbi/.ssh/authorized_keys && chmod 600 /home/mabbi/.ssh/authorized_keys && chown -R mabbi:mabbi /home/mabbi
# sudo useradd mboumati && mkdir /home/mboumati/.ssh && chown 700 /home/mboumati/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAtT7UIykBHLCzse6WzpYsecsWJbUtHY/EzDfQfkyCQphPBhuBaTrLIyWQTQbLJYSjusfzwszC+LxOUUpqGkAcduYP8nEWeILP5Wg0axmRJWoWsm963qJhiYWMpjb0smjBVppPDxbQg5Tmg8Lq9n1fSVHwMTBo2MSOFOfqGw8Ht0SSH/dJDVxVGLoezLw+r/XBxmh6QiV7Vhttr6bSSVAGBIoR6j76hrI2PODSpg/g/ThuHkcLtYzcSCX6bHT3HgPlllfAB/sy9tHk+/PM2j/sU8UQ9+BVw3Nlt2jvt0eo3bsSJ9S1y/XxUOlNjLPCOwh4Lj7PGO3js9gwPdvOBpkX4w==" > /home/mboumati/.ssh/authorized_keys && chmod 600 /home/mboumati/.ssh/authorized_keys && chown -R mboumati:mboumati /home/mboumati
# sudo useradd tcrouvezier && mkdir /home/tcrouvezier/.ssh && chown 700 /home/tcrouvezier/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAyUEPhN/u2UM5ZFc3Nk7f6U3+uh6hi5DMBcTfjj9ngXyO3bpBmDvpmzMsDxiNkpoRNGJ0Nk4u7r/yfpRJ5OpLePNMT0hozPZmholsbCF9E/+JYaqwH6aXuQ55G2kum9yP6Ds/MDTf4jCle6lFaBneM/KcEOO6u3IxphE2CTvdKV7fNWH4vn9nVglmw2+zS+BiYeDbn8X932C7xBiEj2F7Cx7UVgbUYM4Atkv2hjjlgglIVgN173m0mTB+McCjXF58ajvyk35/yayN6IOE6n8zmGLKaCeeo2mzn0vGFvy7YwxNzGRM7i2h66ZfaER8qApR/iN9wznq8KgU85s89xWExw==" > /home/tcrouvezier/.ssh/authorized_keys && chmod 600 /home/tcrouvezier/.ssh/authorized_keys && chown -R tcrouvezier:tcrouvezier /home/tcrouvezier
# sudo useradd mghanem && mkdir /home/mghanem/.ssh && chown 700 /home/mghanem/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmgZ+Y71mN8yQWrWBCkSxj06MIHUPjT6kw9V514u6bociJwc0TQgi7B80XH2Q6x51313OKeduxsRDN7Au0guj3X6tep5wyR5T3A64bRcwxV5Z0g8M/voLKeb6ixsAodSJyCdipMzUQBRKhhBGXEX8rkHaCoHqL7tTQWWkzzRPMl5LnHjxVH8acfz4TbQLYE6UY6D6M8CnRoEKVNA/YtoZNnkUnWFIMIbib3e/W3X1hivHvoUUnPc4zDfmzHivXeQTG4SZyR23GIJvtZxSPbOlZxN5HonQwhNaSetzUNps2s2NZWdSl58KchcDyVoo0HCMjvVkR+jJ34YdYQBOlzpoaQ==" > /home/mghanem/.ssh/authorized_keys && chmod 600 /home/mghanem/.ssh/authorized_keys && chown -R mghanem:mghanem /home/mghanem

sudo amazon-linux-extras install epel
sudo yum update -y
sudo yum install nginx -y

sudo systemctl enable nginx

sudo systemctl start nginx

# Ai changé le nom du bucket dans le script car il existe déjà chez GFI : ai changé mutex en mutex-er

sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/tomcat1.conf /etc/nginx/default.d/tomcat1.conf
sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/traefik.conf /etc/nginx/default.d/traefik.conf
sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/nsi.conf /etc/nginx/default.d/nsi.conf
sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/keycloak.conf /etc/nginx/default.d/keycloak.conf
sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/ci.conf /etc/nginx/default.d/ci.conf
sudo aws s3 cp s3://mutex-er-admin-configuration/nginx/nginx.conf /etc/nginx/nginx.conf


sudo mkdir /etc/ssl/private
sudo openssl req -x509 -nodes -days 900 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=Global Security/OU=Nord Mut Department/CN=gfi.Fr"

sudo systemctl reload nginx

