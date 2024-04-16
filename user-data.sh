#!/bin/bash

# Update and upgrade the servers
apt update && apt upgrade -y

# Set timezone to Africa/Lagos
timedatectl set-timezone Africa/Lagos

# Install Apache HTTP Server
apt install -y apache2

# Remove existing index.html file
rm -f /var/www/html/index.html

# Create index.html file with server information
cat <<EOF > /var/www/html/index.html
<h1>Welcome, this is my hostname:</h1>
<p>Hostname: $(hostname -f)</p>
<h2>This is my IP address and it switches to other servers when the web page is refreshed:</h2>
<p>$(hostname -I)</p>
<h3>This is my OS:</h3>
<p>Operating System: $(hostnamectl | grep 'Operating System' | cut -d ' ' -f5-)</p>
<h3>This is my Timezone:</h3>
<p>Timezone: $(timedatectl | grep 'Time zone' | awk '{print $3}')</p>
<h3>Current Date and Time:</h3>
<p id='liveTime'></p>
<script>setInterval(function() { document.getElementById('liveTime').innerHTML = 'Current Date and Time: ' + new Date().toLocaleString(); }, 1000);</script>
EOF

# Restart Apache HTTP Server
systemctl restart apache2
