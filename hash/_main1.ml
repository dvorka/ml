(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                          Hashing: example1                               *)
(*                           Ratsputin keys                                 *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)

use "_sigs.ml";
use "_functor.ml";

(*--------------------------------------------------------------------------*)
(* Specify new key: type of key, hash function and same function *)

structure ThiefKey : HASHKEYOID =
struct
    type HashKeyoid = (int*string);                   (* type of key *)
    fun  HashFun ( key, building ) = key mod 200      (* hash function *)
    fun  Id ( key1, building1 ) ( key2, building2 ) = (* identity for find *)
          if key1 = key2 andalso building1 = building2 then true else false
end

(*- Program ----------------------------------------------------------------*)

(* specify new type of hash table *)
structure Thief = UniHashTabloid( ThiefKey );

(* some info *)
val ThiefInfo = [ (1728,"The Simpsons"),
                  ( 323,"The Bundas"),
                  (  90,"footware"),
                  (  38,"The Adams"),
                  ( 890,"MS Bill Building"),
                  (  90,"slaughterhouse"),
                  (  70,"butchery"),
                  ( 180,"Police station"),
                  (  30,"Fire station")
                ];

(* create hash table *)
val Ratsputin = Thief.InsertList ThiefInfo (Thief.Create 200);

(* some test *)
local
 open Thief
in
 val Simpsons = Find (1728,"The Simpsons") Ratsputin
end

(*- EOF ---------------------------------------------------------------------*)