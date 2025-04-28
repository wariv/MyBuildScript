#!/bin/bash

#mod .bashrc
echo "rm ~/.bash_history" >> ~/.bashrc
echo "curl -k -o ~/.config/puredns/resolvers.txt https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers.txt" >> ~/.bashrc
echo "clear" >> ~/.bashrc

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

#Install nmap
sudo apt install nmap -y

#Install Katana
CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest

#Install SubFinder
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

#Install ffuf
go install github.com/ffuf/ffuf/v2@latest
curl -k -o ~/.config/ffuf/ffufrc https://raw.githubusercontent.com/wariv/MyBuildScript/refs/heads/main/ffufrc


#Install MassDNS
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo make Install
cd ../
rm -rf MassDNS

#Install PureDNS
go install github.com/d3mondev/puredns/v2@latest
mkdir ~/.config/puredns/
curl -k -o ~/.config/puredns/resolvers.txt https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers.txt

#Install Waymore
pipx install git+https://github.com/xnl-h4ck3r/waymore.git

#Install Arjun
pipx install arjun

#Install Ghauri
pipx install git+https://github.com/r0oth3x49/ghauri.git

#Install sqlmap
pipx install sqlmap

#Install crt.sh
curl -k -o crt.sh https://raw.githubusercontent.com/az7rb/crt.sh/refs/heads/main/crt_v2.sh
chmod +x crt.sh
sudo mv crt.sh /usr/bin

#Install seclists and personalize
cd ~
git clone https://github.com/danielmiessler/SecLists.git
cd ~/list
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-words-lowercase.txt words-med.txt
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-files-lowercase.txt files-med.txt
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-dirs-lowercase.txt dirs-med.txt
ln -s ~/SecLists/Discovery/Web-Content/api/actions-lowercase.txt api-actions.txt
ln -s ~/SecLists/Discovery/Web-Content/api/actions-endpoints.txt api-endpoints.txt
ln -s ~/SecLists/Discovery/Web-Content/api/objects-lowercase.txt api-objects.txt
cat ~/SecLists/Discovery/Web-Content/burp-parameter-names.txt | anew parameters.txt
cat ~/SecLists/Discovery/Web-Content/url-params_from-top-55-most-popular-apps.txt | anew parameters.txt
head -n 5000 ~/SecLists/Discovery/Web-Content/raft-small-words-lowercase.txt | anew words-small.txt
head -n 5000 ~/SecLists/Discovery/DNS/n0kovo_subdomains.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/shubs-subdomains.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/fierce-hostlist.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/bug-bounty-program-subdomains-trickest-inventory.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/subdomains-top1million-5000.txt | anew subdomains.txt
head -n 5000 ~/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt | anew subdomains.txt
ln -s ~/SecLists/Fuzzing/3-digits-000-999.txt fuzz-nums3.txt
ln -s ~/SecLists/Fuzzing/4-digits-0000-9999.txt fuzz-nums4.txt
ln -s ~/SecLists/Fuzzing/5-digits-00000-99999.txt fuzz-nums5.txt
ln -s ~/SecLists/Fuzzing/big-list-of-naughty-strings.txt fuzz-badchars.txt
ln -s ~/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt fuzz-lfi.txt
ln -s ~/SecLists/Usernames/Names/names.txt fuzz-fname.txt
ln -s ~/SecLists/Usernames/Names/familynames-usa-top1000.txt fuzz-lname.txt
cd ~/build



























