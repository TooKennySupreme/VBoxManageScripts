echo "How would you like to terminate your VM?"
echo "soft | hard | natural"
read OPTION
echo "What is the name of the VM you would like to poweroff?"
vboxmanage list runningvms
read NAME

if [[ $OPTION = "soft" ]]; then
  vboxmanage controlvm $NAME poweroff soft
elif [[ $OPTION = "hard" ]]; then
    vboxmanage controlvm $NAME poweroff hard
elif [[ $OPTION = "natural" ]]; then
  VBoxManage controlvm $NAME acpipowerbutton
fi
