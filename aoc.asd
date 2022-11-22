;;;; aoc.asd

(asdf:defsystem #:aoc
  :description "Advent of Code Solutions for 2022"
  :author "John Gibson <jg20019@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :depends-on (:str)
  :components ((:file "package")
               (:file "util" :depends-on ("package"))
               (:file "day-1" :depends-on ("utils"))))
