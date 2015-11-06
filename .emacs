
;; color theme 
(add-to-list 'load-path "~/.emacs.d/plugin/themes/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-oswald)

;; grizzl configure
(add-to-list 'load-path "~/.emacs.d/plugin/grizzl/")
(require 'grizzl)

;; Erlang Mode
(setq load-path (cons "/usr/local/erlang/lib/erlang/lib/tools-2.8/emacs" load-path))
(setq erlang-root-dir "/usr/local/erlang/")
(setq exec-path (cons "/usr/local/erlang/bin/" exec-path))
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(require 'erlang-start)

;;yasnippt
(add-to-list 'load-path "~/.emacs.d/plugin/yasnippet/")
(require 'yasnippet)
(setq yas/prompt-functions 
   '(yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
(yas/global-mode 1)
(yas/minor-mode-on) ; 以minor mode打开，这样才能配合主mode使用

;; Distel
(let ((distel-dir "~/.emacs.d/plugin/erlang/distel/elisp/"))
   (unless (member distel-dir load-path)
       (setq load-path (append load-path (list distel-dir)))))
       (require 'distel)
       (distel-setup)


;;(add-to-list 'load-path
;;              "~/.emacs.d/plugin/yasnippet/")
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;

;; auto-complete
;; add some directory
(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/plugin/popup-el/")
(add-to-list 'load-path "~/.emacs.d/plugin/auto-complete/fuzzy-pos-tip/")
;; configure auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	"~/.emacs.d/plugin/auto-complete/dict/")
(ac-config-default)

;; configure pos-tip
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)
;; configure quick help to hit something
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;; configure to use tab
(setq ac-dwim t)

(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

;; configure fuzzy
;;
(setq ac-fuzzy-enable t)


;; set user information
(setq user-full-name "your-name")
(setq user-mail-address "your-email")

;====================================
;  UI
;====================================
;; close startup message
(setq inhibit-startup-message t)

;; transprent window
; (set-frame-parameter (selected-frame) 'alpha (list 70 70))
; (add-to-list 'default-frame-alist (cons 'alpha (list 90 85)))


;; turn on syntax hilight
(global-font-lock-mode t)

;; remove toolbar/menu bar/scroll bar
(tool-bar-mode 0)
;(menu-bar-mode 0)
(set-scroll-bar-mode nil)

;; show clock at statusline
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; show column number in mode line
(setq column-number-mode t)

;; show parent
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; hilight mark area
(transient-mark-mode t)

;; make the title infomation more useful
(setq frame-title-format
      (list "GNU Emacs " emacs-version "@" system-name " - " '(buffer-file-name "%f" "%b")))

;; auto maximize window after emacs startup
; (run-with-idle-timer 0.2 nil 'w32-maximize-frame)
;;(when wttr/os:windowsp
;;  (add-to-list 'emacs-startup-hook #'wttr/w32-maximize-frame))

;===================================
; Control
;===================================
;; don't ring at error
(setq ring-bell-function 'ignore)
(setq visible-bell 'top-bottom)

;; can use the narrow to region
(put 'narrow-to-region 'disabled nil)

;; use mouse to copy thing automatically
(setq mouse-drag-copy-region t)

;; move mouse when cursor is close to it
;(mouse-avoidance-mode 'animate)
(mouse-avoidance-mode 'none)

;; no backup file, and auto save
(setq-default make-backup-files nil)
(setq auto-save-default nil)

;; use y --> yes
(fset 'yes-or-no-p 'y-or-n-p)

;; setup for newline auto-appending support
(setq next-line-add-newline t)

;; encoding
(set-language-environment 'UTF-8)

;; setup up a big kill-ring, so i will never miss anything:-)
;;(setq kill-ring-max 100)
;; we need to paste something from another program, but sometimes we
;; do real paste after some kill action, that will erase the
;; clipboard,so we need to save it to kill ring, here is the setting
;; used to control that
;;(setq save-interprogram-paste-before-kill t)
;;(setq x-select-enable-clipboard nil)
;;(setq select-active-regions 'only)


;; set default mode to text-mode, seems useless.
;(setq-default major-mode 'text-mode)

;; set startup scrach buffer to another mode
;(setq initial-major-mode 'text-mode)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3)))   ;; one line at a time
(setq mouse-wheel-progressive-speed nil)              ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                    ;; scroll window under mouse
(setq scroll-step 1)                                  ;; keyboard scroll one line at a time
(setq scroll-margin 0)                                ;; stop autoscroll when mouse is close to margin

;; not use tab, use space to indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; always split window vertically
(setq split-width-threshold nil)

;; 原理是编辑skeleton-pair-alist，把想要配对的符号列进去。
;; 再使用skeleton-pair-insert-maybe函数进行相应的匹配。
;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist
(setq skeleton-pair-alist
'((?\" _ "\"" >)
(?\' _ "\'" >)
(?\( _ ")" >)
(?\[ _ "]" >)
(?\{ _ "}" >)
(?\{ _ ">" >)
))

(setq skeleton-pair t)

;; 绑定全局键值
;; 也可以绑定单独到某个mode，比如cc-mode (define-key cc-mode-map (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)





