#! /bin/bash
NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | sed 's@.*/@@')
apt-get update
apt-get install -y apache2
cat <<EOF> /var/www/html/index.html
<body style="font-family: sans-serif">
<html><body><h1>Welcome!</h1>
<p>My machine name is $NAME</p>
<p>It is a pleasure to serve you from the $ZONE datacenter.</p>
</body></html>
EOF