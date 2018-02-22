(setq c-default-style "linux"
      c-basic-offset 4)


(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))


(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

(global-linum-mode 1)

(show-paren-mode 1)

;; (load-theme 'wombat)

 ;; (set-default-font 'Terminus-9)
(set-default-font "Inconsolata-12")

(winner-mode)
(global-set-key [f9] 'delete-other-windows)
(global-set-key [C-f9] 'delete-window)
(global-set-key (kbd "<f7>") 'winner-undo)
(global-set-key (kbd "C-<f7>") 'winner-redo)

;; (desktop-save-mode 1)

(defun shell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (shell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(load "auctex.el" nil t t)
(require 'tex-mik)
(setq TeX-PDF-mode t)
(eval-after-load "tex"
  '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9a83ff251b3e78e74a8ae6005253ef6e40577a8f89381eed325c4bc98c8c65ed" default)))
 '(git-gutter:update-interval 2)
 '(jdee-server-dir "~/.emacs.d/jdee-server/target")
 '(package-selected-packages
   (quote
    (expand-region jdee company rainbow-mode git-gutter multiple-cursors markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(windmove-default-keybindings)

(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Cambio de diccionarios para checkeo de ortografia

(global-set-key
 [f3]
 (lambda ()
   (interactive)
   (ispell-change-dictionary "castellano")))
(global-set-key
 [f4]
 (lambda ()
   (interactive)
   (ispell-change-dictionary "english")))

;; Ajuste de tamanio de ventanas
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(put 'upcase-region 'disabled nil)

(load "~/.emacs.d/maude-mode2.el")
(require 'maude-mode)
(add-to-list 'auto-mode-alist '("\\.maude\\'" . maude-mode))

;; (global-set-key "\M-c" "\C-a\C- \C-n\M-w\C-y")
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-S-d") 'duplicate-line)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; (setq redisplay-dont-pause f)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(97 97))
(add-to-list 'default-frame-alist '(alpha 97 97))

;; Git Gutter = changed lines highlighter
(global-git-gutter-mode +1)

;; Activa Rainbow mode para colores hexadecimales (o por nombre)
;; (rainbow-mode)
;; (company-mode)

(defun hilite-todos ()
  (highlight-lines-matching-regexp "\\<\\(FIXME\\|TODO\\|XXX\\):?" 
       'hi-red-b)
)


(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'hilite-todos)
(add-hook 'prog-mode-hook 'company-mode)

(add-to-list 'load-path "~/.emacs.d/elisp/theme-changer")
;; 4.34:-74.4
(setq calendar-latitude 4.34)
(setq calendar-longitude -74.4)

(load "~/.emacs.d/elisp/weyland-yutani-theme/weyland-yutani-theme.el")
(load "~/.emacs.d/elisp/magonyx-theme.el")

(require 'theme-changer)
(change-theme 'magonyx 'weyland-yutani)

(setq inhibit-startup-screen t)

;; markdown with utf-8
(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))

(defun as/markdown-add-xhtml-header-and-footer (title)
    "Wrap XHTML header and footer with given TITLE around current buffer."
    (goto-char (point-min))
    (insert "<!DOCTYPE html5>\n"
	    "<html>\n"
	    "<head>\n<title>")
    (insert title)
    (insert "</title>\n")
    (insert "<meta charset=\"utf-8\" />\n")
    (when (> (length markdown-css-paths) 0)
      (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
    (insert "\n</head>\n\n"
	    "<body>\n\n")
    (goto-char (point-max))
    (insert "\n"
	    "</body>\n"
	    "</html>\n"))

;; move lines and regions
;; lines
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; region
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

;; lines and region
(defun move-line-region-up (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (&optional start end n)
  (interactive "r\np")
  (if (use-region-p) (move-region-down start end n) (move-line-down n)))

(global-set-key (kbd "M-p") 'move-line-region-up)
(global-set-key (kbd "M-n") 'move-line-region-down)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
