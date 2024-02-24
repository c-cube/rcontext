(** Main type *)

type 'a key = 'a Hmap.key
(** Key to access a certain value in the context *)

type t = { values: Hmap.t } [@@unboxed]
(** A request context *)

(** Empty context *)
let empty : t = { values = Hmap.empty }
