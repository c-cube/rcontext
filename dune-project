(lang dune 2.9)

(name rcontext)
(version 0.1)
(generate_opam_files true)
(source
 (github c-cube/context))
(authors "Simon Cruanes")
(maintainers "Simon Cruanes")
(license MIT)

;(documentation https://url/to/documentation)

(package
 (name rcontext)
 (synopsis "Generic request handling context to carry around, inspired from Go's")
 (depends
  (ocaml (>= 4.08))
  hmap
  dune
  (odoc :with-doc))
 (depopts
   mtime)
 (tags
  (context)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
