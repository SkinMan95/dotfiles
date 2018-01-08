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
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (company rainbow-mode git-gutter multiple-cursors markdown-mode))))
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
(rainbow-mode)
(company-mode)

(defun hilite-todos ()
  (highlight-lines-matching-regexp "\\<\\(FIXME\\|TODO\\|XXX\\):?" 
       'hi-red-b)
)

(add-hook 'prog-mode-hook 'hilite-todos)
(add-hook 'prog-mode-hook 'company-mode)

(add-to-list 'load-path "~/.emacs.d/elisp/theme-changer")
;; (load "~/.emacs.d/elisp/theme-changer/theme-changer.el")
;; 4.34:-74.4
(setq calendar-latitude 4.34)
(setq calendar-longitude -74.4)

(require 'theme-changer)
(change-theme 'whiteboard 'wombat)
