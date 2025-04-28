fireb() {
  case $1 in
      o)
          firebase use $2
          ;;
      g)
          firebase database:get $2 | jid
          ;;
      r)
          firebase database:remove -y $2
          ;;
      u)
          firebase database:update -d $3 -y $2
          ;;
      p)
          firebase database:push -d $3 $2
          ;;
      P)
          firebase database:profile
          ;;
      *)
          echo "${0} {o|g|r|u|p|P}"
          echo "o - open"
          echo "g - get"
          echo "r - remove"
          echo "u - update"
          echo "p - push"
          echo "P - profile"
  esac
}
