(defun range (m n)
  (if (> m n) () (cons m (range (+ m 1) n))))

(defun main ()
  (let ((input) (n) (l))
    (setq input (read))
    ;; (setq input "6")
    (setq n (parse-integer input))

    (setq l (mapcar
      (lambda (x) (+ (mod x 6) 1))
      (range 1 n)
      )
    )

    (setq l
      (mapcar
        (lambda (x)
          (length (remove-if (lambda (y) (equal y x)) l))
        )
        (range 1 6)
      )
    )

    (print (if (every (lambda (x) (equal x (car l))) l) "Yes" "No"))
  )
)

(main)