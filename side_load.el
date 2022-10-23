
;;; This code open up a side buffer  - courtesy of StackOverflow
;;; https://stackoverflow.com/questions/41095426/when-window-is-split-on-startup-how-to-open-the-file-on-the-right-side


(defun my-display-buffer(buffer alist direction &optional size pixelwise)
"BUFFER: The buffer that will be displayed.
ALIST: See the doc-string of 'display-buffer' for more information.
DIRECTION: Must use one of these symbols: 'left 'right 'below 'above.
SIZE: See the doc-string for 'split-window'.
PIXELWISE: See the doc-string for 'split window'.
There are three possibilities:
- (1) If a window on the frame already displays the target buffer, then just reuse the same window.
- (2) If there is already a window in the specified direction in relation to the selected window, then display the target buffer in said window.
- (3) If there is no window in the specified direction, then create one in that direction and display te target buffer in said window."

(let ((window
        (cond
	  ((get-buffer-window buffer (selected-frame)))
	  ((window-in-direction direction))
	  (t
	    (split-window (selected-window) size direction pixelwise)))))
  (window--display-buffer buffer window 'window alist display-buffer-mark-dedicated)
  window))

(split-window nil '40 'right)

;;(load-file "~Documents/Financial/Contents.org" 'left)

(let ((buffer (find-file "~/Documents/Financial/contents.org")))
(with-current-buffer buffer
(message "major-mode: %s" major-mode)))
;;(my-display-buffer buffer nil 'left '0.7))




;;Contents.org
;; allows org files to be created in a new window
;; syntax courtesy of stackoverflow
;; https://stackoverflow.com/questions/8881649/how-to-force-org-mode-to-open-a-link-in-another-frame

 ;;Syntax is [[file://~/some.filename.org][Filename.org::Buffername]]
(provide 'side_load)
