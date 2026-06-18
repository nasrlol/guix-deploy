;; nasr guix linux home configuration
;; setup dot files. dev env. etc.

(define %system-mode 'desktop)
(define %system-mode 'server)


(define-module (guix-home-config)

  ;; TODO: find out what the home stuff does

  ;; home stuff I guess
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells) ;; used for shell enviroment ( example. zsh, bash, fish, ...) 


  ;; non home stuff i guess
  #:use-module (gnu services)
  #:use-module (gnu system shadow)) ;; TODO: find out what this does


(define home-config
  (home-environment
   (services
    (append
     (list
      (service home-zsh-service-type)
      

      (service home-files-service-type
               `((".guile" ,%default-dotguile)
		 (".Xdefaults" ,%default-xdefaults)))

      (service home-xdg-configuration-files-service-type
               `(("gdb/gdbinit" ,%default-gdbinit)
		 ("nano/nanorc" ,%default-nanorc))))

     (service 

     %base-home-services))))


  
