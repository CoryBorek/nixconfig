{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.emacs;

in {


config = mkIf cfg.enable {

  programs.emacs = {

  extraConfig = ''
  ;;; Personal configuration -*- lexical-binding: t -*-

;; Save the contents of this file under ~/.emacs.d/init.el
;; Do not forget to use Emacs' built-in help system:
;; Use C-h C-h to get an overview of all help commands.  All you
;; need to know about Emacs (what commands exist, what functions do,
;; what variables specify), the help system can provide.

;; Add the NonGNU ELPA package archive
(require 'package)
(add-to-list 'package-archives  '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless package-archive-contents  (package-refresh-contents))


;; Load a custom theme
(load-theme 'manoj-dark t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Disable splash screen
(setq inhibit-startup-screen t)

;; Enable line numbering by default
(global-display-line-numbers-mode t)

;; Automatically pair parentheses
(electric-pair-mode t)

;;; Indication of local VCS changes
(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))

;; Enable `diff-hl' support by default in programming buffers
(add-hook 'prog-mode-hook #'diff-hl-mode)

;; Update the highlighting without saving
(diff-hl-flydiff-mode t)

;;; JSON Support
(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))

;;; Typescript Support
(unless (package-installed-p 'typescript-mode)
  (package-install 'typescript-mode))

;;; YAML Support
(unless (package-installed-p 'yaml-mode)
  (package-install 'yaml-mode))

;;; Markdown support
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;;; Nix support
(unless (package-installed-p 'nix-mode)
  (package-install 'nix-mode))


;; Miscellaneous options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
  '';
  };

};
}
