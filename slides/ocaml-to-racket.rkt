#lang slideshow

(require slideshow/text)

;; Title
(slide
  #:title "CMSC 430, Jan 30th 2020"
  (with-size 64 (tt "OCaml to Racket")))

;; Stuff I forgot from last time
(slide
  #:title "Admin take 2"
  'next
  (item "My name: José")
  'next
  (item "My email (for now): " (tt "jmct@jmct.cc"))
  'next
  (item "Website: " (tt "cs.umd.edu/class/spring2020/cmsc430/")) )

;; Remind them that OCaml is 'cool'
(slide
  #:title "OCaml, my Caml"
  'next
  (item "OCaml is nice.")
  'next
  (item "It's got all the trimmings of a modern ergonomic programming languages")
  'next
  (subitem "Garbage Collection")
  'next
  (subitem "Higher-order functions")
  'next
  (subitem "Anonymous functions")
  'next
  (subitem "Generic types (via parametric polymorphism)")
  'next
  (subitem "Pattern matching")
  'next
  (subitem "Kind of amazing that it's over 30 years old!"))

;; Tell them we are using Racket
(slide
  #:title "Bop it, twist it, Racket!"
  'next
  (item "In this course we are going to use" (text "Racket" '(italic) (current-font-size)))
  'next
  (subitem "Don't let this worry you, your OCaml skills will apply!")
  'next
  (subitem "This lecture and the next will be about learning how to transfer those skills"))

;; When was Racket made (answer to question #1)
(slide
  #:title "What a Racket"
  'next
  (item "In the 90s, the PL group Northeastern University had developed" (tt "PLT Scheme") ", a dialect of LISP")
  'next
  (item "Eventually (in 2010), the differences between" (tt "PLT Scheme") "and" (tt "scheme") "could no longer be reconciled")
  'next
  (item "So" (tt "PLT Scheme") "was renamed to" (tt "Racket")))

;; Why? (answer to question #2)
(slide
  #:title "Why?"
  'next
  (item "PLT Scheme was original aimed as a" (text "pedagogical" '(italic) (current-font-size)) "tool for those learning programming and PLT")
  'next
  (item "Racket has a notion of 'language levels'")
  'next
  (subitem "This allows features to be enabled/disabled so that they can be learned/understood individually")
  'next
  (subitem "This idea was extended even further to allow user-defined custom languages (which can be used as DSLs!)"))

;; Cool code (answer to question #3)
(require slideshow/code)
(slide
 #:title "Racket Code"
 (para "Racket code can take a bit to get used to reading, but its uniform structure makes it easy to learn")
 'next
 (para "The code for the first slide looked like this:")
 (code (slide
          #:title "OCaml to Racket"
          (item "CMSC 430, Jan 30th 2020"))))

;; Is it still used (answer to question #3)
(slide
  #:title "Do people use it?"
  'next
  (item "Racket is still used today")
  'next
  (subitem "Primarily as a research tool (mostly academia, some industry)")
  'next
  (subitem "As a platform for experimenting with all aspects of programming language design"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Racket tutorial starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(slide
  #:title "Racket, how to get it:"
  'next
  (item "You've got some options")
  'next
  (subitem "go to" (tt "download.racket-lang.org"))
  'next
  (subitem "Use a package manager (apt/yum/pacman/homebrew/etc.)")
  'next
  (subitem "Wait until we get a server set up for you all"))

(slide
  #:title "Racket, how to use it:"
  'next
  (item "You've got some options!")
  'next
  (subitem "Use Dr. Racket, the IDE made and supported by the Racket team")
  'next
  (subitem "Be like me, from the 80's, and develop everything in a text editor"))

;; Import the library for doing REPLs
(require slideshow/repl)

;; Only show strings or numbers
(slide
  #:title "A R.E.P.L. (or repl)"
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/2)
    #:width (* client-w 9/10)
    ""))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arithmetic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; OCaml arithmetic
(slide
  #:title "Arithmetic"
  'next
  (item "In OCaml, arithmetic was pretty straightforward:")
  'next
  'alts
  (list (list (tt "> 1 + 2 * 2;;")
              (tt "- : int = 5"))
        (list (tt "> (1) + (2 * 2);;")
              (tt "- : int = 5"))
        (list (tt "> (((1))) + ((2) * 2);;")
              (tt "- : int = 5"))))

;; Racket arithmetic
(slide
  #:title "Arithmetic in Racket"
  'next
  (item "In Racket, an open bracket," (tt "(") ", means function application")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    ""))

;; Racket arithmetic pt 2
(slide
  #:title "Arithmetic in Racket"
  (item "This mean redundant brackets don't mean what you think!")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    ""))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lambdas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; OCaml Lambdas
(slide
  #:title "Fun(ctions)!"
  'next
  (item "Anonymous functions were straightforward in OCaml")
  'next
  'alts
  (list (list (tt "> fun x y -> x + y;;")
              (tt "- : int -> int -> int = <fun>"))
        (list (tt "> (fun x y -> x + y) 3 4;;")
              (tt "- : int = 7"))
        (list (tt "> (fun x y -> x + y) 3;;")
              (tt "- : int -> int = <fun>")
              'next
              (t "Partial application!"))))

(slide
  #:title "Fun in Racket"
  'next
  (item "In OCaml we had:" (tt "fun x y -> x + y"))
  'next
  (item "What's that look like in Racket?")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    ""))

(slide
  #:title "Get the clickers out"
  'next
  (item "What's this mean, in Racket?")
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(λ (x)
        (λ (y)
           (+ x y))) 3 4")
  'next
  (subitem "A) 7 ")
  'next
  (subitem "B) error")
  'next
  (subitem "C) Something else"))

(slide
  #:title "The right way"
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "((λ (x)
        (λ (y)
           (+ x y))) 3 4)"))

(slide
  #:title "Fun in Racket"
  'next
  (item "In OCaml we had:" (tt "(fun (x, y) -> x + y) (3, 4)"))
  'next
  (item "What's that look like in Racket?")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "((λ (x y)
        (+ x y)) ??)"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; OCaml Defs
(slide
  #:title "Let's take a look"
  'next
  (item "Definitions in OCaml used" (tt "let"))
  'next
  'alts
  (list (list (tt "> let x = 3;;")
              (tt "val x : int = 3"))
        (list (tt "> let y = 4;;")
              (tt "val y : int = 4"))
        (list (tt "> x + y;;")
              (tt "- : int = 7"))
        (list (item "This is true for functions, too")
              'next
              (tt "> let mul a b = a * b;;")
              (tt "val mul : int -> int -> int = <fun>")
              'next
              (tt "> mul x y;;")
              (tt "- : int = 12"))))

(slide
  #:title "Defs in Racket"
  'next
  (item "In Racket we define things with" (tt "define"))
  'next
  'alts
  (list (list (repl-area
                #:prompt "430> "
                #:height (* client-h 1/3)
                #:width (* client-w 9/10)
"(define x 3)
     (define y 4)
     (+ x y)"))
        (list (item "Also true for functions")
              'next
              (repl-area
                #:prompt "430> "
                #:height (* client-h 1/3)
                #:width (* client-w 9/10)
"(define mul
       (λ (a b)
          (* a b)))
     (mul 3 4)"))))

(slide
  #:title "Defs in Racket"
  (item "There's a shorthand for function definitions that lets us avoid the lambda")
  (code (define (mul a b)
          (* a b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; OCaml Lists
(slide
  #:title "Lists"
  'next
  (item "Lists are the bread-and-butter of functional programming")
  'next
  (tt "> 1 :: 2 :: 3 :: [];;")
  (tt "- : int list = [1; 2; 3]"))

; Racket lists
(slide
  #:title "Pros and Cons"
  'next
  (item "What's that look like in Racket?")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(cons 1 (cons 2 (cons 3 '())))"))

(slide
  #:title "Pros and Cons"
  (item "Luckily there's a helper function for this")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(list 1 2 3)"))

(slide
  #:title "Get the clickers out"
  'next
  (item "Is this a valid OCaml definition?")
  (item (tt "let xs = [\"jazz\"; 1959];;"))
  'next
  (subitem "A) Yes")
  'next
  (subitem "B) No")
  'next
  (subitem "C) I don't understand the question and I won't respond to it."))

(slide
  #:title "Pros of Cons"
  (item "Racket is Dynamically typed, so the following is perfectly valid")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(list \"jazz\" 1959)"))

(slide
  #:title "Pairs _are_ Cons"
  (item "Because Racket is dynamically typed, constructing pairs is the same thing as constructing lists")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(cons \"jazz\" 1959)
    (cons \"hip hop\" 2015)"))

; This is where we got at the end of the first ocaml-racket lecture
(slide
  #:title "Assignment #1"
  'next
  (item "Learning about a Programming Language")
  'next
  (item "Email me the solution, ensuring that the subject starts with" (tt "[Assignment 1]"))
  'next
  (item "Details are posted on the website (including which languages you can't discuss)")
  'next
  (item "The first few slides of this lecture (about Racket) is basically the level of detail I'm looking for")
  'next
  (item "Go, you're free."))

(slide
  #:title "Lists (cons) of pairs (cons)"
  (item "Structured data is nice, let's make a dictionary.")
  'next
  (repl-area
    #:prompt "430> "
    #:height (* client-h 2/3)
    #:width (* client-w 9/10)
    "(require \"genre-years.rkt\")"))

(slide
  #:title "Destructors"
  (repl-area
    #:prompt "430> "
    #:height (* client-h 2/3)
    #:width (* client-w 9/10)
    "(car (cons \"hip hop\" 2015))"
    "(cdr (cons \"soul\" 1970))"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pattern Matching
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(slide
  #:title "Pattern Matching!"
  (item "Just like in OCaml, we can pattern match to help us define functions")
  'next
  'alts
  (list (list (code (define (swap p)
                      (match p
                        [(cons x y) (cons y x)]))))
        (list (code (define (is-two-or-four n)
                      (match n
                        [2 #t]
                        [4 #t]
                        [_ #f]))))
        (list (code (define (sum xs)
                      (match xs
                        ['() 0]
                        [(cons y ys)
                         (+ x (sum xs))]))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Datatypes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(slide
  #:title "Datatypes"
  'next
  (item "One of the more elegant features of typed-functional PLs is algebraic datatypes")
  'next
  'alts
  (list (list (subitem (tt "type bt = Leaf | Node of int * bt * bt"))
              'next
              (subitem "Defining and then pattern matching on ADTs is a very powerful tool for reasoning about programs"))
        (list (item "Racket does not have ADTs directly, but we can get close with" (tt "struct"))
              'next
              (subitem (tt "struct") "lets us define a structured value")
              'next
              (subitem "i.e. like a single constructor from a datatype in OCaml")
              'next
              (subitem "But then we can use it for pattern matching!"))))

(slide
  #:title "Structs"
  'next
  (item "Let's try to emulate the binary tree we showed in OCaml")
  'next
  (para
    #:align 'left
    (code (struct leaf ())))
  'next
  (para
    #:align 'left
    (code (struct node (i left right)))))

(slide
  #:title "Structs in the REPL"
  (repl-area
    #:prompt "430> "
    #:height (* client-h 1/3)
    #:width (* client-w 9/10)
    "(struct leaf ())
    (struct node (i left right))"))

(slide
  #:title "Pattern matching on structs"
  'next
  (item "Defining a function that checks whether a tree is empty")
  'next
  (para
    #:align 'left
    (code (define (bt-empty? bt)
            (match bt
              [(leaf)       #t]
              [(node _ _ _) #f])))))

(slide
  #:title "Defining accessors"
  'next
  (para
    #:align 'left
    (code (define (get-elem bt)
            (match bt
              [(leaf)       '()]
              [(node i _ _) (cons i '())])))))
