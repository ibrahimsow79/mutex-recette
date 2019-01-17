#!/bin/sh
sudo useradd isow && mkdir /home/isow/.ssh && chown 700 /home/isow/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4HsdsnkNa/Czac5duRGzD39BcFFd7407kY7s1dRfGBabccv7UXNyjRJ1weMxYpj5GWwv0AXxA9Se4rndysM2jELWFGNE8OxHZJE8SXB3dU+yjlT03na6SGk87OKmEEAYO5Q1PXkwfrhUZbLkPRyoZukbU72W9O9gznFFas+HEsCDkTaPhmwfVlOWHDzqFQj7Q3cSMrJu+1sErh1yyir/uweruuC4u5hqYutm9KDdNXH2EYFlPFf5l5rr7A0nvOJEF5nDk2INQTM5VB8TJJ7JbaCNijVpc2ixj1kxSwt5c8hKM8rBMpilMNB+gkk0inWo3Jxv4rn076mOba8NuMTPio/9ukUDl2UcOJkmXpAJdcC9IdnNLNH0z9bROej999bUVolcMn4DaGq+LDaVXW6cEMRl3/k0hy5PJ5J9j2/AawjElD4uNAPAndgNxVmU1Dc2CZ0b/Z5lrAmUAx2tOHw76tgN2BTdYKSgkEIPif+ygcOIurh5QZYY3U5W2IUouAoNmuehFKZ8gPS6DRBcnq9uLJ5V9TjcVOcUSQp3cziZ6zJYIp161zIo0QGxmNj/lALke++2gCETul2jxyLxiFjdtXmJwo6nxeky2caMg0j4P1YR0fq/mJKMW5fokwFnovdstSbN0RlaY7zgNIgT1bmwOHixFd89GJdgUDlsfEqz8JQ== ibrahim.sow@mutex-exterieur.fr" > /home/isow/.ssh/authorized_keys && chmod 600 /home/isow/.ssh/authorized_keys && chown -R isow:isow /home/isow
sudo useradd pparant && mkdir /home/pparant/.ssh && chown 700 /home/pparant/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0xACzEmw2xS804LNXFAts14uRxb89E46hdrJd0sNlu9vWviSDXWfO9M9N2U9DtMVmy5oLGThziivlqftemOVvXj5Nnq0OfBk2UXFKiPpQtjsiiXyNW+5HrVew+e9wMkR+FyeTy8XhFicw9FgLroigSdo036OCSYFgLuOBfBCPDdqwhCaDy4PLCwi0uSW0ZWpYZXslTdnZd+4n7t71WscH2mgW9FQNej7W750nhc6vYWvqB4RURDFrXeAwgM1zJQtULHB0jsi0U3AStuXe9WupiJVtkQTVy3wldK7FSQEdoCmqS1kYW1r4GOy5LFC154Kc65qeR8bY7Hj1kUy11sUxQ== parant" > /home/pparant/.ssh/authorized_keys && chmod 600 /home/pparant/.ssh/authorized_keys && chown -R pparant:pparant /home/pparant
sudo useradd nrousseau1 && mkdir /home/nrousseau1/.ssh && chown 700 /home/nrousseau1/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvwgaHUhGuH9F1/Wirck6dRFKzIrxv9GkUMZHyRN1aFeNA5QyVuZnQgOaDgEfwvHVOnCks9IRg0jD345wwY0l71hW/ULadCJFMhuz4gslsn/kz36mBT0xDe8E3+04MPqR7XylCVllDYZxtMJk0uwazotFPsyOnPGLJRzAVvuuzQick/Onm4gWBxbtpPeK+V3rGqVIYNC0k4LUwf5OHW0PVL4+4xekHHZ3j3++r6m6WgkpR7foVcIMQH1FkuNmybpCyfLHa5sVC7S16f9e+6EmaxiR8R1MwR7/zlY8AzFxrtEhn6NVhFTeNiQ1QJBGIo5VDhvCCmN/jdrhtpnVYwiswiWCeBIwlAoXdX7zgTGlHN5pmvosuW5OeK1uYHMaq/QlATROQkjMvER5cPF19eaoP8gNtpcxDNLZgjRJ6wbcdQcqbdtyM7kOfgfKkiXn7sji6pYZvg7wQsCtACnYhSKLoYfoXt+bj6TF/lWTsU7/FwgtyneAvtMAFDk39J8xeB8Ly/jxrH0xjNmHR+dP6BkGjW+U7sxIwwnTxc296S60k1QsKM6PZLWRZAqrQktGGlYDGhZxdKP0Yy0+nbf5n2z88f2AlCD4O9Ou2h+gAc0ah5BO5LRj6ULCrdsEk/Dx8TzuPp7MYDamn7TL9KJQrQxt09LsnBY9NDR6etVdLxf30Bw== nrousseau1" > /home/nrousseau1/.ssh/authorized_keys && chmod 600 /home/nrousseau1/.ssh/authorized_keys && chown -R nrousseau1:nrousseau1 /home/nrousseau1

# Ajout des user isow, pparant, nrousseau1 dans les groupes wheel et adm
sudo usermod -aG wheel isow
sudo usermod -aG adm isow

sudo usermod -aG wheel pparant
sudo usermod -aG adm pparant

sudo usermod -aG wheel nrousseau1
sudo usermod -aG adm nrousseau1

#Suite au email de Nicloas Rousseau ajout de l'utilsateur web-data
sudo useradd web-data && mkdir /home/web-data/.ssh && chown 700 /home/web-data/.ssh && echo ""rsa-key-20190116"AAAAB3NzaC1yc2EAAAABJQAAAQEA0bGpAYHWJVm3bH2XU7zyvDWjG45fi5IeeEUNj/IagaE9ImcvZPRPdVBG/HhuVvHqlff8PRG1fCd50DYTA/3XygonGOT9LedxAv+Dhkw1EiJtyR4ZqG/sSvrRvTUQZJujTn7nRuEGh5wLLlLmTPxXcZiHULKxrzhckv4xEaTdIkr1K0hdeyd+fp7rmA22toZ2PqClOe1SJ75eBgM+jcuQ67VN9BBqDqIRCHAFyPfHBZU2Gu5JD8YGz/Ptcn+8aayS6gywEOxGnxRbE3NwEGAiPPURlr5vW+Nr3wP1LsJnv1lESWuYVmO7M6xBXsrLO9/YpkO7ma/iWITLDXz4NOFhBw==" > /home/web-data/.ssh/authorized_key
sudo mkdir -p /home/web-data/www/
chmod -R o+rx /home/web-data

# Ajout du groupe wheel pour faire un sudo sans qu'on leur réclame un password

sudo echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers


sudo amazon-linux-extras install epel
sudo yum update -y
sudo yum install nginx -y

sudo systemctl enable nginx

sudo systemctl start nginx

# Ai changé le nom du bucket dans le script car il existe déjà chez GFI : ai changé mutex en mutex-er
# Ajout du fichier ihm conf dans le script le 30 Novembre 2018 suite au email de Nicolas du 15 Novembre 2018
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/tomcat1.conf /etc/nginx/default.d/tomcat1.conf
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/traefik.conf /etc/nginx/default.d/traefik.conf
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/nsi.conf /etc/nginx/default.d/nsi.conf
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/keycloak.conf /etc/nginx/default.d/keycloak.conf
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/ci.conf /etc/nginx/default.d/ci.conf
sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/nginx.conf /etc/nginx/nginx.conf

sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/ihm.conf /etc/nginx/ihm.conf




sudo mkdir /etc/ssl/private
sudo openssl req -x509 -nodes -days 900 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=Global Security/OU=Epargne Retraite Department/CN=Mutex.fr"

sudo systemctl reload nginx

