---
title: TAB
id: a6e6b071-b2ff-4fdc-8312-84b01f95896d
type: doc
status: draft
created: "2025-09-15"
authors:
  - emsenn
description: (fn tab.log [level ...] {:fnl/docstring "Print MESSAGE (can be more than one string) if LEVEL is equal or greater to the configured log level." :fnl/arglist [level message]} (fn print-message [message] (print (..
visibility: public
header-args: :noweb yes
---

## Documentation
TAB is a Fennel-powered MUD engine built with Org-mode tangling. The original Org file organized the project into documentation, engine code, library models, and supplements for source files.

## Engine Configuration and Header
```fennel
(local fennel (require :fennel))
(local conf (require :conf))
(local tab {:view fennel.view
            :eval fennel.eval
            :doc fennel.doc})
```

## Utilities
### Logging
```fennel
(local log-levels {:critical 1 :error 2 :warning 3
                   :info 4 :debug 5 :spam 6})

(fn tab.log [level ...]
  {:fnl/docstring "Print MESSAGE (can be more than one string) if LEVEL is equal or greater to the configured log level."
   :fnl/arglist [level message]}
  (fn print-message [message]
    (print (.. (tab.render-time (os.time) true)
               "> " level
               (if (= level :error) ":    "
                   (if (= level :warning) ":  "
                       (if (= level :info) ":     "
                           (if (= level :debug) ":    "
                               (if (= level :spam) ":     "
                                   ": ")))))
               message)))
  (when (>= (. log-levels conf.log-level)
            (. log-levels level))
    (print-message (tab.concat ...))))
```

### Strings
```fennel
(fn tab.concat [...]
  (let [stab (table.pack ...)
        A (tab.make-string-appender)]
    (set stab.n nil)
    (each [_ str (pairs stab)]
      (A str))
    (A)))
```

```fennel
(fn tab.make-string-appender [?sep]
"Return a function that holds a string and accepts one additional argument (string or list of strings). If provided, the argument is appended to the held string, with SEP appended (to each one, if its a list of strings.)"
(var o "")
(lambda [?a]
  (lambda q [r]
    (set o (.. o r (or ?sep ""))) o)
  (if ?a
      (if (or (= (type ?a) :string)
              (= (type ?a) :number))
          (q ?a)
          (each [_ v (pairs ?a)]
            (q v)))
      o)))
```

```fennel
(fn tab.quibble-strings [strings ?resort ?oxfordize]
  "Return the sequence of STRINGS separated with commas and the conjunction 'and'. ?OXFORDIZE is currently irrelevant; strings are oxfordized by defualt."
  (let [oxfordize (or ?oxfordize true)
        o (tab.make-string-appender)]
    (when ?resort (table.sort strings))
    (var join "")
    (for [count 1
          (length strings) 1]
      (if (= count (length strings))
          (set join "")
          (= count (- (length strings) 1))
          (set join
               (.. (if (and oxfordize
                            (> (length strings) 2))
                       ","
                       "")
                   " and "))
          (set join ", "))
      (o [(. strings count) join]))
    (o)))
```

```fennel
(fn tab.split-string [string ?sep]
(let [words []
      matcher (string.gmatch string (or ?sep "%S+"))]
  (var done? nil)
  (while (not done?)
    (let [word (matcher)]
      (if word
          (table.insert words word)
          (set done? true))))
  words))
```

## Engine IDs and REPL
```fennel
(fn tab.make-id [?existing]
  (math.randomseed (os.time))
  ...
  (print "Starting TAB REPL")
  (iface.repl.start {:tab tab :socket socket :mime mime}))
```

## Library Models
### Thing Model
```fennel
{:name :thing
 :behaviors [:thing]
 :additive-attributes [:additive-attributes :behaviors]
 :grammar {:pronouns {:subject :it
                      :object :it
                      :determiner :its
                      :possessive :its
                      :reflexive :itself
                      :first {:subject :I
                              :object :me
                              :determiner :my
                              :possessive :mine
                              :reflexive :myself}
                      :second {:subject :you
                               :object :you
                               :determiner :your
                               :posessive :yours
                               :reflexive :yourself}}}}
```

## Behaviors
### Thing Behavior
```fennel
(local fennel (require :fennel))
(local tab (require :tab))

(local thing {})

(fn thing.fname [thing]
  (.. (if (and thing.grammar
               thing.grammar.article)
          (.. thing.grammar.article (if (> (length thing.grammar.article) 0)
                                        " "
                                        ""))
          (if (tab.find-element [:a :e :i :o :u] (string.lower
                                                  (string.sub thing.name 1 1)))
              "an "
              "a "))
      thing.name))

(fn thing.describe [thing]
  (if thing.description
      thing.description
      (.. "This is " (thing:fname) ".")))

(fn thing.name=? [thing term]
  (= thing.name term))

(fn thing.noun=? [thing term]
  (let [phrase (tab.split-string term)
        noun (. phrase (length phrase))]
    (when (and thing.grammar
               thing.grammar.nouns)
      (or (= noun thing.name)
          (tab.find-element thing.grammar.nouns noun)))))

(fn thing.adjectives=? [thing term]
  (var mismatch nil)
  (let [phrase (tab.split-string term)
        adjectives (if (> (length phrase) 1)
                       (do (table.remove phrase (length phrase))
                           phrase)
                       nil)]
    (when (and adjectives
               thing.grammar
               thing.grammar.adjectives)
      (each [_ adjective (pairs adjectives)]
        (when (not (tab.find-element adjectives adjective))
          (set mismatch true))))
    (not mismatch)))

(fn thing.term=? [thing term]
  (or (thing:name=? term)
      (and (thing:noun=? term)
           (thing:adjectives=? term))))

thing
```

## Supplements
### tab.fnl tangle target
```fennel
<<tab-header>>
<<logging>>
<<concat>>
<<make-string-appender>>
<<quibble-strings>>
<<split-string>>
<<make-id>>
<<underline>>
<<render-time>>
<<scan-directory>>
<<save-file>>
<<load-file>>
<<load-folder>>
<<collect-keys>>
<<list-values>>
<<add-values>>
<<remove-values>>
<<clone-table>>
<<find-element>>
<<drop-dupes>>
<<reverse-list>>
<<find-by>>
<<lookup-behavior>>
<<load-attributes-file>>
<<clone-attributes-from-file>>
<<collect-bases>>
<<merge-models>>
<<make-thing>>
<<seatch-things-by-term>>
<<filter-things>>

  tab
```

1.  Logging

2.  Strings

1.  Concatenating

2.  Appending

3.  Quibbling

4.  Splitting

5.  Generating

1.  IDs

``` {#make-id .fennel}
            (fn tab.make-id [?existing]
            (math.randomseed (os.time))
            (fn gen-id [x]
              (let [r (- (math.random 16) 1)
                    p (or (and (= x :x) (+ r 1)) (+ (% r 4) 9))]
                (: :0123456789abcdef :sub p p)))
            (let [gen (: :xxxxxxxx :gsub "[xy]" gen-id)]
              (print "generated" gen)
              (if (tab.find-element (or ?existing []) gen)
                  (tab.make-id ?existing)
                  gen)))
            ```

6.  Underlining

``` {#underline .fennel}
        (fn tab.underline [str]
          (let [A (tab.make-string-appender)]
            (for [i (length str) 1 -1]
              (A :-))
            (.. str "\n" (A))))
        ```

3.  Time

1.  Rendering

``` {#render-time .fennel}
        (fn tab.render-time [time ?seconds]
          "Given a Lua timecode, renders it as YYYYMMDD:HHMM, appending ?SECONDS if true."
          (os.date (if ?seconds
                       "%Y%m%d:%H%M%S"
                       "%Y%m%d:%H%M")
                   time))
        ```

4.  Files

1.  Scanning Directories

``` {#scan-directory .fennel}
        (fn tab.scan-directory [path ?recurse ?type ?strip-ext]
          "Return a list of files & directories at PATH, ?RECURSE-ing if true, limited to Files or Directories if F or D are given as the TYPE, and ?STRIP-EXT if true removes the file extension from the file names in the returned list."
          (local matches {})
          (local A (tab.make-string-appender))
          (A ["find \"" path "\""])
          (when (not ?recurse) (A " -maxdepth 1"))
          (when ?type (A [" -type " ?type]))
          (let [results (io.popen (A))]
            (each [result _ (results:lines)]
              (let [line (string.sub result (+ 2 (length path)))]
                (when (> (length line) 0)
                  (table.insert matches (if ?strip-ext
                                            (: line :sub 0 -5)
                                            line))))))
          matches)
        ```

2.  Saving File

``` {#save-file .fennel}
        (fn tab.save-file [data path ?force]
          (tab.log :debug (.. "Saving data to " path))
          (match (io.open (.. path :.fnl) :w)
            sfile (do (sfile:write (fennel.view data))
                      (sfile:close))
            (_ err) (if ?force
                        (do (os.execute
                         (.. "mkdir "
                             (string.match path "(.*[/\\])")))
                            (tab.save-file data path))
                        err)))
        ```

3.  Loading File

``` {#load-file .fennel}
        (fn tab.load-file [path ?fallback]
          "Return the evaluated contents at PATH, or the ?FALLBACK if there's no file at PATH. (Evaluated means, its been parsed by Fennel, i.e. if you load a file containing a table, load-file will return a table, not a string."
          (let [load-file (io.open (.. path ".fnl") :r)]
            (if load-file
                (let [loaded-data (load-file:read "*all")]
                  (fennel.eval loaded-data))
                (if ?fallback
                    (do
                      (tab.save-file ?fallback path)
                      (tab.load-file path))
                    (print (.. "No file at " path
                               " and no fallback given. Failed to load."))))))
        ```

4.  Loading Folder

``` {#load-folder .fennel}
        (fn tab.load-folder [path ?recurse]
          (local files-data {})
          (each [_ file-path (pairs (tab.scan-directory path ?recurse :f))]
            (local id (: file-path :sub 0 -5))
            (tset files-data id (tab.load-file (.. path :/ id))))
          files-data)
        ```

5.  Tables

1.  Collecting keys

``` {#collect-keys .fennel}
        (fn tab.collect-keys [tbl]
          "Return a list of the keys in TBL."
          (icollect [key _ (pairs tbl)] key))
        ```

2.  Listing values

``` {#list-values .fennel}
        (fn tab.list-values [tabs key]
          "Return a list of the values for KEY in each table in TABS."
          (let [lst []]
            (each [_ tab (pairs tabs)]
              (table.insert lst (. tab key)))
            (tab.drop-dupes lst)))
        ```

3.  Adding values

``` {#add-values .fennel}
        (fn tab.add-values [tab addn]
          (each [k v (pairs addn)]
            (tset tab k v)))
        ```

4.  Removing values

``` {#remove-value .fennel}
        (fn tab.remove-value [tab val]
          (each [key value (pairs tab)]
            (when (= value val)
              (table.remove tab key)))
          tab)
        ```

5.  Cloning tables

``` {#clone-table .fennel}
        (fn tab.clone-table [tab ?addn]
          (let [clone (collect [k v (pairs tab)] k v)]
            (when ?addn (tab.add-values clone ?addn))
            clone))
        ```

6.  Sequences

1.  Finding elements

``` {#find-element .fennel}
        (fn tab.find-element [seq query]
          (let [matched []]
            (each [_ element (pairs seq)]
              (when (= element query)
                (table.insert matched element)))
            (if (> (length matched) 0) true nil)))
        ```

2.  Dropping duplicates

``` {#drop-dupes .fennel}
        (fn tab.drop-dupes [seq]
          (local clean {})
          (each [key val (pairs seq)]
            (when (not (tab.find-element clean val))
              (table.insert clean val)))
          clean)
        ```

3.  Reversing

``` {#reverse-list .fennel}
        (fn tab.reverse-list [list]
          (let [rev []]
            (for [i (length list) 1 -1]
              (tset rev (+ (length rev) 1) (. list i)))
              rev))
        ```

4.  Finding-by

``` {#find-by .fennel}
        (fn tab.find-by [tbl f ?i]
          (let [x (. tbl (or ?i 1))]
            (if (= nil x) nil
                (or (f x)
                    (tab.find-by tbl f (+ 1 (or ?i 1)))))))
        ```

1.  Behaviors

1.  Lookup Behavior

``` {#lookup-behavior .fennel}
        (fn tab.lookup-behavior [key behavior-name]
          (let [behavior-file (tab.load-file (.. :behaviors/ behavior-name))]
            (if behavior-file
                (. behavior-file key)
                (tab.log :error (.. "Failed to find behavior file" behavior-name)))))
        (fn tab.lookup-behavior-method [thing key]
           (tab.find-by thing.behaviors (partial tab.lookup-behavior key)))
        ```

2.  Attributes

1.  Load attributes file

``` {#load-attributes-file .fennel}
        (fn tab.load-attributes-file [attr-path]
          (tab.load-file (.. :attributes
                              :/ attr-path)))
        ```

2.  Clone attributes from file

``` {#clone-attributes-from-file .fennel}
        (fn tab.clone-attributes-from-file [attr-path]
          (collect [k v (pairs (tab.load-attributes-file attr-path))] k v))
        ```

3.  Models

1.  Collect bases

``` {#collect-bases .fennel}
        (fn tab.collect-bases [thing ?collection ?prefix]
          (let [collection (or ?collection [])]
            (when thing.base
              (if (= (type thing.base) :string)
                  (let [model-name thing.base
                        model (tab.load-attributes-file thing.base)]
                    (when model.base
                      (tab.collect-bases model collection true))
                    (if ?prefix
                        (table.insert collection 1 model-name)
                        (table.insert collection model-name))
                    (set thing.base nil))
                  (= (type thing.base) :table)
                  (for [i (length thing.base) 1 -1]
                    (let [model-name (. thing.base i)
                          model (tab.load-attributes-file model-name)]
                      (when model.base (tab.collect-bases model collection true))
                      (if ?prefix
                          (table.insert collection 1 model-name)
                          (table.insert collection model-name)))
                    (table.remove thing.base i)
                    (when (= (length thing.base) 0) (set thing.base nil)))))
            collection))
        ```

2.  Merge models

``` {#merge-models .fennel}
        (fn tab.merge-models [base addn]
          (fn merge-lists [start mergein]
            (each [_ item (pairs mergein)]
              (table.insert start item))
            (tab.drop-dupes start))
          (each [k v (pairs addn)]
            (if (or (and base.additive-attributes
                         (tab.find-element base.additive-attributes k))
                    (and addn.additive-attributes
                         (tab.find-element addn.additive-attributes k)))
                (do (when (not (. base k)) (tset base k {}))
                    (each [q p (pairs v)]
                      (if (= (type q) :number)
                          (do (table.insert (. base k) p)
                              (tset base k (tab.drop-dupes (. base k))))
                          (tset (. base k) q p))))
                (= k :grammar)
                (do (when (not base.grammar) (set base.grammar {}))
                    (each [q p (pairs v)]
                      (when (or (= q :noun)
                                (= q :nouns))
                        (when (not base.grammar.nouns) (set base.grammar.nouns [])))
                      (if (= q :noun)
                          (table.insert base.grammar.nouns p)
                          (= q :nouns)
                          (set base.grammar.nouns (merge-lists base.grammar.nouns p))
                          (= q :adjectives)
                          (do (when (not base.grammar.adjectives) (set base.grammar.adjectives []))
                              (set base.grammar.adjectives (merge-lists base.grammar.adjectives p)))
                          (tset base.grammar q p))))
                (do (tset base k v))))
          base)
        ```

4.  Things

1.  Make thing

``` {#make-thing .fennel}
        (fn tab.make-thing [attr-path ?addn ?dimension]
          {:fnl/docstring "Make the model found at MODEL-NAME, adding in the ?ADDITIONAL attributes if provided, and setting the made thing's ?DIMENSION if provided."
           :fnl/arglist [model-name ?additional ?dimension]}
          (let [made-thing {:additive-attributes [:additive-attributes :behaviors]}
                base-collection []
                model (if (= (type attr-path) :string)
                          (tab.clone-attributes-from-file attr-path)
                          attr-path)]
            (tab.collect-bases model base-collection)
            (when ?addn (tab.collect-bases ?addn base-collection))
            (let [clean-base-collection (tab.drop-dupes base-collection)]
              (tab.log :spam "Making a thing with this base collection: "
                       (tab.quibble-strings clean-base-collection))
              (each [_ base-model-name (pairs clean-base-collection)]
                (tab.log :spam "Merging this model into the thing: " base-model-name)
                (tab.merge-models made-thing (tab.load-attributes-file base-model-name)))
              (tab.log :spam "Added base collection to thing."))
            (set model.base nil)
            (tab.merge-models made-thing model)
            (when ?addn
              (set ?addn.base nil)
              (tab.merge-models made-thing ?addn))
            (when (or (not made-thing.behaviors)
                      (and made-thing.behaviors
                           (= (length made-thing.behaviors) 0)))
              (set made-thing.behaviors [:thing]))
            (set made-thing.behaviors (tab.drop-dupes made-thing.behaviors))
            (setmetatable made-thing {:__index tab.lookup-behavior-method})
            (when ?dimension (set made-thing.dimension ?dimension)
                  (table.insert ?dimension.things made-thing))
            made-thing))
        ```

2.  Search things by term

``` {#search-things-by-term .fennel}
        (fn tab.search-things-by-term [things term ?matches]
          "Search the list of THINGS by TERM, adding them to ?MATCHES (or a fresh list)."
          (let [matches (or ?matches [])]
            (each [_ item (pairs things)]
              (when (item:term=? term)
                (table.insert matches item)))
            matches))
        ```

3.  Filter things

``` {#filter-things .fennel}
        (fn tab.filter-things [things filter-function ?matches]
          (let [matches (or ?matches [])]
            (each [_ thing (pairs things)]
              (when (filter-function thing)
                (table.insert matches thing)))
            matches))
        ```

``` {.fennel tangle="./src/tab/interfaces/repl.fnl"}
(local fennel (require :fennel))

(fn start [env]
  (print "Start Fennel REPL interface for TAB.")
  (print "Bindings available:" (table.concat (keys env) ", "))
  (fennel.repl.start {:env env}))
```

``` {#makefile .makefile tangle="./src/tab/Makefile"}
#  Makefile for TAB

LUA_VERSION=5.4.4

tab-bin: tab.fnl socket.a mime.a lua-$(LUA_VERSION)/src/liblua.a
  ./fennel --compile-binary $< $@ \
  lua-$(LUA_VERSION)/src/liblua.a lua-$(LUA_VERSION)/src \
  --native-module socket.a --native-module mime.a

lua-$(LUA_VERSION): ; curl https://www.lua.org/ftp/lua-$(LUA_VERSION).tar.gz | tar xzf /dev/stdin
lua-$(LUA_VERSION)/src/liblua.a: lua-$(LUA_VERSION)
  make -C $^

luasocket:
  git clone https://github.com/diegonehab/luasocket
  git -C luasocket checkout v3.0.0

SOCKET_OBJS= \
  luasocket/src/luasocket.o \
  luasocket/src/timeout.o \
  luasocket/src/buffer.o \
  luasocket/src/io.o \
  luasocket/src/auxiliar.o \
  luasocket/src/compat.o \
  luasocket/src/options.o \
  luasocket/src/inet.o \
  luasocket/src/except.o \
  luasocket/src/select.o \
  luasocket/src/tcp.o \
  luasocket/src/udp.o \
  luasocket/src/usocket.o # <- this one should be wsocket.o for Windows

luasocket/src/%.o: luasocket lua-$(LUA_VERSION)
  make -C luasocket/src linux install MYCFLAGS=-static \
  LUAV=5.4 DESTDIR=$(PWD) LUAINC_linux=$(PWD)/lua-$(LUA_VERSION)/src

socket.a: $(SOCKET_OBJS)
  ar rcs $@ $^

mime.a: luasocket/src/mime.o luasocket/src/compat.o
  ar rcs $@ $^

clean:
  rm -f tab-bin mime.a .a
  make -C luasocket clean
  make -C lua-$(LUA_VERSION) clean

.PHONY: run clean
```

``` {.fennel tangle="./src/tab/script.fnl"}
(local tab (require :tab))
(local socket (require :socket))
(local mime (require :mime))
(local iface {:repl (require :interfaces.repl)})

``` {.fennel tangle="./src/tab/behaviors/thing.fnl"}
