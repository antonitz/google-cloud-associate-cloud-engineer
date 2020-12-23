#! /bin/bash
NAME=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name)
ZONE=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone | sed 's@.*/@@')
sudo apt-get update
sudo apt-get install -y stress apache2
sudo systemctl start apache2
cat <<EOF> /var/www/html/index.html
<html>
	<head>
		<title> Managed Bowties </title>
    </head>
    <style>
h1 {
  text-align: center;
  font-size: 50px;
}
h2 {
  text-align: center;
  font-size: 40px;
}
h3 {
  text-align: right;
}
</style>
    <body style="font-family: sans-serif"></body>
	<body>
		<h1>Aaaand.... Success!</h1>
        <h2>MACHINE NAME <span style="color: #3BA959">$NAME</span> DATACENTER <span style="color: #5383EC">$ZONE</span></h2>
		<section id="photos">
			<p style="text-align:center;"><img src="https://storage.googleapis.com/tony-bowtie-pics/managing-bowties.svg" alt="Managing Bowties"></p>
		</section>
	</body>
</html>
EOF