vpn() {
  case $2 in
    on)
      systemctl start openvpn-$1.service
      ;;
    off)
      systemctl stop openvpn-$1.service
      ;;
    x)
      systemctl restart openvpn-$1.service
      ;;
    *)
    echo "${0} {on|off|x}"
  esac
}
