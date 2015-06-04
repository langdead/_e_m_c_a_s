;;http://ann77.emacser.com/Emacs/EmacsSwitchBuffer.html
(require 'wcy-swbuff)

;; then you can use <C-tab> and <C-S-kp-tab> to switch buffer.
(setq wcy-switch-buffer-active-buffer-face  'highlight)
(setq wcy-switch-buffer-inactive-buffer-face  'secondary-selection )
(global-unset-key (kbd "<C-tab>"))
(global-set-key (kbd "C-<tab>") 'wcy-switch-buffer-forward) ;;(kbd "C-<tab>: = [C-tab]
(global-unset-key (kbd "<C-S-iso-lefttab>"))
(global-set-key (kbd "<C-S-iso-lefttab>") 'wcy-switch-buffer-backward)

(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'comment-or-uncomment-region)
;;(global-unset-key "\C-\M-\\")

;;(global-set-key "\M-\\" 'indent-region)
(global-set-key "\C-x\M-e" 'eval-region)

(require 'highlight-symbol)
(global-unset-key (kbd "C-<f3>"))
(global-unset-key (kbd "M-<f3>"))
(global-unset-key (kbd "S-M-<f3>"))
(global-unset-key (kbd "S-<f3>"))

(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [(meta f3)] 'highlight-symbol-prev)
(global-set-key [(shift meta f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-query-replace)

;;**********************        全局按键设定        *********************       
(global-set-key [f3] 'eshell)

(global-set-key [f4] 'kill-this-buffer)
;;[f11] define to maximise present window
;;习惯设置，打开／关闭菜单
(global-set-key [f12] 'menu-bar-mode)


;;移动光标设置
;;(global-set-key [home] 'beginning-of-buffer)
;;(global-set-key [end]  'end-of-buffer)

;;切换buffer的设置
(global-set-key [(control o)] 'other-window)
(global-set-key [(meta tab)] 'tabbar-forward)
