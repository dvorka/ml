(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                  prefix/postfix treeList for NTree           	    *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(* exceptions *)

exception UFONodeInPrefix;
exception UFONodeInPostfix;

(*--------------------------------------------------------------------------*)
(* prefix *)

fun prefix (NTree(Val, [] ))      = [Val] |		(* make one node *)
    prefix (NTree(Val, sonList )) =
    	let                       
	       fun preSons []     = [] |		(* make sons *)
         	   preSons (H::T) = (prefix H) @ (preSons T);
        in
    		Val::(preSons sonList) 
        end |
    prefix _            = raise UFONodeInPrefix;

(*--------------------------------------------------------------------------*)
(* postfix *)

fun postfix (NTree(Val, [] ))     = [Val] |
    postfix (NTree(Val, H::T   )) = (postfix H) @ (postfix (NTree(Val,T))) |
    postfix _                     = raise UFONodeInPostfix;

(*--------------------------------------------------------------------------*)
(* treeList *)

fun treeList tree = postfix tree;

(*- EOF --------------------------------------------------------------------*)