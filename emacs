;; -*- mode: Emacs-Lisp -*-

(modify-frame-parameters nil '((wait-for-wm . nil)))
(menu-bar-mode 0)
(setq warning-suppress-types nil)
(setq load-path (cons "/Users/tracy/.emacs.d/modes" load-path))
(push "/usr/bin" load-path)

;; All modes
(require 'web-mode)
(require 'python-mode)
(require 'js2-mode)
(require 'jinja)

(setq auto-mode-alist
      (append (list (cons "\\.cc$" 'c++-mode)
                    (cons "\\.C$"  'c++-mode)
                    (cons "\\.cxx$"  'c++-mode)
                    (cons "\\.H$"  'c++-mode)
                    (cons "\\.cpp$" 'c++-mode)
                    (cons "\\.thrift$" 'c++-mode)
                    (cons "\\.c$"  'c-mode)
                    (cons "\\.h$"  'c-mode)
                    (cons "\\.py$"  'python-mode)
                    (cons "\\.pyx$"  'python-mode)
                    (cons "\\.pl$"  'perl-mode)
                    (cons "[Mm]akefile" 'makefile-mode)
                    (cons "\\.txt$" 'text-mode)
                    (cons "\\.html$" 'web-mode)
                    (cons "\\.nunjucks$" 'jinja-mode)
                    (cons "\\.js$" 'web-mode)
                    (cons "\\.jsx$" 'web-mode)
                    ;; (cons "\\.scala$" 'scala-mode)
                    ;; (cons "\\.tex$" 'latex-mode)
                    )
              auto-mode-alist))

(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))

;; (require 'magit)

(setq comment-multiline t)		; avoid problems with long comments

;; ;; Anything
;; (require 'anything)
;; (require 'anything-config)
;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;;                                 '(length initial-pattern)))

;; ;; Change the default switch buffer behavior to use "anything" instead
;; (global-set-key "\C-xb" 'anything)

;; ;; Anything allows you to customize the list of sources that it checks
;; ;; against.
;; (setq anything-sources
;;       '(anything-c-source-buffers
;;         anything-c-source-buffer-not-found
;;         anything-c-source-files-in-current-dir
;;         anything-c-source-locate
;;         ;; anything-c-source-ffap-guesser
;;         ;; anything-c-source-man-pages
;;         ;; anything-c-source-complex-command-history
;;         ;; anything-c-source-extended-command-history
;;         ;; anything-c-source-emacs-commands
;;         ))

;; Put indent(setq-default indentation in a func we can call from our C hook, since something
;; seems to be overwriting them everytime we load a new file!
(setq-default indent-tabs-mode nil)
(defun set-indentation ()
  (interactive)

  (setq c++-cleanup-}-else-{-p nil)

  (setq c-indent-level 4)
  (setq c-basic-offset 4)
  (setq c-indent-level 2)
  (setq c-basic-offset 2)
  (setq c-label-offset -2)
  (setq c-argdecl-indent 2)
  (setq c-auto-newline nil)
  (setq c-brace-offset 0)
  (setq c-tab-always-indent t)
  (setq c-brace-imaginary-offset 0)
  (setq c-continued-statement-offset 2);

  (setq-default indent-tabs-mode nil)
)
(set-indentation)

(setq comment-multiline t)
(setq find-file-existing-other-name t)
(setq default-fill-column 80)

(setq require-final-newline nil)
(setq truncate-partial-width-windows nil)

(global-set-key "\M-r" 'revert-buffer)

;; Kill newline along with line if do 'kill-line from line beginning
(setq kill-whole-line t)

;;; no more check-spelling
(global-set-key "\M-$" 'nothing)

(autoload 'python-mode' "python-mode" "Python editing mode." t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(js2-basic-offset 4)
 '(js2-cleanup-whitespace nil)
 '(transient-mark-mode t))

(setq case-fold-search t)
(setq visible-bell nil)


(put 'downcase-region 'disabled nil)

;completion

; rope-find-file: C-x p f
; rope-find-occurrences: C-c f
; rope-show-doc: C-c d
; rope-goto-definition: C-c g

;(require 'auto-complete)
;(global-auto-complete-mode t)


;(setq load-path (cons (expand-file-name "/usr/share/doc/git-core/contrib/emacs") load-path))
;(require 'vc-git)
;(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;(require 'git)
;(autoload 'git-blame-mode "git-blame"
;  "Minor mode for incremental blame for Git." t)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((default (:foreground "red")) (nil nil))))


; toggle to other file with single command

;; (defun rewrite-filename (filename rules)
;;   (if rules (or
;;              (let ((current-rule (car rules)))
;;                (and (string-match (car current-rule) filename)
;;                     (let ((name (replace-regexp-in-string
;;                                  (car current-rule) (cadr current-rule)
;;                                  filename)))
;;                       (and (or (cadr (cdr current-rule)) (file-exists-p name))
;;                            name))))
;;              (rewrite-filename filename (cdr rules)))
;;     (error (concat "No rewriting rule applicable for '" filename "'"))))

;; (defun switch-on-extensions ()
;;   (interactive)
;;   (if (buffer-file-name)
;;       (find-file (rewrite-filename (buffer-file-name) switch-on-extensions-rules))
;;     (error "No file attached to this buffer!")))

;; (setq switch-on-extensions-rules '(
;;                                    ("\\.cpp$" ".h" t)
;;                                    ("\\.h$"   ".cpp" t)
;;                                    ("" "" )))

;(global-set-key "\C-u" 'switch-on-extensions)

;(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-t" 'kill-word)
;(global-set-key "\C-q" 'query-replace)
;(global-set-key "\C-f" 'save-buffer)
;(global-set-key "\C-v" 'save-buffers-kill-emacs)
;(global-set-key "\C-b" 'switch-to-buffer)

;(global-set-key "\C-h" 'forward-word)
;(global-set-key "\C-l" 'forward-paragraph)
;(global-set-key "\C-y" 'backward-word)
;(global-set-key "\C-o" 'backward-paragraph)
;(global-set-key "\C-u" 'yank)
;(global-set-key "\C-m" 'recenter)

;(global-set-key "\C-p" 'undo)
(global-set-key "\C-n" 'goto-line)
(global-set-key "\C-s" 'isearch-forward)
;(global-set-key "\C-x \C-s" 'save)

;(global-set-key [deletechar] 'delete-char)
(global-set-key [kp-delete] 'delete-char)
;(define-key function-key-map [delete] [F20]) ;; hack from internets
;(global-set-key [F20] 'delete-char)

;;
;; Wombat theme ported from Vim
;;
;;(show-paren-mode t) ; this line causing problems in putty
;;(set-background-color "#242424")
(set-foreground-color "#f6f3e8")
(set-cursor-color "#656565")
;;(set-face-foreground 'font-lock-comment-face "#99968b")
;;(set-face-italic-p 'font-lock-comment-face t)
(set-face-foreground 'font-lock-doc-face "#99968b")
(set-face-italic-p 'font-lock-doc-face t)
(set-face-foreground 'font-lock-constant-face "#e5786d")
(set-face-foreground 'font-lock-string-face "#95e454")
(set-face-italic-p 'font-lock-string-face t)
(set-face-foreground 'font-lock-variable-name-face "#cae682")
(set-face-foreground 'font-lock-function-name-face "#cae682")
(set-face-foreground 'font-lock-function-name-face "#e0ffff")
(set-face-foreground 'font-lock-type-face "#cae682")
(set-face-foreground 'font-lock-type-face "#c6e2ff")
(set-face-foreground 'font-lock-builtin-face "#8ac6f2")
(set-face-foreground 'font-lock-keyword-face "#b0c4de")
(set-face-foreground 'font-lock-warning-face "#ff3030")
(set-face-foreground 'font-lock-preprocessor-face "#e5786d")
;;(set-face-foreground 'font-lock-negation-char-face "#e7f6da")
;;(set-face-foreground 'link "#8ac6f2")
;;(set-face-bold-p 'link t)
;;(set-face-underline-p 'link t)

;;(set-face-foreground 'show-paren-match-face "#f6f3e8")
;;(set-face-background 'show-paren-match-face "#857b6f")
;;(set-face-foreground 'show-paren-match-face "#e9967a")
;;(set-face-background 'show-paren-match-face "#898989")
;;(set-face-bold-p 'show-paren-match-face t)
(set-face-foreground 'region "#f6f3e8")
(set-face-background 'region "#444444")
;;(set-face-foreground 'lazy-highlight "black")
;;(set-face-foreground 'isearch-lazy-highlight-face "black")
;;(set-face-background 'lazy-highlight "yellow")
;;(set-face-background 'isearch-lazy-highlight-face "#eedd82")

;;(set-frame-height (selected-frame) 60)
;;(set-frame-width (selected-frame) 80)
;;(set-frame-position (selected-frame) 0 0)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'ido)
(ido-mode t)

;;; fill-column indicator
(require 'fill-column-indicator)

(setq column-number-mode t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 79)
(global-whitespace-mode t)

;;; pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
