;; (require 'cc-mode)
;; ;;(load-file
;; (require 'cedet)
;; (require 'semantic)
;; (require 'ecb)
;; (global-ede-mode 1)
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)

;; (require 'xcscope)
;; (require 'yasnippet)
;; (yas-global-mode 1)



;; ;;(semantic-load-enable-minimum-features)
;; ;;(semantic-load-enable-code-helpers)--
;; ;;(semantic-load-enable-guady-code-helpers)
;; ;;(semantic-load-enable-excessive-code-helpers)
;; ;;(semantic-load-enable-semantic-debugging-helpers)--
;; ;; (setq semanticdb-project-roots (list (expand-file-name "/")))
;; (autoload 'senator-try-expand-semantic "senator")

;; (setq hippie-expand-try-functions-list
;;       '(
;;         senator-try-expand-semantic
;;         try-expand-dabbrev
;;         try-expand-dabbrev-visible
;;         try-expand-dabbrev-all-buffers
;;         try-expand-dabbrev-from-kill
;;         try-expand-list
;;         try-expand-list-all-buffers
;;         try-expand-line
;;         try-expand-line-all-buffers
;;         try-complete-file-name-partially
;;         try-complete-file-name
;;         try-expand-whole-kill
;;         )
;; 			)

;; (setq semanticdb-project-roots 
;;       (list
;; 			 (expand-file-name "/")))

;; (defun my-indent-or-complete ()
;; 	(interactive)
;; 	(if (looking-at "\\>")
;;       (hippie-expand nil)
;; 		(indent-for-tab-command))
;; 	)

;; ;;(global-unset-key "\M-\\")
;; ;;(global-set-key "\M-\\" 'my-indent-or-complete)

;; (defconst cedet-user-include-dirs
;;   (list "." ".." "../include" "../inc" "../common" "../public"
;;         "../.." "../../include" "../../inc" "../../common" "../../public" "/usr/local/"))
;; (defconst cedet-linux-include-dirs
;;   (list "/usr/include" "/usr/local/include"))
;; (defconst cedet-win32-include-dirs
;;   (list "C:/MinGW/include"
;;         "C:/MinGW/include/c++/3.4.5"
;;         "C:/MinGW/include/c++/3.4.5/mingw32"
;;         "C:/MinGW/include/c++/3.4.5/backward"
;;         "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;;         "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
;; (require 'semantic-c nil 'noerror)
;; (let ((include-dirs cedet-user-include-dirs))
;;   (when (eq system-type 'windows-nt)
;;     (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
;;   (when (eq system-type 'gnu/linux)
;;     (setq include-dirs (append include-dirs cedet-linux-include-dirs)))
;;   (mapc (lambda (dir)
;;           (semantic-add-system-include dir 'c++-mode)
;;           (semantic-add-system-include dir 'c-mode))
;;         include-dirs))

;;###########     CC-mode配置  http://cc-mode.sourceforge.net/     ################
;;add-to-list 'load-path "~/.emacsd/cc-mode-5.31.3")
;; Use cperl mode instead of the default perl mode
;;(defalias 'c++-mode 'c-version)
(add-to-list 'load-path "~/.emacs.d/plugins/cc-mode-5.31.3")


(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

(setq indent-tabs-mode nil)
(setq c-basic-offset 'indent-size )
(setq default-tab-width 'indent-size)



;;Create MyCppStyle
(defconst MyCppStyle
'((c-tab-always-indent . t)
   ;; (c-comment-only-line-offset . 0)
        (c-hanging-braces-alist . ((substatement-open after)
                                              (brace-list-open)))
        (c-cleanup-list . (comment-close-slash
                                 compact-empty-funcall))
    (c-offsets-alist . ((substatement-open . 0)
                                                (innamespace . 0)                           ;;在namespace中不缩进
                                                (case-label      . +)                          ;;case标签缩进一个c-basic-offset单位
                                                (access-label . -)                             ;;private/public等标签少缩进一单位
                                             ;;   (inline-open . 0)                             ;;在.h文件中写函数，括号不缩进
                                                (block-open     . 0)))                       ;;在一个新块开始时不缩进
;;    (c-echo-syntactic-information-p t)
        (setq comment-start "/*"
                  comment-end "*/")
    (setq indent-tabs-mode nil))
    "My Cpp Coding Style")
(c-add-style "MyCppStyle" MyCppStyle)                   ;;定义完自己的style，将其添加到cc-mode的style中。


;;Define own hook
(defun MyCppHook ()
(setq indent-tabs-mode nil)
(setq global-hl-line-mode t)
(c-set-style "MyCppStyle"))                                   ;;设置这个hook对应于MyCppStyle
(add-hook 'c++-mode-hook 'MyCppHook)                ;;将此hook应用于所有的c++模式。


 ;; 最后，可以设置对于不同的文件绑定不同的模式，可以用以下语句实现：
;;set *.h and *.c and *.cpp files use c++ mode
(setq auto-mode-alist
      (cons '("\\.h" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cpp" . c++-mode) auto-mode-alist))


;;输入左边的括号，就会自动补全右边的部分.包括(), '', [] , {} ,""
 (defun my-c-mode-auto-pair ()
      (interactive)
        (make-local-variable 'skeleton-pair-alist)
          (setq skeleton-pair-alist '(
                      (?` ?` _ "''")
                      (?\( _ ")")
                      (?\[ _ "\]")
;;                      (?{ \n > _ \n ?} >)
                      (?\" _ "\"")))
    (setq skeleton-pair t)
          (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;          (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
          (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
          (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
          (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe))
   (add-hook 'c-mode-hook 'my-c-mode-auto-pair)
   (add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;    (add-hook 'cperl-mode-hook 'my-c-mode-auto-pair)
;;    (add-hook 'perl-mode-hook 'my-c-mode-auto-pair)    


;;默认Linux内核编程风格，取自Linux内核说明文档                       

(setq auto-mode-alist 
			(cons '("/usr/src/linux.*/.*\\.[ch]" . linux-c-mode)  auto-mode-alist))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."  
  (interactive)                                                           
  (c-mode)                                                               
   (c-set-style "K&R")                                                    
   (setq tab-width 'indent-size) ;;默认风格是8个缩进                                 
   (setq indent-tabs-mode t)                                            
   (setq c-basic-offset 'indent-size))  ;;默认风格是8个缩进            


;;c-mode或cc-mode下缩进只有4格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "Stroustrup")))


;;_____________C______________
;;C预处理设置                                                               
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "c")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq abbrev-mode t)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)




;;___________CPP______________
;;CPP预处理设置
(setq c-macro-shrink-window-flag t)
(setq c-macro-preprocessor "cpp")
(setq c-macro-cppflags " ")
(setq c-macro-prompt-flag t)
(setq abbrev-mode t)
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;;下面这句是自动换行
;;(c-toggle-auto-hungry-state 1)                                            
;;(c-set-style "stroustrup")
;;(add-hook 'c-mode-common-hook 'program-mode)
;;(add-hook 'c++-mode-common-hook 'program-mode)



;;**********************            常用编程插件                 *********************


;;======================            google-c-style        =====================
(load-file "~/.emacs.d/plugins/google-styleguide/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;----------------------        END    google-c-style        ---------------------




;;======================            auto-header            =====================
(add-to-list 'load-path "~/.emacs.d/plugins/minors")
;;加载auto-header.el文件,自动添加文件头
(require 'auto-header)

;; 设置文件头中的姓名
(setq header-full-name "langdead")

;; 设置邮箱
(setq header-email-address "langdead#163.com")

;; 设置每次保存时要更新的项目
(setq header-update-on-save
    '(  filename
        modified
        counter
        copyright))
;; 设置文件头的显示格式
(setq header-field-list
'(  filename  ;文件名
;;    blank     ;空行，下同
    ;;copyright ;;版权
    version
    author    ;作者
    created   ;创建人
;;blank
    description   ;描述
    ;;blank
    ;;modified_by ;更改者
   ;; blank
    ;;status  ;状态，是否发布
    ;;更新
    ;;blank
  ))
;;----------------------        END    auto-header            ---------------------




;;======================            Load cedet            =====================
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/plugins/cedet-bzr/cedet-devel-load.el")

(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
(semantic-mode 1)

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)
;;----------------------            END cedet                ---------------------


;;langdead temp
;; ;;======================            Load ecb                =====================
(add-to-list 'load-path "~/.emacs.d/plugins/ecb-master")
(require 'ecb)
;;(require 'ecb-autoloads)
;; ;;打开emacs，然后M-x ecb-activate即可打开ecb。
;; ;;----------------------            END    ecb                ---------------------




;;======================            Load cscope                =====================
(add-to-list 'load-path "~/.emacs.d/plugins/cscope-15.8a/contrib/xcscope/")
(require 'xcscope)
;;如果工程十分庞大，即使是判断文件更新与否也很费时，可以告诉 Emacs 别自 动更新 cscope.out：
;;(setq cscope-do-not-update-database t)
;;先M-x !，然后cscope -b，之后就可以在源代码中进行跳转了。命令见cscope菜单
;;这里有篇讲怎么在emacs下安装和使用cscope的：
;;http://ann77.stu.cdut.edu.cn/EmacsCscope.html
;;----------------------              END    cscop                ---------------------





;;======================            Load color-theme            =====================
;;配色方案
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
 (require 'color-theme)
     ;;(color-theme-initialize)
     ;;(color-theme-comidia)
     ;;(color-theme-midnight)
     ;;(color-theme-renegade)
     ;;-->(color-theme-taming-mr-arneson)
    ;;     (color-theme-dark-laptop)      
     ;;(color-theme-calm-forest)
;;----------------------            END    color-theme            ---------------------



;;======================            `Load gdb-many-window            =====================
;;gdb-many-window
;;这个功能插件可以使emacs的调试界面像VC一样，有watch, stacktrace等窗口，真正实现图形化gdb.
;;在emacs中编译好程序，然后M-x gdb，连按两次ret，多窗口gdb就出来了
;;http://www.inet.net.nz/~nickrob/multi-gud.el
;;http://www.inet.net.nz/~nickrob/multi-gdb-ui.el

(add-to-list 'load-path"~/.emacs.d/plugins")
(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")
;;----------------------                END    gdb-many-window            ---------------------





;;======================            Load linum                 =====================
;;调用linum.el(line number)来显示行号：
;;(add-to-list 'load-path"~/.emacs.d/plugins")
(require 'linum)
(global-linum-mode 1)
;;----------------------            END    linum                ---------------------



;;======================            Load Doxymacs                  =====================
;;(require 'doxymacs) 

;;(add-hook 'c-mode-common-hook 'doxymacs-mode)

;;(defun my-doxymacs-font-lock-hook ()
;;(if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;  (doxymacs-font-lock)))
;;  (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;  This will add the Doxygen keywords to c-mode and c++-mode only.
;;- Default key bindings are:
;;  - C-c d ? will look up documentation for the symbol under the point.
;;  - C-c d r will rescan your Doxygen tags file.
;;  - C-c d f will insert a Doxygen comment for the next function.
;;  - C-c d i will insert a Doxygen comment for the current file.
;;  - C-c d ; will insert a Doxygen comment for the current member.
;;  - C-c d m will insert a blank multi-line Doxygen comment.
;;  - C-c d s will insert a blank single-line Doxygen comment.
;; - C-c d @ will insert grouping comments around the current region.


;;----------------------            END    Doxymacs                ---------------------


;;======================            Load yasnippet                =====================
;;自动补全代码插件
(add-to-list 'load-path"~/.emacs.d/plugins/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)

;;(require 'yasnippet-bundle) ;; not yasnippet-bundle
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/plugins/")

;; (require 'dropdown-list)
;;       (setq yas/prompt-functions '(yas/dropdown-prompt
;;              yas/ido-prompt
;;              yas/completing-prompt))
;;langdead
;;(yas-global-mode 1)
;;----------------------            END    yasnippet            ---------------------

(global-unset-key [S-f2])
(global-unset-key [C-S-f2])
(global-unset-key [f2])
;;jump to the definition of the function of the curse.
(global-set-key [f2] 'semantic-ia-fast-jump)
;;jump back to the last position of the curse
(global-set-key [S-f2]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))
;;doesn't work
;;toggle between method declaration and definition
(define-key c-mode-base-map [C-S-f2] 'semantic-analyze-proto-impl-toggle)
;;auto completion.
;;doesn't work

(global-ede-mode t)
(enable-visual-studio-bookmarks)
;;switch between h and cpp
(require 'eassist nil 'noerror)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))
(define-key c-mode-base-map [C-f2] 'eassist-switch-h-cpp)

(add-to-list 'load-path "~/.emacs.d/plugins/cedet-bzr/contrib")
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
(define-key semantic-tag-folding-mode-map (kbd "C-c }") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c {") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c ]") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-c [") 'semantic-tag-folding-show-all)

(defun my-gud-style ()
  ;; breakpoints
  (global-unset-key (kbd "C-<f3>"))
  (global-unset-key [f5])
  (global-unset-key (kbd "S-f5"))
  (global-unset-key (kbd "C-<f5>"))	
  (global-unset-key [f7])
  (global-unset-key [f8])
  (global-unset-key [f9])  
  (global-unset-key [f10])
  ;;(global-unset-key [f12])
  (global-unset-key (kbd "C-<f7>"))
  (global-unset-key (kbd "M-<f7>"))
  (global-unset-key (kbd "S-<f7>"))

  (global-unset-key (kbd "C-<f8>"))
  (global-unset-key (kbd "M-<f8>"))
  (global-unset-key (kbd "S-<f8>"))

  (global-unset-key (kbd "C-<f9>"))
  (global-unset-key (kbd "M-<f9>"))
  (global-unset-key (kbd "C-<f10>"))
  
  (global-set-key [C-f3] 'speedbar)
  (global-set-key [f5] 'gdb)
  (global-set-key [C-f5] 'gud-go)
  ;;启动窗口gdb
  (global-set-key [S-f5] 'gdb-many-windows)

  (global-set-key [f6] 'gud-watch)
  (global-set-key [M-f6] 'gud-print)
  (global-set-key [C-f6] 'previous-error)
  (global-set-key [S-f6] 'next-error)

  (global-set-key [f7] 'gud-next)
  (global-set-key [C-f7] 'gud-nexti)
  
  (global-set-key [f8] 'gud-step)
  (global-set-key [C-f8] 'gud-stepi)
  (global-set-key [S-f8] 'gud-finish)
  (global-set-key [M-f8] 'gud-until)

  (global-set-key [M-f9] 'gud-remove)
  (global-set-key [C-f9] 'gud-remove)
  (global-set-key [f9] 'gud-break)
  )

(defun my-gud-new-style ()
  ;; breakpoints
  (global-set-key [f5] 'gdb)
  (global-set-key [C-f5] 'gud-go)
  ;;启动窗口gdb
  (global-set-key [S-f5] 'gdb-many-windows)

  (global-set-key [f6] 'gud-watch)
  (global-set-key [M-f6] 'gud-print)
  (global-set-key [C-f6] 'previous-error)
  (global-set-key [S-f6] 'next-error)

  (global-set-key [f7] 'gud-next)
  (global-set-key [C-f7] 'gud-nexti)
  
  (global-set-key [f8] 'gud-step)
  (global-set-key [C-f8] 'gud-stepi)
  (global-set-key [S-f8] 'gud-finish)
  (global-set-key [M-f8] 'gud-until)

  (global-set-key [M-f9] 'gud-remove)
  (global-set-key [C-f9] 'gud-remove)
  (global-set-key [f9] 'gud-break)
  )

(defun my-gud-c-base-style ()
  ;; breakpoints
  (define-key c-mode-base-map (kbd "C-<f3>") nil)
  (define-key c-mode-base-map [f5] nil)
  (define-key c-mode-base-map (kbd "S-f5") nil)
  (define-key c-mode-base-map (kbd "C-<f5>") nil)	
  (define-key c-mode-base-map [f7] nil)
  (define-key c-mode-base-map [f8] nil)
  (define-key c-mode-base-map [f9] nil) 
  (define-key c-mode-base-map [f10] nil)
  ;;(define-key c-mode-base-map [f12] nil)
  (define-key c-mode-base-map (kbd "C-<f7>") nil)
  (define-key c-mode-base-map (kbd "M-<f7>") nil)
  (define-key c-mode-base-map (kbd "S-<f7>") nil)

  (define-key c-mode-base-map (kbd "C-<f8>") nil)
  (define-key c-mode-base-map (kbd "M-<f8>") nil)
  (define-key c-mode-base-map (kbd "S-<f8>") nil)

  (define-key c-mode-base-map (kbd "C-<f9>") nil)
  (define-key c-mode-base-map (kbd "M-<f9>") nil)
  (define-key c-mode-base-map (kbd "C-<f10>") nil)
  
  (define-key c-mode-base-map [C-f3] 'speedbar)
  (define-key c-mode-base-map [f5] 'gdb)
  (define-key c-mode-base-map [C-f5] 'gud-go)
  ;;启动窗口gdb
  (define-key c-mode-base-map [S-f5] 'gdb-many-windows)

  (define-key c-mode-base-map [f6] 'gud-watch)
  (define-key c-mode-base-map [M-f6] 'gud-print)
  (define-key c-mode-base-map [C-f6] 'previous-error)
  (define-key c-mode-base-map [S-f6] 'next-error)

  (define-key c-mode-base-map [f7] 'gud-next)
  (define-key c-mode-base-map [C-f7] 'gud-nexti)
  
  (define-key c-mode-base-map [f8] 'gud-step)
  (define-key c-mode-base-map [C-f8] 'gud-stepi)
  (define-key c-mode-base-map [S-f8] 'gud-finish)
  (define-key c-mode-base-map [M-f8] 'gud-until)

  (define-key c-mode-base-map [M-f9] 'gud-remove)
  (define-key c-mode-base-map [C-f9] 'gud-remove)
  (define-key c-mode-base-map [f9] 'gud-break)
  )

(defun my-gud-c++-style ()
  ;; breakpoints
  (define-key c++-mode-map (kbd "C-<f3>") nil)
  (define-key c++-mode-map [f5] nil)
  (define-key c++-mode-map (kbd "S-f5") nil)
  (define-key c++-mode-map (kbd "C-<f5>") nil)	
  (define-key c++-mode-map [f7] nil)
  (define-key c++-mode-map [f8] nil)
  (define-key c++-mode-map [f9] nil) 
  (define-key c++-mode-map [f10] nil)
  ;;(define-key c++-mode-map [f12] nil)
  (define-key c++-mode-map (kbd "C-<f7>") nil)
  (define-key c++-mode-map (kbd "M-<f7>") nil)
  (define-key c++-mode-map (kbd "S-<f7>") nil)

  (define-key c++-mode-map (kbd "C-<f8>") nil)
  (define-key c++-mode-map (kbd "M-<f8>") nil)
  (define-key c++-mode-map (kbd "S-<f8>") nil)

  (define-key c++-mode-map (kbd "C-<f9>") nil)
  (define-key c++-mode-map (kbd "M-<f9>") nil)
  (define-key c++-mode-map (kbd "C-<f10>") nil)
  
  (define-key c++-mode-map [C-f3] 'speedbar)
  (define-key c++-mode-map [f5] 'gdb)
  (define-key c++-mode-map [C-f5] 'gud-go)
  ;;启动窗口gdb
  (define-key c++-mode-map [S-f5] 'gdb-many-windows)

  (define-key c++-mode-map [f6] 'gud-watch)
  (define-key c++-mode-map [M-f6] 'gud-print)
  (define-key c++-mode-map [C-f6] 'previous-error)
  (define-key c++-mode-map [S-f6] 'next-error)

  (define-key c++-mode-map [f7] 'gud-next)
  (define-key c++-mode-map [C-f7] 'gud-nexti)
  
  (define-key c++-mode-map [f8] 'gud-step)
  (define-key c++-mode-map [C-f8] 'gud-stepi)
  (define-key c++-mode-map [S-f8] 'gud-finish)
  (define-key c++-mode-map [M-f8] 'gud-until)

  (define-key c++-mode-map [M-f9] 'gud-remove)
  (define-key c++-mode-map [C-f9] 'gud-remove)
  (define-key c++-mode-map [f9] 'gud-break)
  )



;; The One True Indenting Style
(defun my-c-mode-common-hook ()  
;;  (setq c-basic-offset 3)
  (c-set-style "linux")
;;  (cc-set-style "ellemtel")
  (setq c-basic-offset 2)
  (setq compilation-scroll-output t)
  (setq compilation-window-height 30)

;;  (define-key c-mode-base-map "\M-\?" 'my-indent-or-complete)
  (define-key c-mode-base-map "\M-\\" 'semantic-ia-complete-symbol-menu)
  (define-key c-mode-base-map (kbd "M-C-\\") 'semantic-ia-complete-symbol)


  (local-unset-key "\C-c\C-c")
  (local-set-key "\C-c\C-c" 'compile)
  (setq-default compile-command "make -k")
  (local-unset-key "\C-c\C-d")
  (local-set-key "\C-c\C-d" 'gdb)
  
  (define-abbrev c++-mode-abbrev-table "iif"
    "" 'c++-skeleton-if)
  (define-abbrev c++-mode-abbrev-table "iife"
    "" 'c++-skeleton-if-else)
  (define-abbrev c++-mode-abbrev-table "ifor"
    "" 'c++-skeleton-for)
  (define-abbrev c++-mode-abbrev-table "itp"
    "" 'c++-skeleton-template)
  (define-abbrev c++-mode-abbrev-table "iw"
    "" 'c++-skeleton-while)
  (define-abbrev c++-mode-abbrev-table "ido"
    "" 'c++-skeleton-do)
  (define-abbrev c++-mode-abbrev-table "icl"
    "" 'c++-skeleton-class)
  (define-abbrev c++-mode-abbrev-table "ist"
    "" 'c++-skeleton-struct)
  (define-abbrev c++-mode-abbrev-table "isc"
    "" 'c++-skeleton-short-brief)
  (define-abbrev c++-mode-abbrev-table "ilc"
    "" 'c++-skeleton-long-brief)

  ;;c mode
  ;; (define-key c-mode-base-map [f5] 'gdb)
  ;; (define-key c-mode-base-map [C-f5] 'gud-go)
  ;; ;;启动窗口gdb
  ;; (define-key c-mode-base-map [S-f5] 'gdb-many-windows)

  ;; (define-key c-mode-base-map [f6] 'gud-watch)
  ;; (define-key c-mode-base-map [M-f6] 'gud-print)
  ;; (define-key c-mode-base-map [C-f6] 'previous-error)
  ;; (define-key c-mode-base-map [S-f6] 'next-error)

  ;; (define-key c-mode-base-map [f7] 'gud-next)
  ;; (define-key c-mode-base-map [C-f7] 'gud-nexti)
  
  ;; (define-key c-mode-base-map [f8] 'gud-step)
  ;; (define-key c-mode-base-map [C-f8] 'gud-stepi)
  ;; (define-key c-mode-base-map [S-f8] 'gud-finish)
  ;; (define-key c-mode-base-map [M-f8] 'gud-until)

  ;; (define-key c-mode-base-map [M-f9] 'gud-remove)
  ;; (define-key c-mode-base-map [C-f9] 'gud-remove)
  ;; (define-key c-mode-base-map [f9] 'gud-break)

  ;; ;; c++ mode
 
  ;; ;;(define-key c++-mode-map [C-f3] 'speedbar)
  ;; (define-key c++-mode-map [f5] 'gdb)
  ;; (define-key c++-mode-map [C-f5] 'gud-go)
  ;; ;;启动窗口gdb
  ;; (define-key c++-mode-map [S-f5] 'gdb-many-windows)

  ;; (define-key c++-mode-map [f6] 'gud-watch)
  ;; (define-key c++-mode-map [M-f6] 'gud-print)
  ;; (define-key c++-mode-map [C-f6] 'previous-error)
  ;; (define-key c++-mode-map [S-f6] 'next-error)

  ;; (define-key c++-mode-map [f7] 'gud-next)
  ;; (define-key c++-mode-map [C-f7] 'gud-nexti)
  
  ;; (define-key c++-mode-map [f8] 'gud-step)
  ;; (define-key c++-mode-map [C-f8] 'gud-stepi)
  ;; (define-key c++-mode-map [S-f8] 'gud-finish)
  ;; (define-key c++-mode-map [M-f8] 'gud-until)

  ;; (define-key c++-mode-map [M-f9] 'gud-remove)
  ;; (define-key c++-mode-map [C-f9] 'gud-remove)
  ;; (define-key c++-mode-map [f9] 'gud-break)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Skeletons for C++ 

(define-skeleton c++-skeleton-if
  "Insert an if () {} region" nil
  > "if (" _ ") {" > \n
  "}" > \n)

(define-skeleton c++-skeleton-if-else
  "Insert an if () {} else {}region" nil
  > "if (" _ ") {" \n
  "} else {" > \n
  "}" >)

(define-skeleton c++-skeleton-for
  "Insert a 'for () {}' region" nil
  > "for ("_") {" > \n
  "}" > \n)

(define-skeleton c++-skeleton-while
  "Insert a 'while () {}' region" nil
  > "while ("_") {" > \n
  "}" > \n)

(define-skeleton c++-skeleton-do
  "Insert a 'do {} while ()' region" nil
  > "do {" > \n
  _ > \n
  "} while ()" > \n)

(define-skeleton c++-skeleton-template
  "Insert a 'template <>' region" nil
  > "template <"_">" > \n
)

(define-skeleton c++-skeleton-class
  "Insert a 'class {};' region" nil
  > "class "_" {" > \n
  "};" > \n
)

(define-skeleton c++-skeleton-struct
  "Insert a 'struct {};' region" nil
  > "struct "_" {" > \n
  "};" > \n
)

(define-skeleton c++-skeleton-short-brief
  "Insert a '//! \\brief' comment" nil
  "//! \\brief " _
)

(define-skeleton c++-skeleton-long-brief
  "Insert a /*! \\brief .. */ comment" nil
  "/*! \\brief " > _ \n
  "*/" > \n
  )

;; ;;http://www.emacswiki.org/emacs/GDB-MIaa
;; ;;;; Force gdb-mi to not dedicate any windows
;; (defadvice gdb-display-buffer (after undedicate-gdb-display-buffer)
;;   (set-window-dedicated-p ad-return-value nil))
;; (ad-activate 'gdb-display-buffer)

;; (defadvice gdb-set-window-buffer (after undedicate-gdb-set-window-buffer (name &optional ignore-dedi window))
;;   (set-window-dedicated-p window nil))
;; (ad-activate 'gdb-set-window-buffer)

;;gdb emacs gud does not allow input
(setq skeleton-mode-hook nil)
(setq skeleton-mode-hook nil)
(add-hook 'gdb-mode-hook 'my-gud-new-style)
(add-hook 'pdb-mode-hook 'my-gud-new-style)
;;(add-hook 'gud-mode-hook 'my-gud-style)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;(add-hook 'c-mode-common-hook 'my-gud-c-base-style)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)
;;(add-hook 'c++-mode-hook 'my-gud-c++-style)
;;(add-hook 'c++-mode-hook 'my-gud-style)
(add-hook 'c++-mode-hook 'abbrev-mode)
(add-hook 'c++-mode-hook 'cscope-minor-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)


(setq dabbrev-case-replace nil)
(global-unset-key (kbd "C-\`"))
(global-set-key (kbd "C-\`") 'ff-find-other-file)

(global-unset-key (kbd "C-x 5 3"))
(global-set-key "\C-x53" 'display-buffer-other-frame)



;; ;; Smart copy, if no region active, it simply copy the current whole line
;; (defadvice kill-line (before check-position activate)
;;   (if (member major-mode
;;               '(emacs-lisp-mode scheme-mode lisp-mode
;;                                 c-mode c++-mode objc-mode js-mode
;;                                 latex-mode plain-tex-mode))
;;       (if (and (eolp) (not (bolp)))
;;           (progn (forward-char 1)
;;                  (just-one-space 0)
;;                  (backward-char 1)))))
 
;; (defadvice kill-ring-save (before slick-copy activate compile)
;;   "When called interactively with no active region, copy a single line instead."
;;   (interactive (if mark-active (list (region-beginning) (region-end))
;;                  (message "Copied line")
;;                  (list (line-beginning-position)
;;                        (line-beginning-position 2)))))
 
;; (defadvice kill-region (before slick-cut activate compile)
;;   "When called interactively with no active region, kill a single line instead."
;;   (interactive
;;    (if mark-active (list (region-beginning) (region-end))
;;      (list (line-beginning-position)
;;            (line-beginning-position 2)))))
 
;; ;; Copy line from point to the end, exclude the line break
;; (defun copy-line (arg)
;;   "Copy lines (as many as prefix argument) in the kill ring"
;;   (interactive "p")
;;   (kill-ring-save (line-beginning-position)
;;                   (line-beginning-position 2))
;;                   ;; (line-beginning-position (+ 1 arg)))
;;   (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;; (global-set-key (kbd "C-M-k") 'copy-line)
