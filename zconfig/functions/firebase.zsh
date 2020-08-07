f() {
  case $1 in
      o)
          firebase use $2
          ;;
      g)
          firebase database:get $2 | jid
          ;;
      r)
          firebase database:remove --confirm $2
          ;;
      u)
          firebase database:update --data $3 --confirm $2 
          ;;
      p)
          firebase database:push --data $3 $2
          ;;
      P)
          firebase database:profile
          ;;
      *)
          echo "${0} {o - open|g - get|r - remove|u - update, p - push, P - profile}"
  esac
}
