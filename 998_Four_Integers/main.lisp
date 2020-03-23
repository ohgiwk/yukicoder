(defun range (m n)
  (if (> m n) () (cons m (range (+ m 1) n))))

(defun split (x str)
  (let ((pos (search x str))
        (size (length x)))
    (if pos
      (cons (subseq str 0 pos)
            (split x (subseq str (+ pos size))))
      (list str))))


(defun main()
  (let ((input) (l1) (l2))
    (setq input (read))
    ;; (setq input "1 2 3 4")

    (setq l1 (sort (mapcar (lambda (x) (parse-integer x)) (split " " input)) #'<))
    (setq l2 (range (car l1) (car (last l1))))

    (princ (if (equal l1 l2) "Yes" "No"))
  )
)

(main)







