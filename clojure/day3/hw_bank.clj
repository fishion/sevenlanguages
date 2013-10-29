; Use refs to create a vector of accounts in memory.
; Create debit and credit functions to change balance

(def bank (ref {}))
(defn credit
    ( [account, qty] (credit account qty +))
    ( [account, qty, addsub] (
        if (bank account)
        (dosync (alter bank assoc account (addsub (bank account) qty)))
        (dosync (alter bank assoc account (addsub 0 qty)))
    ))
)
(defn debit [account, qty] (credit account qty -))

