;; nasr guix home configuration
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (guix gexp)
  #:use-module (gnu packages))

(define %default-dotguile
  (plain-file "dotguile" ";; Guile REPL configuration\n(use-modules (ice-9 readline))\n(activate-readline)\n"))

(define %default-xdefaults
  (plain-file "xdefaults" "*background: #000000\n*foreground: #ffffff\n"))

(define %default-nvim
  (plain-file "init.lua" ""))

(define %default-zshrc
  (local-file "./dot/zshrc")


(home-environment
 (packages (list (specification->package "icecat")  ;; TODO: find a new browser
                 (specification->package "alacritty")
                 (specification->package "tmux")
                 (specification->package "git")
                 (specification->package "neofetch")
                 (specification->package "rust")
                 (specification->package "clang")))
 (services
  (list
   (service home-zsh-service-type)
   (service home-xdg-configuration-files-service-type
              ("zsh/zshrc" ,%default-zshrc)
              ("nvim/init.lua" ,%default-nvim))))))
