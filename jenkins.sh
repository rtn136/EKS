#!/bin/bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt install openjdk-11-jdk -y
sudo apt-get install jenkins -y
echo -e "Jenkins URL:\n$(curl -s http://checkip.amazonaws.com):8080\nInitial Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword