(in-package #:aoc)

(defun read-input (path &optional (fn #'identity)) 
  "Read file returning a list of lines call fn on each of the lines."
  (with-open-file (input path) 
    (loop for line = (read-line input nil nil) 
          while line
          collect (funcall fn line))))

(defun characters (str) 
  "Convert string to list of characters"
  (coerce str 'list))

(defun sum (numbers) 
  "Sum list of numbers."
  (reduce #'+ numbers))

(defun intersect-all (list-of-lists) 
  "Find the intersection of all of the lists of lists"
  (reduce #'intersection (rest list-of-lists) :initial-value (first list-of-lists)))

(defun group (list n) 
  "Group items in list into lists of size n."
  (labels ((iter (remaining-lists results)
             (cond ((null remaining-lists) (nreverse results))
                   ((< (length remaining-lists) n) (iter nil (cons remaining-lists results)))
                   (t (iter (subseq remaining-lists 3)
                            (cons (subseq remaining-lists 0 3) results))))))
    (iter list '())))
