;;; package --- Summary
;;; Commentary:
;;; Initial Emacs

;;; Code:
(setq inhibit-startup-message t)

(menu-bar-mode -1)

(setq visible-bell t)


;; 将自动保存文件存储到指定目录
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save-list/" t)))

;; 将备份文件存储到指定目录
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups/")))

;; 禁止生成临时文件（如 #filename#）
(setq create-lockfiles nil)

;; 启用自动保存模式
(auto-save-mode 1)

;; 设置自动保存的时间间隔和键击间隔
(setq auto-save-timeout 20) ;; 时间间隔（秒）
(setq auto-save-interval 200) ;; 键击间隔

;; 添加 MELPA 包管理源
(require 'package)
(add-to-list 'package-archives
             '(("gnu" . "https://elpa.gnu.org/packages/")
             ("nongnu" . "https://elpa.nongnu.org/packages/")
             ("melpa" . "https://melpa.org/packages/")) )
(package-initialize)

;; 确保安装 use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 启用 use-package
(require 'use-package)

;; 安装和配置 evil 模式
(setq evil-want-C-u-scroll t)
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )
;; 安装和配置 rust-mode
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t)) ;; 保存时自动格式化

;; 安装和配置 cargo
(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

;; 安装和配置 flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; 安装和配置 lsp-mode
(use-package lsp-mode
  :ensure t
  :hook ((rust-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-rust-server 'rust-analyzer)) ;; 使用 rust-analyzer

;; 安装和配置 company
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1))

;; 安装和配置 lsp-ui
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-doc-enable nil ;; 禁用文档弹出
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-peek-enable t))

;; 安装和配置 rustic
(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save t)) ;; 保存时自动格式化

;; 安装和配置 projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  ;; 设置 projectile 的缓存目录
  (setq projectile-cache-file (expand-file-name "projectile.cache" user-emacs-directory))
  ;; 配置默认项目搜索路径
  (setq projectile-project-search-path '("~/Workspaces/"))
  ;; 配置 projectile 的快捷键前缀
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; 安装和配置 treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  ;; 启用 treemacs 的项目管理模式
  (use-package treemacs-projectile
    :after projectile
    :ensure t))


;; 安装和配置 treemacs-evil
(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

;; 安装和配置 treemacs-all-the-icons
(use-package treemacs-all-the-icons
  :after treemacs
  :ensure t
  :config
  (treemacs-load-theme "all-the-icons"))

;; 安装和配置 treemacs-icons-dired
(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config
  (treemacs-icons-dired-mode))

;; 安装和配置 all-the-icons
(use-package all-the-icons
  :ensure t)

;; 安装和配置 tab-bar-mode
(use-package tab-bar
  :ensure nil ;; tab-bar 是 Emacs 内置功能，无需安装
  :config
  (tab-bar-mode 1) ;; 启用 tab-bar-mode
  ;; 自定义选项卡快捷键
  (global-set-key (kbd "C-x t n") 'tab-new) ;; 新建选项卡
  (global-set-key (kbd "C-x t c") 'tab-close) ;; 关闭选项卡
  (global-set-key (kbd "C-x t o") 'tab-next) ;; 切换到下一个选项卡
  (global-set-key (kbd "C-x t p") 'tab-previous)) ;; 切换到上一个选项卡

(provide `init)
;;; init.el ends here
