(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                          filter for NTree                                *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(* filter *)

exception FilterError;

fun filter NTreeNil boolFun = NTreeNil |
    filter tree     boolFun =
     let
      fun checkNode (NTree( Val, SonList )) =
           let
            fun checkSons []          = [] |
                checkSons (H::T)      =
                 if boolFun (getVal H) then
                  (checkNode H)             :: (checkSons T)
                 else
                  (getSonList (checkNode H)) @ (checkSons T);
           in
            NTree( Val, (checkSons SonList) )
           end |                checkNode _ = raise FilterError;
     in
         if boolFun (getVal tree) then
            checkNode tree
         else
            ( fn (NTree(Val,H::T)) => NTree(getVal H,(getSonList H) @ T)  |
                 (NTree(Val, [] )) => NTreeNil | _ => raise FilterError)
            (checkNode tree)       (* fix root only in this case -> fn *)
     end;

(*- EOF --------------------------------------------------------------------*)