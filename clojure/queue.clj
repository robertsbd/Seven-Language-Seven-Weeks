;; a queue where we add to the queue, we remove on a first in first off basis

;; create the queue vector
(defn create-queue
  []
  (atom []))

;; add an item to the back of the queue

(defn add-to-back
  [queue val-to-add]
  (swap! queue conj val-to-add))

;; remove an item from the front of the queue, return that item, will
;; remove the oldest item in the queue

(defn get-from-front
  [queue]
  (let [oldest-item (first @queue)]
    (swap! queue (fn [x] (into [] (rest x))))
    oldest-item))

;; remove item from back of queue - ie. the most recently added. Check
;; that the order in which things are being added is working properly

(defn get-from-back
  [queue]
  (let [newest-item (last @queue)]
    (swap! queue (fn [x] (into [] (reverse (rest (reverse x))))))
    newest-item))
