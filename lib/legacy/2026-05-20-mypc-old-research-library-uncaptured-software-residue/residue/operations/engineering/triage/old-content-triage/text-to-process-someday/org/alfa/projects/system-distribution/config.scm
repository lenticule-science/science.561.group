(use-modules (gnu))
(use-service-modules desktop networking ssh web xorg)
(operating-system

(locale "en_US.utf8")
(timezone "America/New_York")

(keyboard-layout
  (keyboard-layout "us" "altgr-intl"))

(bootloader
  (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (target "/boot/efi")
    (keyboard-layout keyboard-layout)))

(swap-devices (list "/dev/sda3"))
(file-systems
  (cons* (file-system
	   (mount-point "/boot/efi")
	   (device (uuid "214B-C78E" 'fat32))
	   (type "vfat"))
	 (file-system
	   (mount-point "/")
	   (device
	     (uuid "37b12731-a468-4816-8ee9-c2cd60cfb5c4"
		   'ext4))
	   (type "ext4"))
	 (file-system
	   (mount-point "/home")
	   (device
	     (uuid "ff0462cf-d04a-4228-8678-37cc006bd798"
		   'ext4))
	   (type "ext4"))
	 %base-file-systems))

(host-name "ack")

(users (cons* (user-account
		(name "emsenn")
		(comment "emsenn")
		(group "users")
		(home-directory "/home/emsenn")
		(supplementary-groups
		  '("wheel" "netdev" "audio" "video")))
	      %base-user-accounts))

(packages
  (append
    (list (specification->package "nss-certs"))
    %base-packages))

(services
  (append
    (list (service mate-desktop-service-type)
	  (service openssh-service-type)
	  (service nginx-service-type
		   (nginx-configuration
		    (server-blocks
		     (list (nginx-server-configuration
			    (listen '("80"))
			    (server-name '("emsenn.net"))
			    (root "/srv/http/emsenn.net")
			    (ssl-certificate #f)
			    (ssl-certificate-key #f))))))
	  (set-xorg-configuration
	   (xorg-configuration
	    (keyboard-layout keyboard-layout))))
    %desktop-services)))
