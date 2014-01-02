(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                           max for NTree                                  *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(* max, integer return value type is explicitly specified *)

exception UnknownNodeInGetMax;

fun max (NTree(Val, [] )):int = Val |
    max (NTree(Val, H::T ))   = let
                                        val maxH = max H;
                                        val maxT = max (NTree(Val,T));
                                in
                                        if maxH>maxT then maxH else maxT
                                end |
    max _                     = raise UnknownNodeInGetMax;

(*- EOF --------------------------------------------------------------------*)