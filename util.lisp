(in-package #:aoc)

(defun read-input (path &optional (fn #'identity)) 
  (with-open-file (input path) 
    (loop for line = (read-line input nil nil) 
          while line
          collect (funcall fn line))))
