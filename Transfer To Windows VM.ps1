# # environment
$env:Path += ";C:\Program Files\Oracle\VirtualBox"

# Variable
$WINDOWS_7_VM = 'Windows_7_NPE'

# transfer the install_proftp script to the Debian VM

VBoxManage guestcontrol $WINDOWS_7_VM copyto "D:\NPE\post-install-windows-7.bat" "C:\Users\user\Desktop\post-install-windows-7.bat" --username "user" --password "user"

Read-Host -Prompt "Press Enter to exit"