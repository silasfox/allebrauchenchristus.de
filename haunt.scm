(use-modules (haunt asset)
             (haunt builder blog)
             (haunt builder assets)
             (haunt reader commonmark)
             (haunt site)
	     (haunt post)
	     (sxml match))

(define (layout site title content)
  `((doctype "html")
    (html
     (head
      (title "Alle brauchen Christus!")
      (meta (@ (charset "UTF-8")
	       (name "viewport")
	       (content "width=device-width, initial-scale=1.0")))
      (link (@ (rel "stylesheet")
	       (type "text/css")
	       (href "style/style.css")))
      (link (@ (rel "icon")
	       (href "images/abc.png"))))
     (body
      ,@content))))

(define (post-template post)
  (post-sxml post))

(define (collection-template site title posts url)
  `((h1 "Alle brauchen Christus!")
    (p (a (@ (href "was-soll-das-denn-heißen.html"))
	  "...auch du!"))
    (p (a (@ (href "wer-sind-wir.html"))
	  "Über uns")
       " | "
       (a (@ (href "links.html"))
	  "Weiterführende Links"))
    (h2 "Aufgepasst!")
    (p "Der nächste Gottesdienst wird am 27. 03. ab 18:00 Uhr in Hohegrete stattfinden."
       (br)
       "Es ist keine Anmeldung nötig.")
    (p "Hier noch mal die Adresse:")
    (address
     "Bibel- und Erholungsheim"(br)
      "Hohegrete MAT GmbH"(br)
      "57589 Pracht")
    (p "Bei Fragen schreib uns einfach: "
       (a (@ (href "mailto:info@allebrauchenchristus.de"))
	  "info@allebrauchenchristus.de"))))

(define abc-theme
  (theme #:layout layout
	 #:post-template post-template
	 #:collection-template collection-template))

(site #:title "Alle brauchen Christus!"
      #:domain "allebrauchenchristus.de"
      #:default-metadata
      '((author . "Silas Vedder")
        (email  . "info@allebrauchenchristus.de"))
      #:readers (list commonmark-reader)
      #:builders (list (blog #:theme abc-theme)
		       (static-directory "style")
		       (static-directory "images"))
      #:build-directory "docs")
