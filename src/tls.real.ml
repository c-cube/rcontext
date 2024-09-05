(** {2 Ambient rcontext via thread local storage} *)

(** A way to store a rcontext in thread-local-storage.
    This depends on the {{: https://github.com/c-cube/thread-local-storage} thread-local-storage} library. *)
module Ambient_hmap : sig
  val k_hmap : Hmap.t Thread_local_storage.t
  (** Unique key to store a Hmap/rcontext in the local thread's storage *)
end = struct
  let k_hmap = Thread_local_storage.create ()
end
