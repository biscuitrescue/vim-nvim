;;; evil-snipe-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-snipe" "evil-snipe.el" (0 0 0 0))
;;; Generated autoloads from evil-snipe.el

(autoload 'evil-snipe-def "evil-snipe" "\
Define a N char snipe and bind it to FORWARD-KEY and BACKWARD-KEY.
TYPE can be inclusive or exclusive. Specify FORWARD-FN and/or BACKWARD-FN to
explicitly choose the function names.

\(fn N TYPE FORWARD-KEY BACKWARD-KEY &key FORWARD-FN BACKWARD-FN)" nil t)
 (autoload 'evil-snipe-s "evil-snipe" nil t)
 (autoload 'evil-snipe-S "evil-snipe" nil t)
 (autoload 'evil-snipe-x "evil-snipe" nil t)
 (autoload 'evil-snipe-X "evil-snipe" nil t)
 (autoload 'evil-snipe-f "evil-snipe" nil t)
 (autoload 'evil-snipe-F "evil-snipe" nil t)
 (autoload 'evil-snipe-t "evil-snipe" nil t)
 (autoload 'evil-snipe-T "evil-snipe" nil t)

(autoload 'turn-on-evil-snipe-mode "evil-snipe" "\
Enable evil-snipe-mode in the current buffer." nil nil)

(autoload 'turn-on-evil-snipe-override-mode "evil-snipe" "\
Enable evil-snipe-mode in the current buffer." nil nil)

(autoload 'turn-off-evil-snipe-mode "evil-snipe" "\
Disable `evil-snipe-local-mode' in the current buffer." nil nil)

(autoload 'turn-off-evil-snipe-override-mode "evil-snipe" "\
Disable evil-snipe-override-mode in the current buffer." nil nil)

(autoload 'evil-snipe-local-mode "evil-snipe" "\
Enable `evil-snipe' in the current buffer.

This is a minor mode.  If called interactively, toggle the
`Evil-snipe-Local mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `evil-snipe-local-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'evil-snipe-override-local-mode "evil-snipe" "\
Override evil-mode's f/F/t/T/;/, motions.

This is a minor mode.  If called interactively, toggle the
`Evil-Snipe-Override-Local mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `evil-snipe-override-local-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'evil-snipe-mode 'globalized-minor-mode t)

(defvar evil-snipe-mode nil "\
Non-nil if Evil-Snipe mode is enabled.
See the `evil-snipe-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `evil-snipe-mode'.")

(custom-autoload 'evil-snipe-mode "evil-snipe" nil)

(autoload 'evil-snipe-mode "evil-snipe" "\
Toggle Evil-Snipe-Local mode in all buffers.
With prefix ARG, enable Evil-Snipe mode if ARG is positive; otherwise,
disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Evil-Snipe-Local mode is enabled in all buffers where
`turn-on-evil-snipe-mode' would do it.

See `evil-snipe-local-mode' for more information on Evil-Snipe-Local
mode.

\(fn &optional ARG)" t nil)

(put 'evil-snipe-override-mode 'globalized-minor-mode t)

(defvar evil-snipe-override-mode nil "\
Non-nil if Evil-Snipe-Override mode is enabled.
See the `evil-snipe-override-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `evil-snipe-override-mode'.")

(custom-autoload 'evil-snipe-override-mode "evil-snipe" nil)

(autoload 'evil-snipe-override-mode "evil-snipe" "\
Toggle Evil-Snipe-Override-Local mode in all buffers.
With prefix ARG, enable Evil-Snipe-Override mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Evil-Snipe-Override-Local mode is enabled in all buffers where
`turn-on-evil-snipe-override-mode' would do it.

See `evil-snipe-override-local-mode' for more information on
Evil-Snipe-Override-Local mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "evil-snipe" '("evil-snipe-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-snipe-autoloads.el ends here
