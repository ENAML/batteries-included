open BatStd
(**  Monadic results of computations that can raise exceptions *)

type ('a, 'b) t = ('a, 'b) result 
(** The type of a result*)

val catch: ('a -> 'b) -> 'a -> ('b, exn) result
(** Execute a function and catch any exception as a [!result]*)

val of_option: 'a option -> ('a, unit) result
(** Convert an [option] to a [result]*)

val to_option: ('a, _) result -> 'a option
(** Convert a [result] to an [option]*)

val bind:    ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** Monadic composition.

    [bind r f] proceeds as [f x] if [r] is [Ok x], or returns [r] if
    [r] is an error.*)

val ( >>= ): ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
(** as [bind] *)

val return : 'a -> ('a, _) result
(** Monadic return, just encapsulates the given value with Ok *)

val default: 'a -> ('a, _) result -> 'a
(** [result d r] evaluates to [d] if [r] is [Bad] else [x] when [r] is
    [Ok x] *)

val default_map : 'b -> ('a -> 'b) -> ('a, _) result -> 'b
(** [default_map d f r] evaluates to [d] if [r] is [Bad] else [f x]
    when [r] is [Ok x] *)


(** {6 Boilerplate code}*)
