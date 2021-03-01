; Palindrome function 
(defun palindromep(alist)
  (cond 
    ;((format t "The list: ~S~%" alist))

    ; Keep going until the list is empty
    ((null alist) t) 
    ; Checks non-equality of the first and last values. Returns
    ; NIL if the values are not equal. Else we go to next line. 
    ((not(equal (first alist) (first (reverse alist)))) NIL) 
    ; Checks equality of the first and last values. If equal, we
    ; recursively call the function again and feed in the original list with
    ; the first and last elements taken off.  
    ((equal (first alist) (first (reverse alist))) (palindromep (rest (reverse (rest alist)))) )
  )
)

;;; Expected output: T T T NIL NIL T

; Tests a even palindrome 
(write (palindromep '(a b b a)))
(terpri)

; Tests a odd palindrome 
(write (palindromep '(a b c b a)))
(terpri)

; Tests a palindrome with sub-lists that are the same
(write (palindromep '(a (a b) c (a b) a)))
(terpri)

; Tests a palindrome with sub-lists that aren't the same
(write (palindromep '(a (a b) c (a c) a)))
(terpri)

; Tests a non-palindrome
(write (palindromep '(a (c d) b e)))
(terpri)

; Tests an atom
(write (palindromep '(a)))
(terpri)
