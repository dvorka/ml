(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                        Hashing: signatures                               *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(* Hash key*)

signature HASHKEYOID =
sig
        (* type of key *)
        type              HashKeyoid
        (* hash function *)
        val HashFun     : HashKeyoid -> int
        (* identity function for find *)
        val Id          : HashKeyoid -> HashKeyoid -> bool
end

(*--------------------------------------------------------------------------*)
(* Hash table *)

signature HASHTABLOID =
sig
        structure Key   : HASHKEYOID

        exception       HashIndexTooBig

        type HASHTabloid
        
        val Create : int -> HASHTabloid
        val Items  : HASHTabloid -> int
        val Insert : Key.HashKeyoid -> HASHTabloid -> HASHTabloid
        val Find   : Key.HashKeyoid -> HASHTabloid -> bool
        val InsertList : Key.HashKeyoid list -> HASHTabloid -> HASHTabloid
end

(*--------------------------------------------------------------------------*)
(* Hash table working with references *)

signature REFHASHTABLOID =
sig
        structure Key   : HASHKEYOID

        type      HASHTabloid

        exception HashIndexTooBig
        
        val Create : int -> HASHTabloid ref
        val Items  : HASHTabloid ref -> int
        val Insert : Key.HashKeyoid -> HASHTabloid ref          -> unit
        val Find   : Key.HashKeyoid -> HASHTabloid ref -> bool
        val InsertList : Key.HashKeyoid list -> HASHTabloid ref -> unit
end

(*- EOF ---------------------------------------------------------------------*)