free_ram=$(free -m | sed -n 2p | tr -s " " | cut -d" " -f4)
cpu_load_avg=$(uptime | cut -d: -f5)
io_bytes_rec=$(cat /proc/net/dev | sed -n 3p | tr -s " " | cut -d' ' -f3)
io_bytes_sent=$(cat /proc/net/dev | sed -n 3p | tr -s " " | cut -d' ' -f11)
eth0_bytes_rec=$(cat /proc/net/dev | sed -n 4p | tr -s " " | cut -d' ' -f3)
eth0_bytes_sent=$(cat /proc/net/dev | sed -n 4p | tr -s " " | cut -d' ' -f11)
ping -c1 google.com > /dev/null
ping_status_code=$?
if [ $ping_status_code = 0 ]
then
	internet_connected="yes"
else
	internet_connected="no"
fi
number_users=$(cat /etc/passwd | wc | tr -s " " | cut -d' ' -f2)
number_active_users=$(who | sc | tr -s ' ' | cut -d' ' -f2)
most_used_shell=$(cat /etc/passwd | cut -d: -f7 | uniq -c | sort -n | tail -n1 | tr -s ' ' | cut -d' ' -f3)

echo "CPU AND MEMORY RESOURCES ------------------"
echo "CPU LOAD AVERAGE: $cpu_load_avg	Free RAM: $free_ram"
echo "NETWORK CONNECTIONS -----------------------"
echo "Io Bytes Received: $io_bytes_rec	Bytes Transmitted: $io_bytes_sent"
echo "eth0 Bytes Received: $eth0_bytes_rec	Bytes Transmitted: eth0_bytes_sent"
echo "Internet Connectivity: $internet_connected"
echo "ACCOUNT INFORMATION -----------------------"
echo "Total Users: $number_users 	Number Active: $number_active_users"
echo "Most Frequently Used Shell: $most_used_shell"
