(** Start time *)

(** {2 Start time for a request or task}.

 Depends on [mtime]. *)

(** Instant at which an action was started, a request was received, etc.
    This can be useful for middlewares related to timing, tracing, latency statistics, etc. *)
let k_start_time : Mtime.t Hmap.key = Hmap.Key.create ()

let[@inline] start_time (self : Ctx.t) : Mtime.t option =
  Hmap.find k_start_time self.values

let[@inline] start_time_exn (self : Ctx.t) : Mtime.t =
  Hmap.get k_start_time self.values

let with_start_time t (ctx : Ctx.t) : Ctx.t =
  { values = Hmap.add k_start_time t ctx.values }

let with_start_time_now (ctx : Ctx.t) : Ctx.t =
  let now = Mtime_clock.now () in
  with_start_time now ctx
