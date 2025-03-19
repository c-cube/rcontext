(** {2 Ambient rcontext via thread local storage} *)

(** A way to store a rcontext in thread-local-storage.
    This depends on the {{: https://github.com/c-cube/thread-local-storage} thread-local-storage} library. *)
module Thread_local : sig
  val k_context : Ctx.t Thread_local_storage.t
  (** Unique key to store a Hmap/rcontext in the local thread's storage *)

  val get_context : unit -> Ctx.t option
  (** Access the current context *)

  val get_context_or_empty : unit -> Ctx.t
  (** Access the current context, or the empty context *)

  val set_context : Ctx.t -> unit
  (** Set the context for the current thread *)
end = struct
  module TLS = Thread_local_storage

  let k_context = TLS.create ()
  let[@inline] get_context () = TLS.get_opt k_context

  let[@inline] get_context_or_empty () =
    try TLS.get_exn k_context with TLS.Not_set -> Ctx.empty

  let[@inline] set_context ctx = TLS.set k_context ctx
end
