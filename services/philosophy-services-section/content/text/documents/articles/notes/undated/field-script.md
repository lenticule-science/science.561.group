---
title: Field script
description: (ns field.agent (:require [clojure.edn :as edn] [clojure.java.io :as io] [clojure.set :as set]))
aliases:
  - Field Script
---
(ns field.agent
  (:require [clojure.edn :as edn]
            [clojure.java.io :as io]
            [clojure.set :as set]))

;; Load FIELD data from EDN
(defn load-field [path]
  (with-open [r (io/reader path)]
    (edn/read (java.io.PushbackReader. r))))

;; Save FIELD state back to EDN
(defn save-field! [path data]
  (spit path (pr-str data)))

;; Get all IDs for deduplication and validation
(defn field-ids [field]
  (set (map :id field)))

;; Validate that a new entry is derivable
(defn derivable? [entry field]
  (let [known-ids (field-ids field)
        inducers (set (get entry :induced-by []))]
    (and
      (:expression entry)
      (:id entry)
      (:type entry)
      (not (contains? known-ids (:id entry)))
      (set/subset? inducers known-ids))))

;; Derive and insert a new entry into the field
(defn derive-entry [entry field]
  (if (derivable? entry field)
    (conj field (assoc entry :stabilized true))
    (throw (ex-info "Entry not derivable — violates constraint induction" {:entry entry}))))

;; Example usage with GPT suggestion
(defn run-agent []
  (let [path "data/combined-derived-field.edn"
        field (load-field path)
        ;; Replace this with GPT-provided entry:
        gpt-proposed
        {:id :example-derived-function
         :expression '(⇔ (Ω(x) = x) ∧ (Δ[s](x, y)))
         :type :predicate
         :induced-by [:constraint-completion :semantic-differentiation]
         :output :resolved-surface
         :timestamp "2025-04-21"}]
    (try
      (let [updated (derive-entry gpt-proposed field)]
        (save-field! path updated)
        (println "New expression added."))
      (catch Exception e
        (println "FAILED:" (.getMessage e))))))
