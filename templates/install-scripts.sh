#! /bin/bash
echo "Installing docker and docker compose packages"
sudo apt -y update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker ubuntu

echo "Copying the Jenkins server SSH Key"

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5PBIRpdZ7TdAsAsI1kxf3Qv6a0UnUaocdLuME5945SoiqMy5tBtUW4x8fOsHFfWtT5Iz72IpsUw8zGR+CRnMwfTRbbJ6KeGB1KENHueA+OfUIbc5Ymi6U4dKPIypX4/YW4dzbtRApFL1QbAHBcIxbM52e7gn42rBN2jZ3PYegTyAvvEFoNPeLJFaQatNk6JT535tsqy83UPOgkKQhPV94+574xxfSBmDZxrPKNcd2B8fZPIdbobjsPX5dwrJp10y6NzI2SXLvVxRByEAC6xjN2eDMl9u+G2vxb4FcNFki3W25EERUmBX39jIvI6pT50H6RgIBbwklXQe5MNIQEvAfw== sayonetech@web471.webfaction.com" >> /home/ubuntu/.ssh/authorized_keys
