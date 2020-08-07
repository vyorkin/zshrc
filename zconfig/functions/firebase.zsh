f() {
  case $1 in
      o)
          firebase use $2
          ;;
      g)
          firebase database:get $2 | jid
          ;;
      r)
          firebase database:remove $2
          ;;
      u)
          firebase database:update $2
          ;;
      *)
          echo "${0} {o - open|g - get|r - remove|u - update}"
  esac
}
