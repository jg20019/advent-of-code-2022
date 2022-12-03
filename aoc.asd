;;;; aoc.asd

(asdf:defsystem #:aoc
  :description "Advent of Code Solutions for 2022"
  :author "John Gibson <jg20019@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:str)
  :components ((:file "package")
               (:file "util")
               (:file "day-1")
               (:file "day-2")
               (:file "day-3")))
