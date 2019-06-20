echo "What would you like to do with your snapshot?"
echo "restore | delete"
read SELECT

if [[ $SELECT = "delete" ]]; then
  echo "What VM are you referencing?"
  vboxmanage list runningvms
  read NAME
  echo "What is the name/UUID of the snapshot you would like to delete?"
  vboxmanage snapshot $NAME list --details
  read SNAPSHOTNAME
  vboxmanage snapshot $NAME delete $SNAPSHOTNAME
fi
if [[ $SELECT = "restore" ]]; then
  echo "What VM would you like to restore to a previous snapshot?"
  vboxmanage list runningvms
  read NAME
  vboxmanage snapshot $NAME list --details
  echo "What is the name/UUID of the snapshot you would like to restore?"
  read SNAPSHOTNAME
  vboxmanage snapshot $NAME restore $SNAPSHOTNAME
fi
