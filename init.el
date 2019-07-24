;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '())
  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/"))  
  (add-to-list 'package-archives
	       '("marmalade" . "https://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("org" . "http://orgmode.org/elpa/") t)
  (add-to-list 'package-archives
	       '("tromey" . "http://tromey.com/elpa/") t)
  )

(package-initialize)

;; keybindings
(global-set-key [f1] 'shell)
;; (global-set-key [f10] 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x C-e") 'eval-buffer)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-x C-r") 'recompile)
(global-set-key (kbd "<C-return>") 'set-mark-command)
;; because I'm dumb
(global-set-key (kbd "C-z") 'undo)
;; this needs to be a thing
(global-set-key (kbd "C-c C-w") 'kill-region)
(global-set-key (kbd "C-;") 'just-one-space)

;; prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))

   (setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(projectile-mode +1)

(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(use-package :visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
	 ("C-c q" . vr/query-replace)
	 ("C-c m" . vr/mc-mark)
	 ("C-c C-r" . vr/isearch-backward)
	 ("C-c C-s" . vr/isearch-forward)))
;; avy
(use-package avy
  :config
  (avy-setup-default)

  :bind (("C-c C-a l" . avy-goto-line)
	 ("C-'" . avy-goto-char-2)
	 ("C-c C-a w" . avy-goto-word-1))
  )

(put 'scroll-left 'disabled nil)

(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'auto-fill-mode)


;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'control)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )

(use-package dap-mode
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (require 'dap-python)
  )


(eval-after-load "org"
  '(require 'ox-gfm nil t))


(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  )











(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/completion.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#fafafa" "#e45649" "#50a14f" "#986801" "#4078f2" "#a626a4" "#0184bc" "#383a42"])
 '(ansi-term-color-vector
   [unspecified "#fdf6e3" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#586e75"])
 '(custom-enabled-themes (quote (doom-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "84da7b37214b4ac095a55518502dfa82633bee74f64daf6e1785322e77516f96" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "99c86852decaeb0c6f51ce8bd46e4906a4f28ab4c5b201bdc3fdf85b24f88518" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "9ce93c9eb0f26697eadc71afb99214fa2c85396f6148ddabf5a8319e667513ae" "bcfc77fcc3e012941eb47d5037f0fac767e23fd2dae039214e5fa856ac8bdfdd" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "1f38fb71e55e5ec5f14a39d03ca7d7a416123d3f0847745c7bade053ca58f043" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "256bd513a9875cd855077162cdfee8d75b0ad7e18fe8b8cbc10412561fbef892" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" default)))
 '(dap-python-executable "~/.virtualenvs/leantaas/bin/python")
 '(debug-on-error t)
 '(display-battery-mode nil)
 '(elpy-autodoc-delay 0.1)
 '(elpy-rpc-python-command "~/.virtualenvs/leantaas/bin/python3")
 '(fancy-battery-mode t)
 '(fci-rule-color "#383a42")
 '(flymake-gui-warnings-enabled nil)
 '(flymake-start-syntax-check-on-newline nil)
 '(global-prettify-symbols-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#f0f0f0" "#4078f2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#f0f0f0" "#50a14f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#f0f0f0" "#9ca0a4"))
 '(lsp-enable-snippet nil)
 '(lsp-prefer-flymake :none)
 '(lsp-pyls-server-command (quote ("~/.virtualenvs/leantaas/bin/pyls")))
 '(objed-cursor-color "#e45649")
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   (quote
    (chess 2048-game magit ox-pandoc ox-gfm base16-theme fancy-battery doom-modeline spaceline-all-the-icons all-the-icons dap-mode helm-lsp helm-projectile py-isort csv-mode ini-mode elpy pyvenv lsp-python company-lsp lsp-ui lsp-mode nlinum spaceline doom-themes rainbow-mode pretty-mode rainbow-delimiters sublimity visual-regexp-steroids use-package helm-swoop helm-dash expand-region avy)))
 '(powerline-height nil)
 '(powerline-text-scale-factor nil)
 '(projectile-mode t nil (projectile))
 '(python-check-command "/Users/nicholasmiklaucic/.virtualenvs/leantaas/bin/flake8")
 '(python-flymake-command (quote ("flake8")))
 '(python-shell-interpreter "~/.virtualenvs/leantaas/bin/python")
 '(pyvenv-activate ~/\.virtualenvs/leantaas/)
 '(pyvenv-mode t)
 '(pyvenv-workon "leantaas")
 '(spaceline-all-the-icons-separator-type (quote wave))
 '(spaceline-helm-mode t)
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50a14f")
    (cons 40 "#688e35")
    (cons 60 "#807b1b")
    (cons 80 "#986801")
    (cons 100 "#ae7118")
    (cons 120 "#c37b30")
    (cons 140 "#da8548")
    (cons 160 "#c86566")
    (cons 180 "#b74585")
    (cons 200 "#a626a4")
    (cons 220 "#ba3685")
    (cons 240 "#cf4667")
    (cons 260 "#e45649")
    (cons 280 "#d2685f")
    (cons 300 "#c07b76")
    (cons 320 "#ae8d8d")
    (cons 340 "#383a42")
    (cons 360 "#383a42")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:inherit helm-selection :weight normal :family "IBM Plex Mono"))))
 '(spaceline-highlight-face ((t (:background "deep sky blue" :foreground "#383838")))))
