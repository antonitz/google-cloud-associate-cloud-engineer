#! /bin/bash
ENV=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/attributes/env)
NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | sed 's@.*/@@')
PROJECT=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id)
apt-get update
apt-get install -y apache2
cat <<EOF> /var/www/html/index.html
<body style="font-family: sans-serif">
<html><body><h1>Aaaand.... Success!</h1>
<p>My machine name is <span style="color: #3BA959">$NAME</span> and I serve the <span style="color: #3BA959">$ENV</span> environment.</p>
<p>I live comfortably in the <span style="color: #5383EC">$ZONE</span> datacenter and proudly serve Tony Bowtie on the <span style="color: #D85040">$PROJECT</span> project.</p>
<p><img src="https://storage.googleapis.com/tony-bowtie-pics/tony-bowtie.svg" alt="Tony Bowtie"></p>
</body></html>
EOF