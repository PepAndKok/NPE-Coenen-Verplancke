# Variables
$KALI_VM = 'Kali_NPE'
$WINDOWS_7_VM = 'Windows_7_NPE'
$RAM = '2048'
$CPU = '2'
$VRAM = '128'

# Append VirtualBox’s installation directory to the PATH environment variable to make things easier
$Env:Path += ";C:\Program Files\Oracle\VirtualBox\"

#------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1. Setup Nat Network
#------------------------------------------------------------------------------------------------------------------------------------------------------------

# Stop DHCP server process if it's running
#$dhcpProcess = Get-Process -Name VBoxDHCP -ErrorAction SilentlyContinue
#if ($dhcpProcess) {
    #Write-Host "Stopping VirtualBox DHCP server..."
    #Stop-Process -Name VBoxDHCP -Force
    #Start-Sleep -Seconds 2  # Wait for the process to terminate
#}

# Remove existing NAT network if needed
#VBoxManage natnetwork remove --netname natnetwork

# Add NAT network with desired settings
#VBoxManage natnetwork add --netname natnetwork --network "192.168.0.0/24" --dhcp on --ipv6 off --enable

# Start NAT network
#VBoxManage natnetwork start --netname natnetwork

#Start-Sleep 10

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# 2. Create Kali VM for attack | +- 2min
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

# Register VM
VBoxManage createvm --name $KALI_VM --ostype 'Debian_64' --register

# Set VM settings
VBoxManage modifyvm $KALI_VM --cpus $CPU --memory $RAM --graphicscontroller vmsvga --vram $VRAM --nic1 natnetwork --nat-network1 natnetwork --clipboard-mode bidirectional --drag-and-drop bidirectional

# Add a SATA storage controller
VBoxManage storagectl $KALI_VM --name 'SATA' --add sata --controller IntelAHCI --bootable on

# Add existing VDI to SATA controller
VBoxManage storageattach $KALI_VM --storagectl 'SATA' --port 0 --device 0 --type hdd --medium '.\64bit\Kali Linux 2023.4 (64bit).vdi'

# Add VBoxGuestAdditions to VM
VBoxManage storageattach $KALI_VM --storagectl 'SATA' --port 1 --device 0 --type dvddrive --medium 'C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso'

# Define boot order
VBoxManage modifyvm $KALI_VM --boot1 disk --boot2 dvd --boot3 none --boot4 none

# Start Kali VM
VBoxManage startvm $KALI_VM --type gui

Start-Sleep 10

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# 3. Create Windows VM for vulnerability) | +- 15min
#--------------------------------------------------------------------------------------------------------------------------------------------------------------

# Register VM
#VBoxManage createvm --name $WINDOWS_7_VM --ostype 'Windows7_64' --register

# Set VM settings
#VBoxManage modifyvm $WINDOWS_7_VM --cpus $CPU --memory $RAM --graphicscontroller vboxsvga --vram $VRAM --nic1 natnetwork --nat-network1 natnetwork --clipboard-mode bidirectional --drag-and-drop bidirectional

# Add a SATA storage controller
#VBoxManage storagectl $WINDOWS_7_VM --name 'SATA' --add sata --controller IntelAHCI --bootable on

# Create the virtual disk file that will eventually become the C drive.
#VBoxManage createhd --filename '.\64bit\Windows 7 Ultimate SP1 (64bit).vdi' --size 32768 --variant Standard

# Add virtual disk to storage controller
#VBoxManage storageattach $WINDOWS_7_VM --storagectl 'SATA' --port 0 --device 0 --type hdd --medium '.\64bit\Windows 7 Ultimate SP1 (64bit).vdi'

# Add ISO file 
#VBoxManage storageattach $WINDOWS_7_VM --storagectl 'SATA' --port 1 --device 0 --type dvddrive --medium '.\en_windows_7_ultimate_with_sp1_x64_dvd_u_677332.iso'

# Perform unattended install 
#VBoxManage unattended install $WINDOWS_7_VM `
    #--iso='.\en_windows_7_ultimate_with_sp1_x64_dvd_u_677332.iso' `
    #--user=user --password=user `
    #--install-additions --additions-iso='C:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso' `

# Define boot order
#VBoxManage modifyvm $WINDOWS_7_VM --boot1 dvd --boot2 disk --boot3 none --boot4 none

# Start Kali VM
#VBoxManage startvm $WINDOWS_7_VM --type gui

#--------------------------------------------------------------------------------------------------------------------------------------------------------------
# 4. Finish Setup
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
Read-Host -Prompt "Press Enter to exit"