#!bin/sh

echo "switching to default runlevel..."
openrc default &> /dev/null
echo "starting ftps..."
rc-service vsftpd start &> /dev/null
echo "all set !"
tail -f /dev/null