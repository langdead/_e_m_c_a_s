;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filename:      .emacs
;;                
;; Copyright (C) 2010, 2015,  admirestator
;; Version:       20110906
;; Author:        admirestator <admirestator#gmail.com>
;; Rerefence:     http://blog.csdn.net/shuxiao9058/article/details/7106467
;; Created at:    Mon Jun 21 15:56:07 2010
;;                
;; Description:   将此文件重命名为".emacs"，并在用户家
;;                目录即可。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;**********************    basic setting    *********************

;;Load_path
(add-to-list 'load-path' "~/.emacs.d/plugins")

;;todo_path
(setq todo-file-do "~/emacs-self/todo/do")
(setq todo-file-done "~/emacs-self/todo/done")
(setq todo-file-top "~/emacs-self/todo/top")

;;Personal information
(setq user-full-name "langdead")
(setq user-mail-address "langdead#163.com") 
(setq indent-size 2)


;;======================    time setting        =====================
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
;; (display-time-mode 1)

;; ;;时间使用24小时制
;; (setq display-time-24hr-format t)

;; ;;时间显示包括日期和具体时间
;; (setq display-time-day-and-date t)

;; ;;时间栏旁边启用邮件设置
;; (setq display-time-use-mail-icon t)

;; ;;时间的变化频率
;; (setq display-time-interval 10)

;; ;;显示时间，格式如下
;; (display-time-mode 1)
;; (setq display-time-24hr-format t)
;; (setq display-time-day-and-date t) 
;;----------------------    END    time setting    ---------------------


;;======================    color setting        =====================
;; 指针颜色设置为白色
(set-cursor-color "purple")
;; 鼠标颜色设置为白色
;;(set-mouse-color "white")
;; 设置背景颜色和字体颜色
;;(set-foreground-color "white")
;;(set-background-color "darkblue")
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;设置日历的一些颜色
;; (setq calendar-load-hook
;; '(lambda ()
;; (set-face-foreground 'holiday-face "skyblue")
;; (set-face-background 'holiday-face "slate blue")
;; (set-face-foreground 'holiday-face "white")))

;;-------------------------Shell 使用 ansi color-------------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;----------------------    END    color setting    ---------------------

;;(setq frame-title-format
;;      (list (format "%s %%S: %%j " (system-name))
;;	    '(buffer-file-name "%f" (dired-directory dired-directory
;;						     "%b"))))


;;设置emacs启动窗口大小
;;(setq default-frame-alist 
;;'((height . 32) (width , 50) (menu-bar-lines . 20) (tool-bar-lines . 0))) 
;;隐藏工具栏
;;(tool-bar-mode nil) 

;;去掉菜单栏，将F12绑定为显示菜单栏，需要菜单栏了可以摁F12调出，再摁F12就去掉菜单
;;(menu-bar-mode nil)

;; 隐藏滚动条。实际上emacs-nox是没有这个模式的。
;;(scroll-bar-mode nil) 

(server-start)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'sr-speedbar);;这句话是必须的
(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)))
;;开启程序即启用

(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 20)
(setq sr-speedbar-right-side nil)

(global-set-key (kbd "C-S-s") (lambda()
			       (interactive)
			       (sr-speedbar-toggle)))


;;Font
;;(set-default-font "10x20")
;;(set-default-font "STHeiti-10")
(set-default-font "Droid Sans Mono-10")

;;(add-to-list 'default-frame-alist '(font . "STHeiti-10"))
(add-to-list 'default-frame-alist '(font . "Droid Sans Mono-10"))

;;不要生成临时文件
(setq-default make-backup-files nil)

;;设置中文语言环境
;;(set-language-environment 'Chinese-GB)

;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
(set-buffer-file-coding-system 'utf-8)

;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)

;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)

;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312) 
(set-keyboard-coding-system 'utf-8) 
    
;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8) 

;;打开就启用 text 模式
(setq default-major-mode 'text-mode)

;;禁用启动信息
(setq inhibit-startup-message t) 

;; 取消自动保存
;; (auto-save-mode 0)

;;语法高亮
(global-font-lock-mode t) 

;;把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)


;;打开图片显示功能
(auto-image-file-mode t) 

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿
;;3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
       scroll-conservatively 10000)

;;关闭烦人的出错时的提示声。
(setq visible-bell t)

;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;显示行列号
(column-number-mode t) 

;;显示列号
(setq mouse-yank-at-point t)


;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。
(setq kill-ring-max 200)

;;显示括号匹配
(show-paren-mode t) 

;;光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate) 
    
;;不要在鼠标光标出插入
(setq mouse-yank-at-point t) 
    
;;高亮显示选中的区域
(transient-mark-mode t) 
    
;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t) 

;;langdead
;;在标题栏提示当前位置
;;(setq frame-title-format "Fiona@%b")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;;显示80列就换行
;;(add-hook 'message-mode-hook (lambda ()
;;(setq default-fill-column 80) 
;;(turn-on-auto-fill)))


;;禁止终端响铃
;;(setq visiable-bell t) 
    
;;设置tab为4个空格的宽度
(setq default-tab-width 'indent-size)

;;设置一下备份时的版本控制，这样更加安全。
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)



;;设置备份时的版本控制，这样更加安全。
(mapcar
  (function (lambda (setting)
                     (setq auto-mode-alist
                               (cons setting auto-mode-alist))))
   '(("\\.xml" .  sgml-mode)
     ("\\.bash" . sh-mode)
     ("\\.rdf" .  sgml-mode)
     ("\\.session" . emacs-lisp-mode)
     ("\\.l" . c-mode)
     ("\\.css" . css-mode)
     ("\\.cfm" . html-mode)
     ("gnus" . emacs-lisp-mode)
     ("\\.idl" . idl-mode)))


     
;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)

;;去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)

;;设置time-stamp的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>
(setq time-stamp-format "%:u /%04y%02m/%02d %02H02M02S")

;;将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;;光标显示为一竖线
;;(setq-default cursor-type 'bar)

;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

;;用aspell程序作为Emacs的拼写检查
(setq-default ispell-program-name "aspell")

;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled nil)

;;启动Emacs自动设置为两个窗口(上下各一个)
;;(split-window-horizontally)
;;(split-window-vertically)

;;功能是将当前行设为本页第一行，同终端下的clear命令有点相似
(defun line-to-top-of-window () 
"Move the line point is on to top of window." 
(interactive) 
(recenter 0)) 

;;代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'cperl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode) 


;;======================        Chinese setting        =====================   
;;(setq gnus-default-charset 'cn-gb-2312
;;gnus-group-name-charset-group-alist '((".*" . gb2312))
;;gnus-summary-show-article-charset-alist '((1 . cn-gb-2312) (2 . big5) (3 . chinese-gbk) (4 . utf-8))
;;gnus-newsgroup-ignored-charsets '(unknown-8bit x-unknown iso-8859-1)
;;gnus-group-posting-charset-alist '((".*" gb2312 (gb2312))))
;;(define-coding-system-alias 'gb18030 'gb2312)

;;------------设置(utf-8)模式------------
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t) ;;´¦Àshell-modeÂÂ,ºÃñ÷[M`J3

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;----------------------        End Chinese setting        ---------------------


;;======================    字体解码优先顺序         =====================;
;;从王垠那拷过来的，不用怎么再改吧。
;;(setq font-encoding-alist
;;(append '(("MuleTibetan-0" (tibetan . 0))
;;("GB2312" (chinese-gb2312 . 0))
;;("JISX0208" (japanese-jisx0208 . 0))
;;("JISX0212" (japanese-jisx0212 . 0))
;;("VISCII" (vietnamese-viscii-lower . 0))
;;("KSC5601" (korean-ksc5601 . 0))
;;("MuleArabic-0" (arabic-digit . 0))
;;("MuleArabic-1" (arabic-1-column . 0))
;;("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist))
;;----------------------    字体解码优先顺序        ---------------------       

(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip nil)

(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "pingyin" "hanzipingyinshurufa" "py.txt")

(add-to-list 'load-path"~/.emacs.d/plugins/emacs-eim")
;; use ';' to input english temporarily
(require 'eim-extra)
(global-set-key (kbd "C-;") 'eim-insert-ascii)



;;无论在什么样的主模式下都打开auto-fill模式
(setq-default auto-fill-function 'do-auto-fill)



;;将文件模式和文件后缀关联起来。append表示追加
(
setq auto-mode-alist
    ( append 
        '(("\\.py\\'" . python-mode)
        ("\\.s?html?\\'" . html-helper-mode)
        (" \\.asp\\'" . html-helper-mode)
        ("\\.phtml\\'" . html-helper-mode)
        ("\\.css\\'" . css-mode)
        ("\\.pc" . c-mode)
     )
auto-mode-alist))

;;窗口设置
;;(gnus-add-configuration '(article (vertical 1.0 (summary .35 point) (article1.0))))

;;Group Buffer设置
;;自动进入Topic-mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;;Sumarry Buffer设置
(setq gnus-summary-line-format ":%U%R %B %s %-60=|%4L |%-20,20f |%&user-date; \n")

;;Article Buffer设置
;;设定要显示的头消息格式
(setq gnus-visible-headers
"^\\(^To:\\|^CC:\\|^From:\\|^Subject:\\|^Date:\\|^Followup-To:
\\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
\\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

;; session.el
(add-to-list 'load-path"~/.emacs.d/plugins/session/lisp")
(require 'session)
    (add-hook 'after-init-hook 'session-initialize)





;;鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)


;;约会提醒
(setq appt-issue-message t)


;;自定义自动补齐命令，这部分是抄hhuu的，如果在单词中间就补齐，否则就是tab。
(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
  )
(global-unset-key (kbd "<S-iso-lefttab>"))
(global-set-key (kbd "<S-iso-lefttab>") 'my-indent-or-complete)


(require 'list-utils)

;;;load self extended samll modes
(load "global-bind-langdead.el")
(load "c-cpp-langdead.el")
(load "edit-langdead.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FROM THE OpenSUSE11.3;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '    
;;; ---------------------
;;;
;;; If you need your own personal ~/.emacs
;;; please make a copy of this file
;;; an placein your changes and/or extension.
;;;
;;; Copyright (c) 1997-2002 SuSE Gmbh Nuernberg, Germany.
;;;
;;; Author: Werner Fink, <feedback@suse.de> 1997,98,99,2002
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Test of Emacs derivates
;;; -----------------------
(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (progn
     (if (file-readable-p "~/.xemacs/init.el")
        (load "~/.xemacs/init.el" nil t))
  )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
    (load "/etc/skel/.gnu-emacs" nil t)))

  ;; Custom Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
  (setq custom-file "~/.gnu-emacs-custom")
  (load "~/.gnu-emacs-custom" t t)
;;;
)
;;;



;;======================            自动补全功能       =====================
;;自动补全功能，这事从王垠的网站直接Copy过来的，引用一些他对此的说明
;;设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面
;;的函数来补全这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如
;;还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表
;;里，到list，当前使用的匹配方式会在 echo 区域显示。
;;特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相
;;同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后
;;多按几下 M-/ 就能得到那一行。

;;hippie的自动补齐策略，优先调用了senator的分析结果：
(autoload 'senator-try-expand-semantic "senator")

(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(
    senator-try-expand-semantic    
    try-expand-line
    try-expand-line-all-buffers
    try-expand-list
    try-expand-list-all-buffers
    try-expand-dabbrev
    try-expand-dabbrev-visible
    try-expand-dabbrev-all-buffers
    try-expand-dabbrev-from-kill
    try-complete-file-name
    try-complete-file-name-partially
    try-complete-lisp-symbol
    try-complete-lisp-symbol-partially
    try-expand-whole-kill))


                

;;----------------------            End 自动补全        --------------------- 


;;======================            拷贝代码自动格式化          =====================
;;Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，还可以选中一块代码，
;;按 Ctrl-Alt-\ 对这块代码重新进行格式化.如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\,
;;就可以把新加入的代码格式化好。可是，对于这种粘贴加上重新格式化的机械操作，Emacs 应该可以将
;;它自动化才能配得上它的名气，把下面的代码加到配置文件里，你的 Emacs 就会拥有这种能力了
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(
                     c-mode
                     c++-mode
                     clojure-mode
                     emacs-lisp-mode
                     haskell-mode
                     js-mode
                     latex-mode
                        lisp-mode
                     objc-mode
                     perl-mode
                     cperl-mode
                     plain-tex-mode
                     python-mode
                     rspec-mode
                        ruby-mode
                     scheme-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

;;----------------------            End 拷贝代码自动格式化        --------------------- 
