#!/bin/bash

# Check for arguments
if [ $# -eq 0 ]; then
	echo "How to use: ./Get_subdomains.sh <domain>"
	echo "Ex: ./Get_subdomains.sh example.com"
	exit 1
fi

# Remove all old files created by tool.
rm -f index.html sub.txt vaild_sub.txt ips.txt

# Exctract Domain from : https:// , www. and /paths

domain=$(echo "$1" | sed 's|^https\?://||' | sed 's|^www\.||' | cut -d '/' -f 1)

echo "[+] Target domain $1"
echo "[+] Fetching $1 ...."

# Get index.html file from domain
wget -q $1 -O index.html

# Check on Content in index.html
if [ ! -f index.html ]; then 
	echo "[!] Failed to fetch $1"
	exit 1
fi


# Exctract subdomains from index.html by regex code  
grep -oE 'href="[^"]+"' index.html \
| cut -d '"' -f 2 \
| grep -oE '([a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,}' \
| grep "$domain" \
| grep -v "^www\.$domain$" \
| sed "s|^www\.||" \
| sort -u > sub.txt

# Check on subdomains number with wc tool
echo "[*] Found $(wc -l < sub.txt) unique candidates"
echo "----------------------------------------------"

# Check on vaild subdomains or not by host tool
for sub in $(cat sub.txt);do
	if host "$sub" &> /dev/null;then
		echo "$sub -----> Pong"
		echo "$sub" >> vaild_sub.txt
	else
		echo "$sub -----> Error"
	fi
done

echo "----------------------------------------------"

# Check on vaild subdomains and get IPs from vaild subdomains .
if [ -f vaild_sub.txt ]; then 
	for sub in $(cat vaild_sub.txt);do
		host "$sub" | grep "has address" | awk '{print $4}' >> ips.txt
	done
	sort -u ips.txt -o ips.txt
	echo "[+] Vaild subdomains saved to: vaild_sub.txt"
	echo "[+] IPs saved to: ips.txt"

else
	echo "[-] No vaild subdomains found."
fi
echo "Done ......"

