(in-package #:aoc)


(defun sum-elf-calories (input) 
  (let ((elf-calories '())
        (sum 0))
    (dolist (calories input (reverse (cons sum elf-calories)))
      (cond ((null calories) (push sum elf-calories) (setf sum 0))
            (t (incf sum calories))))))

