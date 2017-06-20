;;;;;;;;;;;;;;;;;;;;;
;; Day 2 questions ;;
;;;;;;;;;;;;;;;;;;;;;

;; Question 1
(defn big [st n] (> (count st) n))

;; Question 2

(defn collection-type [col]
  ({(class []) :vector, (class '()) :emptylist, (class '(1)) :list, (class {}) :map}
   (class col)))

;;;;;;;;;;;;;;;;;;;;;
;; Day 2 questions ;;
;;;;;;;;;;;;;;;;;;;;;

;; Question 1

(defmacro unless [test body1 body2]
  (list 'if (list 'not test) body1 body2))

(println "Day2: Question 1")

(unless true (println "this is true") (println "this is false"))

(defmacro unless2 [test1 test2 test2true test2false test1false]
  (list 'if (list 'not test1) (list 'if (list 'not test2) test2true test2false) test1false))

(unless2 false true (println "test1 not true; test2 not true") (println "test1 not true; test2 not false") (println "test1 not false"))

;; (if false (if true (println "inner true") (println "inner false")) (println "outer false"))

;; Question 2 - Practicing

(println "Practing for Day2: Question 2")

(defprotocol WereCreature
  (full-moon-behaviour [x]))

(defrecord WereWolf [name title]
  WereCreature
  (full-moon-behaviour [x]
    (str name " will howl and murder")))

(full-moon-behaviour (map->WereWolf {:name "Lucian" :title "CEO of Melodrama"}))

;; Question 2 - Answer

(defprotocol Combiners
  (add-together [x]))

(defrecord TwoStrings [a b]
  Combiners
  (add-together [x]
    (apply str [a b])))

(defrecord TwoNums [a b]
  Combiners
  (add-together [x]
    (+ a b)))

(println "Day2: Question 2")

(println (add-together (map->TwoStrings {:a "String1" :b "String2"})))
(println (add-together (map->TwoNums {:a 1 :b 2})))
