;

; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu))

; TODO: note down what this is used for
(use-service-modules desktop networking ssh xorg)

; used for location stuff i think
(use-package-modules 
		text-editors

;; window manager
		freedesktop
		xdisorg ;; wofi
		wm      ;; waybar
		
;; unix tools
		curl

 		fonts
 		terminals
;; dev
		version-control
 		rust
		llvm
		rust-apps
		c)

(operating-system
  (locale "en_US.utf8")
  (timezone "Europe/Brussels")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "leuven")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
		  (name "nasr")
		  (group "users")
		  (home-directory "/home/nasr")
		  (supplementary-groups '("wheel" "netdev" "audio" "video")))
		%base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "openssh")
			  (specification->package "curl")
			  ;; rust development
			  (specification->package "rust")
			  (specification->package "clang")
			  (specification->package "rust-cargo")

			  ;; neofetch cuz flex
			  (specification->package "neofetch")
			  ;; shell
			  (specification->package "zsh")

			  ;; window manager 
			  ;; (specification->package "river")  
			  (specification->package "hyprland")		;; disabled

			  ;; extra 
			  (specification->package "wofi")
			  (specification->package "waybar")

				

			  (specification->package "seatd")

			  ;; (specification->package "xdg-desktop-portal")

			  ;; windows development
			  (specification->package "make")
			  (specification->package "dbus") ; used for desktop communication? 

			  ;; editors		 
			  (specification->package "neovim") ; TODO: find out how you can upgrade the version
			  (specification->package "vim")
			  (specification->package "vis")

			  (specification->package "emacs")

			  ;; compilers

			  ;; browser
			  ;; (specification->package "surf")

			  ;; crashes because of some error thing
			  ;; (specification->package "librewolf") 
			  (specification->package "icecat") 

		          ;; hacker screen
			  ;; TODO: disabled for now. will compare performance and compatibility against st
			  (specification->package "alacritty")

			  ;; (specification->package "st")
			  (specification->package "tmux")

			  ;; vcs
			  (specification->package "git")) %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.


  (services %desktop-services)

;  (services
;	(append (list (service seatd-service-type))) ; TODO: do i really need tis? what does this even do?
; 	(modify-services %desktop-services
;  		(delete gdm-service-type)
;  		(guix-service-type config => 
;   			(guix-configuration 
;				(inherit config)))))
   



  ;; TODO: replace this with systemd-boot
  (bootloader (bootloader-configuration
		(bootloader grub-efi-bootloader)
		(targets (list "/boot/efi"))
		(keyboard-layout keyboard-layout)))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
			 (mount-point "/")
			 (device (uuid
				   "dd5eac93-c2c7-413b-b4bb-b13d5d0381ce"
				   'ext4))
			 (type "ext4"))
		       (file-system
			 (mount-point "/boot/efi")
			 (device (uuid "81E2-3695"
				       'fat32))
			 (type "vfat")) %base-file-systems)))
