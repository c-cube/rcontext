(** Deadlines *)

(** {2 Deadlines}

  Depends on [mtime]. *)

(** Key to access a deadline from inside the request context.
    This can be useful for systems concerned with timeout
    or cancellation of a request after a certain amount of time
    has passed. *)
let k_deadline : Mtime.t Hmap.key = Hmap.Key.create ()

let[@inline] deadline (self : Ctx.t) : Mtime.t option =
  Hmap.find k_deadline self

(** @raise Invalid_argument if no deadline was defined *)
let[@inline] deadline_exn (self : Ctx.t) : Mtime.t = Hmap.get k_deadline self

(** Set deadline *)
let[@inline] with_deadline t (ctx : Ctx.t) : Ctx.t = Hmap.add k_deadline t ctx

(** Has the deadline been reached? This uses {!Mtime_clock.now} to compare
 it to the stored deadline. If there is no deadline then this returns [false]. *)
let expired (ctx : Ctx.t) : bool =
  match deadline ctx with
  | None -> false
  | Some t ->
    let now = Mtime_clock.now () in
    Mtime.is_later now ~than:t
