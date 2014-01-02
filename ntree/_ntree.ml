(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                Tree with various number of node sons                     *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)

datatype 'a NTREE =  NTreeNil |
         NTree    of 'a * 'a NTREE list;

(*--------------------------------------------------------------------------*)
(* selectors for NTree *)

exception LeaveHaveNoValue;
exception LeaveHaveNoSons;

fun getVal (NTree( Val, SonList )) = Val |
    getVal _                       = raise LeaveHaveNoValue;

fun getSonList (NTree( Val, SonList )) = SonList |
    getSonList _                       = raise LeaveHaveNoSons;

(*--------------------------------------------------------------------------*)
(* insert son *)

exception ErrorWhenInserting;

fun insertSon (NTree( value, list))    son = NTree( value, (list @ [son])) |
    insertSon  _                       _   = raise ErrorWhenInserting;

(*- EOF --------------------------------------------------------------------*)