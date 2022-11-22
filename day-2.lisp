(in-package #:aoc)

(defvar *rock* 1)
(defvar *paper* 2)
(defvar *scisscors* 3)

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


(defun outcome-score (opponent-move your-move)
  (cond ((= opponent-move your-move) *drawing-score*)
        ((and (= opponent-move *scissors*) (= your-move *rock*)) *winning-score*)
        ((and (= opponent-move *rock*) (= your-move *scissors*)) *losing-score*)
        ((< opponent-move your-move) *winning-score*)
        ((> opponent-move your-move) *losing-score*)))

(defun score-round (line) 
  (let* ((opponent-move (decrypt-move (aref line 0)))
         (your-move (decrypt-move (aref line 2))))
    (+ your-move (outcome-score opponent-move your-move))))

(defun drawing-move (move) 
  move)

(defun losing-move (move) 
  (case move 
    (*rock* *scissors*)
    (*paper* *rock*)
    (*scissors* *paper*)))

(defun winning-move (move) 
  (case move 
    (*rock* *paper*)
    (*paper* *scissors*)
    (*scissors* *rock*)))

(defun score-round (line) 
  (let ((opponent-move (decrypt-move (aref line 0)))
        (outcome (aref line 2)))
    (case outcome 
      (#\X (+ *losing-score* (losing-move opponent-move)))
      (#\Y (+ *drawing-score* (drawing-move opponent-move)))
      (#\Z (+ *winning-score* (winning-move opponent-move))))))

(apply #'+ (read-input "day-2" #'score-round))
