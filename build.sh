#!/bin/bash

cd ~
mkdir build
mkdir list
cd build

sudo apt update

#Install Go
sudo apt install golang -y
export PATH=$PATH:~/go/bin

#Install pipx
sudo apt install pipx -y
pipx ensurepath

#Install git
sudo apt install git -y

#Install Curl
sudo apt install curl -y

#Install Gedit
sudo apt install gedit -y

#install prips
sudo apt install prips -y

#Install Prince Processor
git clone https://github.com/hashcat/princeprocessor.git
cd princeprocessor/src
sudo make
chmod +x pp64.bin
sudo cp pp64.bin /usr/bin
cd ../../
rm -rf princeprocessor


#Install TomNomNom tools
go install github.com/tomnomnom/gf@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/anew@latest
go install github.com/tomnomnom/unfurl@latest
go install github.com/tomnomnom/qsreplace@latest

#Install Hakrevdns
go install github.com/hakluke/hakrevdns@latest

#Install httpx
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

#Install Nuculei
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

#Install Naabu
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest

#Install Katana
CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest

#Install SubFinder
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

#Install ffuf
go install github.com/ffuf/ffuf/v2@latest



