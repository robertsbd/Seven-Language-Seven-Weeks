;; Question 1
(defn big [st n] (> (count st) n))

;; Question 2

(defn collection-type [col]
  ({(class []) :vector, (class '()) :emptylist, (class '(1)) :list, (class {}) :map}
   (class col)))

;; ;; stuff from day 2 testing
;; (defn size [v]
;;   (if (empty? v)
;;     0
;;     (inc (size (rest v)))))
