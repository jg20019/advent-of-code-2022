(in-package :aoc)

(defun priority (item) 
  (if (lower-case-p item) 
      (+ 1 (- (char-code item) (char-code #\a)))
      (+ 27 (- (char-code item) (char-code #\A)))))

(defun bisect (str) 
  (let* ((length (length str))
         (midpoint (/ length 2))
         (first-half  (subseq str 0 midpoint) )
         (second-half (subseq str midpoint)))
    (values first-half second-half)))


(defun find-common-character (&rest list-of-characters)
  (first (intersect-all list-of-characters)))

(defun solve-part-1 () 
  (sum (read-input #p"input/day-3" #'(lambda (line) 
                                               (multiple-value-bind (x y) (bisect line) 
                                                 (priority  (find-common-character (characters x) 
                                                                                   (characters y))))))))

(defun solve-part-2 () 
  (let* ((rucksacks (read-input #p"input/day-3" #'characters))
         (groups (group rucksacks 3)))
    (sum (mapcar #'(lambda (group) 
                     (priority (apply #'find-common-character group)))
                 groups))))

(defun solve-day-3 () 
  (solve-part-2))
