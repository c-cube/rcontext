(** Deadlines. *)

(** Key to access a deadline from inside the request context.
    This can be useful for systems concerned with timeout
    or cancellation of a request after a certain amount of time
    has passed. *)
let k_deadline : Mtime.t Hmap.key = Hmap.Key.create ()

let[@inline] deadline (self : Ctx.t) : Mtime.t option =
  Hmap.find k_deadline self.values

let[@inline] deadline_exn (self : Ctx.t) : Mtime.t =
  Hmap.get k_deadline self.values

let with_deadline t (ctx : Ctx.t) : Ctx.t =
  { values = Hmap.add k_deadline t ctx.values }
