(** Main type *)

(** {2 Main type definition} *)

type 'a key = 'a Hmap.key
(** Key to access a certain value in the context *)

type t = Hmap.t
(** A request context. This is simply a hmap, and standard keys
    into it are provided in the rest of the library. *)

(** Empty context *)
let empty : t = Hmap.empty
