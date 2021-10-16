# prepare
sudo apt update -y
mkdir $HOME/bin
cd $HOME/bin

# impacket
git clone https://github.com/SecureAuthCorp/impacket
cd impacket
python3 -m pip install .
cd ..

# AutoRecon
sudo apt -y install seclists curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

# alias
alias explorer=xdg-open

cd