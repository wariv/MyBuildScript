#!/bin/bash

echo '--== Executing build script ==--'

#mod .bashrc
echo "rm ~/.bash_history" >> ~/.bashrc
echo "curl -k -o ~/.config/puredns/resolvers.txt https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers.txt" >> ~/.bashrc
echo "clear" >> ~/.bashrc


#Prep Directories
cd ~
mkdir build
mkdir list
cd build
mkdir log

#Update apt
printf "     Do apt update..."
sudo apt update >> log/apt.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Do apt update...\n" || printf "\r[\e[31mFAIL\e[0m] Do apt update...\n"

#Install libpcap
printf "     Install libpcap..."
apt-get install libpcap-dev -y >> log/libpcap.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install libpcap...\n" || printf "\r[\e[31mFAIL\e[0m] Install libpcap...\n"

#Install make
printf "     Install make..."
sudo apt-get install make -y >> log/make.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install make...\n" || printf "\r[\e[31mFAIL\e[0m] Install make...\n"

#Install Go
printf "     Install Golang..."
sudo apt-get install golang -y >> log/golang.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install Golang...\n" || printf "\r[\e[31mFAIL\e[0m] Install Golang...\n"
printf "     Set golang path..."
export PATH=$PATH:~/go/bin >> log/golang.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Set golang path...\n" || printf "\r[\e[31mFAIL\e[0m] Set golang path...\n"
printf "\n\nexport PATH=$PATH:~/go/bin \nclear" >> ~/.bashrc

#Install pipx
printf "     Install pipx..."
sudo apt-get install pipx -y >> log/pipx.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install pipx...\n" || printf "\r[\e[31mFAIL\e[0m] Install pipx...\n"
printf "     Set pipx path..."
pipx ensurepath >> log/pipx.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Set pipx path...\n" || printf "\r[\e[31mFAIL\e[0m] Set pipx path...\n"

#Install git
printf "     Install git..." 
sudo apt-get install git -y >> log/git.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install git...\n" || printf "\r[\e[31mFAIL\e[0m] Install git...\n"

#Install Curl
printf "     Install curl..."
sudo apt-get install curl -y >> log/curl.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install curl...\n" || printf "\r[\e[31mFAIL\e[0m] Install curl...\n"

#Install Gedit
printf "     Install gedit..."
sudo apt-get install gedit -y >> log/gedit.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install gedit...\n" || printf "\r[\e[31mFAIL\e[0m] Install gedit...\n"

#Install prips
printf "     Install prips..."
sudo apt-get install prips -y >> log/prips.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install prips...\n" || printf "\r[\e[31mFAIL\e[0m] Install prips...\n"

#Install Prince Processor
printf "     Clone Prince Processor..."
git clone https://github.com/hashcat/princeprocessor.git  >> log/princeprocessor.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Clone Prince Processor...\n" || printf "\r[\e[31mFAIL\e[0m] Clone Prince Processor...\n"
cd princeprocessor/src
printf "       - building..."
sudo make >> ../../log/princeprocessor.log 2>> ../../log/error.log && printf "\r  - [\e[32mOK\e[0m] building...\n" || printf "\r  - [\e[31mFAIL\e[0m] building...\n"
chmod +x pp64.bin >> ../../log/princeprocessor.log 2>> ../../log/error.log
printf "       - moving..."
sudo cp pp64.bin /usr/bin >> ../../log/princeprocessor.log 2>> ../../log/error.log && printf "\r  - [\e[32mOK\e[0m] moving...\n" || printf "\r  - [\e[31mFAIL\e[0m] moving...\n"
cd ../../
rm -rf princeprocessor >> log/princeprocessor.log 2>> log/error.log


#Install TomNomNom tools
printf "     Install gf..."
go install github.com/tomnomnom/gf@latest >> log/gf.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install gf...\n" || printf "\r[\e[31mFAIL\e[0m] Install gf...\n"

printf "     Install waybackurls..."
go install github.com/tomnomnom/waybackurls@latest >> log/waybackurls.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install waybackurls...\n" || printf "\r[\e[31mFAIL\e[0m] Install waybackurls...\n"

printf "     Install anew..."
go install github.com/tomnomnom/anew@latest >> log/anew.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install anew...\n" || printf "\r[\e[31mFAIL\e[0m] Install anew...\n"

printf "     Install unfurl..."
go install github.com/tomnomnom/unfurl@latest >> log/unfurl.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install unfurl...\n" || printf "\r[\e[31mFAIL\e[0m] Install unfurl...\n"

printf "     Install qsreplace..."
go install github.com/tomnomnom/qsreplace@latest >> log/qsreplace.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install qsreplace...\n" || printf "\r[\e[31mFAIL\e[0m] Install qsreplace...\n"

rm -rf /tmp/*

#Install Hakrevdns
printf "     Install hakrevdns..."
go install github.com/hakluke/hakrevdns@latest >> log/hakrevdns.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install hakrevdns...\n" || printf "\r[\e[31mFAIL\e[0m] Install hakrevdns...\n"

#Install httpx
printf "     Install httpx..."
go install github.com/projectdiscovery/httpx/cmd/httpx@latest >> log/httpx.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install httpx...\n" || printf "\r[\e[31mFAIL\e[0m] Install httpx...\n"

rm -rf /tmp/*
sleep 5

#Install Nuculei
printf "     Install nuculei..."
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest >> log/nuculei.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install nuculei...\n" || printf "\r[\e[31mFAIL\e[0m] Install nuculei...\n"

sleep 5

#Install Naabu
printf "     Install naabu..."
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest >> log/naabu.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install naabu...\n" || printf "\r[\e[31mFAIL\e[0m] Install naabu...\n"

#Install nmap
printf "     Install nmap..."
sudo apt-get install nmap -y >> log/nmap.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install nmap...\n" || printf "\r[\e[31mFAIL\e[0m] Install nmap...\n"

#Install Katana
printf "     Install katana..."
CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest >> log/katana.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install katana...\n" || printf "\r[\e[31mFAIL\e[0m] Install katana...\n"

rm -rf /tmp/*

#Install SubFinder
printf "     Install subfinder..."
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest >> log/subfinder.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install subfinder...\n" || printf "\r[\e[31mFAIL\e[0m] Install subfinder...\n"

#Install ffuf
printf "     Install ffuf..."
go install github.com/ffuf/ffuf/v2@latest >> log/ffuf.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install ffuf...\n" || printf "\r[\e[31mFAIL\e[0m] Install ffuf...\n"
printf "     Get ffufrc..."
mkdir ~/.config/ffuf
curl -k -o ~/.config/ffuf/ffufrc https://raw.githubusercontent.com/wariv/MyBuildScript/refs/heads/main/ffufrc >> log/ffuf.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Get ffufrc...\n" || printf "\r[\e[31mFAIL\e[0m] Get ffufrc...\n"


#Install MassDNS
printf "     Clone massdns..."
git clone https://github.com/blechschmidt/massdns.git >> log/massdns.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Clone massdns...\n" || printf "\r[\e[31mFAIL\e[0m] Clone massdns...\n"
cd massdns/src
printf "       -  building..."
make >> ~/build/log/massdns.log 2>> ~/build/log/error.log && printf "\r  - [\e[32mOK\e[0m] building...\n" || printf "\r  - [\e[31mFAIL\e[0m] building...\n"
printf "       -  installing..."
sudo make Install >> ~/build/log/massdns.log 2>> ~/build/log/error.log && printf "\r  - [\e[32mOK\e[0m] installing...\n" || printf "\r  - [\e[31mFAIL\e[0m] installing...\n"
cd ../../
rm -rf massdns >> ~/buildlog/massdns.log 2>> ~/buildlog/error.log

#Install PureDNS
printf "     Install puredns..."
go install github.com/d3mondev/puredns/v2@latest >> log/puredns.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install puredns...\n" || printf "\r[\e[31mFAIL\e[0m] Install puredns...\n"
mkdir ~/.config/puredns/
printf "     Get resolvers list..."
curl -k -o ~/.config/puredns/resolvers.txt https://raw.githubusercontent.com/trickest/resolvers/refs/heads/main/resolvers.txt >> log/puredns.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Get resolvers list...\n" || printf "\r[\e[31mFAIL\e[0m] Get resolvers list...\n"

#Install Waymore
printf "     Install waymore..."
pipx install git+https://github.com/xnl-h4ck3r/waymore.git >> log/waymore.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install waymore...\n" || printf "\r[\e[31mFAIL\e[0m] Install waymore...\n"

#Install Arjun
printf "     Install arjun..."
pipx install arjun >> log/arjun.log 2>> log/arjun.log && printf "\r[\e[32mOK\e[0m] Install arjun...\n" || printf "\r[\e[31mFAIL\e[0m] Install arjun...\n"

#Install Ghauri
printf "     Install ghauri..."
pipx install git+https://github.com/r0oth3x49/ghauri.git >> log/ghauri.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install ghauri...\n" || printf "\r[\e[31mFAIL\e[0m] Install ghauri...\n"

#Install sqlmap
printf "     Install sqlmap..."
pipx install sqlmap >> log/sqlmap.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install sqlmap...\n" || printf "\r[\e[31mFAIL\e[0m] Install sqlmap...\n"

#Install crt.sh
printf "     Install crt.sh..."
curl -k -o crt.sh https://raw.githubusercontent.com/az7rb/crt.sh/refs/heads/main/crt_v2.sh >> log/crt.sh.log 2>> log/error.log && printf "\r[\e[32mOK\e[0m] Install crt.sh...\n" || printf "\r[\e[31mFAIL\e[0m] Install crt.sh...\n"
chmod +x crt.sh >> log/crt.sh.log 2>> log/error.log
sudo mv crt.sh /usr/bin >> log/crt.sh.log 2>> log/error.log

#Install seclists and personalize
printf "     Install Seclists (This could take some time)..."
cd ~
git clone https://github.com/danielmiessler/SecLists.git >> build/log/seclists.log 2>> build/log/error.log && printf "\r[\e[32mOK\e[0m] Install seclists...\n" || printf "\r[\e[31mFAIL\e[0m] Install seclists...\n"
cd ~/list
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-words-lowercase.txt words-med.txt
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-files-lowercase.txt files-med.txt
ln -s ~/SecLists/Discovery/Web-Content/raft-medium-dirs-lowercase.txt dirs-med.txt
ln -s ~/SecLists/Discovery/Web-Content/api/actions-lowercase.txt api-actions.txt
ln -s ~/SecLists/Discovery/Web-Content/api/actions-endpoints.txt api-endpoints.txt
ln -s ~/SecLists/Discovery/Web-Content/api/objects-lowercase.txt api-objects.txt
cat ~/SecLists/Discovery/Web-Content/burp-parameter-names.txt | anew parameters.txt
cat ~/SecLists/Discovery/Web-Content/url-params_from-top-55-most-popular-apps.txt | anew parameters.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/Web-Content/raft-small-words-lowercase.txt | anew words-small.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/n0kovo_subdomains.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/shubs-subdomains.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/fierce-hostlist.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/bug-bounty-program-subdomains-trickest-inventory.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/subdomains-top1million-5000.txt | anew subdomains.txt > /dev/null 2>&1
head -n 5000 ~/SecLists/Discovery/DNS/bitquark-subdomains-top100000.txt | anew subdomains.txt > /dev/null 2>&1
ln -s ~/SecLists/Fuzzing/3-digits-000-999.txt fuzz-nums3.txt
ln -s ~/SecLists/Fuzzing/4-digits-0000-9999.txt fuzz-nums4.txt
ln -s ~/SecLists/Fuzzing/5-digits-00000-99999.txt fuzz-nums5.txt
ln -s ~/SecLists/Fuzzing/big-list-of-naughty-strings.txt fuzz-badchars.txt
ln -s ~/SecLists/Fuzzing/LFI/LFI-Jhaddix.txt fuzz-lfi.txt
ln -s ~/SecLists/Usernames/Names/names.txt fuzz-fname.txt
ln -s ~/SecLists/Usernames/Names/familynames-usa-top1000.txt fuzz-lname.txt
cd ~/build



























