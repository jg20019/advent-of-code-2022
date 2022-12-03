(in-package #:aoc)

(defvar *rock* 1)
(defvar *paper* 2)
(defvar *scissors* 3)

(defvar *moves* (list *rock* *paper* *scissors*))

(defvar *losing-score* 0)
(defvar *winning-score* 6)
(defvar *drawing-score* 3)

(defun decrypt-move (ch)
  (case ch
    (#\A *rock*)
    (#\B *paper*)
    (#\C *scissors*)
    (#\X *rock*)
    (#\Y *paper*)
    (#\Z *scissors*)))

(defun beats-p (a b) 
  "Returns true if a beats b."
  (or (and (= a *rock*) (= b *scissors*))
      (and (= a *paper*) (= b *rock*))
      (and (= a *scissors*) (= b *paper*))))

(defun outcome-score (opponent-move your-move)
  (cond ((beats-p opponent-move your-move) *losing-score*)
        ((beats-p your-move opponent-move) *winning-score*)
        (t *drawing-score*)))

(defun score-round (line) 
  (let* ((opponent-move (decrypt-move (aref line 0)))
         (your-move (decrypt-move (aref line 2))))
    (+ your-move (outcome-score opponent-move your-move))))

(defun drawing-move (move) 
  move)

(defun losing-move (move) 
  (find-if (lambda (x) (beats-p move x)) *moves*))

(defun winning-move (move) 
  (find-if (lambda (x) (beats-p x move)) *moves*))

(defun score-round (line) 
  (let ((opponent-move (decrypt-move (aref line 0)))
        (outcome (aref line 2)))
    (case outcome 
      (#\X (+ *losing-score* (losing-move opponent-move)))
      (#\Y (+ *drawing-score* (drawing-move opponent-move)))
      (#\Z (+ *winning-score* (winning-move opponent-move))))))

(defun solve-day-2 () 
  (apply #'+ (read-input "input/day-2" #'score-round))) 
