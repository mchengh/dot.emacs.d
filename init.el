;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    init-loader
    php-mode
    scala-mode2
    markdown-mode
    scss-mode
    haskell-mode
    js2-mode
    google-c-style
    yaml-mode
    flycheck
    exec-path-from-shell
    dropdown-list
    migemo
    open-junk-file
    recentf-ext
    popwin
    google-translate
    auto-complete
    foreign-regexp
    emmet-mode
    auto-highlight-symbol
    highlight-symbol
    slim-mode
    apache-mode
    zenburn-theme
    ssh-config-mode
    smarty-mode
    go-mode
    go-autocomplete
    smartrep
    expand-region
    jade-mode
    coffee-mode
    haml-mode
    dash-at-point
    enh-ruby-mode
    yard-mode
    lua-mode
    rainbow-mode
    web-beautify
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
