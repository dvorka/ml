(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                          Hashing: example2                               *)
(*                 Collection of numbers through reference                  *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)

use "_sigs.ml";
use "_functor.ml";

(*--------------------------------------------------------------------------*)
(* Specify new key: type of key, hash function and same function *)

structure IntKey : HASHKEYOID =
struct
    type HashKeyoid = int;                                 (* type of key *)
    fun  HashFun key = key mod 30                          (* hash function *)
    fun Id key1 key2 = if key1 = key2 then true else false (* key identity *)
end

(*- Program ----------------------------------------------------------------*)

(* specify new type of hash table *)
structure IntCollection    = UniHashTabloid( IntKey );           (* normal *)
(* ! using reference funktor *)
structure RefIntCollection = UniRefHashTabloid( IntCollection );

fun FillTable x step table =
    let
     val counter    = ref 0;
    in
     while !counter < x do
      (
       RefIntCollection.Insert (!counter) table;
       counter := !counter + step
      );
      table
    end;

val Sevenths = FillTable 130 7 (RefIntCollection.Create 30);

(* show result table *)
!Sevenths;

(*- EOF ---------------------------------------------------------------------*)