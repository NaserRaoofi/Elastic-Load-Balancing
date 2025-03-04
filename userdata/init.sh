#!/bin/bash
yum update -y
yum install -y httpd php

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Create a simple PHP application
cat <<EOF > /var/www/html/index.php
<!DOCTYPE html>
<html>
<head>
    <title>EC2 Instance Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Server Information</h1>
        <?php
        \$instance_id = file_get_contents('http://169.254.169.254/latest/meta-data/instance-id');
        \$availability_zone = file_get_contents('http://169.254.169.254/latest/meta-data/placement/availability-zone');
        echo "<p><strong>Instance ID:</strong> " . \$instance_id . "</p>";
        echo "<p><strong>Availability Zone:</strong> " . \$availability_zone . "</p>";
        echo "<p><strong>Server Time:</strong> " . date('Y-m-d H:i:s') . "</p>";
        ?>
    </div>
</body>
</html>
EOF

# Set proper permissions
chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/ 