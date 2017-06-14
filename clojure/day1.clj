;; Question 1
(defn big [st n] (> (count st) n))

;; Question 2

(defn collection-type [col] ({(class []) :vector, (class '()) :emptylist, (class '(1)) :list, (class {}) :map} (class col)))


