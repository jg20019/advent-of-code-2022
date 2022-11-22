(in-package #:aoc)


(defun sum-elf-calories (input) 
  (let ((elf-calories '())
        (sum 0))
    (dolist (calories input (reverse (cons sum elf-calories)))
      (cond ((null calories) (push sum elf-calories) (setf sum 0))
            (t (incf sum calories))))))

;; Read each of the lines calling parse-integer to turn the strings into numbers.
;; If the string is null, return nil. 
;; Sum each group of the elfs calories.
(defvar *calories* (sum-elf-calories (read-input #p"input/day-1" #'(lambda (x) (parse-integer x :junk-allowed t)))))

;; Part 1
(apply #'max *calories*)

;; Part 2
(let* ((sorted-calories (sort (copy-seq *calories*) #'>))
       (top-3 (subseq sorted-calories 0 3)))
  (apply #'+ top-3))
