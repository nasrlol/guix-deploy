(list (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit
	"79154f0a09ad748839f88120ddd61a0e1e147b5e"))
      ;; don't tell anyone :)
      (channel 
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix.git")
       (introduction
	(make-channel-introduction
	 "897c1a470da759236cc11798f4e0a5f7d4d59fbc"       ;; Enable signature verification
	 (openpgp-fingerprint
	  "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5")))))

