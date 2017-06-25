;;;;;;;;;;;;;;;;;;;;;;
;; Day 3 Question 1 ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Bank account management with mutable state

;; create the bank which will contain the acconts
(defn create-bank
  []
  (atom {}))

;; add an account
(defn add-account
  [bank-name acc init-balance]
  (swap! bank-name conj {acc init-balance}))

;; get balance
(defn get-balance
  [bank-name acc]
  (@bank-name acc))

;; debit account
(defn debit
  [bank-name acc amount]
  (swap! bank-name update-in [acc] (fn [x] (- x amount))))

;; credit account
(defn credit
  [bank-name acc amount]
  (swap! bank-name update-in [acc] (fn [x] (+ x amount))))

;; now run the bank file with some examples
(def hsbc (create-bank))

(add-account hsbc "ben" 200)
(add-account hsbc "robert" 300)

(println @hsbc)

(debit hsbc "ben" 100)
(credit hsbc "robert" 156)

(println @hsbc)
