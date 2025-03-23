SSH Configuration
------------------------

***Installation SSH***

        apt install openssh-server

***Important Directories and files***

        /etc/ssh
        ~/.ssh/authorized key
        ~/.ssh/unknown hosts

***Change Listening IP and Port number in this file:***

        /etc/ssh/sshd_config

        >PermitRootLogin:Prohibit-Password
        >PasswordAuthentication yes
        >AllowUsers reza zabbix root
        >AllowGroup reza root

***Commands for configuration SSH:***

        ssh-keygen
        
***Command for check bad configuration:***        

        sshd -t
