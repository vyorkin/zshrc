ipsum() {
  sudo ipset -q flush ipsum
  sudo ipset -q create ipsum hash:net
  for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do sudo ipset add ipsum $ip; done
  sudo iptables -I INPUT -m set --match-set ipsum src -j DROP
}
