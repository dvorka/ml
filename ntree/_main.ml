(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                              Main file                                   *)
(*               Tree with various number of node sons                      *)
(*                                                                          *)
(*                            Martin Dvorak                                 *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)

use "_ntree.ml";        (* contains type decl and basic functions *)
use "_max.ml";          (* homework max *)
use "_treelst.ml";      (* homework treeList -> prefix and postfix version *)
use "_filter.ml";       (* homework filter *)
use "_xtrees.ml";       (* trees for testing *)
                        (*
                           example trees are predefined for testing:
                                itree ... tree of integers
                                stree ... tree of strings
                        *)
use "_support.ml";      (* functions for testing: isOdd, isEven *)

(*--------------------------------------------------------------------------*)

(*
 Example calls:
  - max itree;
  - treeList stree;
  - treeList itree;
  - prefix stree;
  - postfix stree;
  - filter itree isOdd;
  - filter itree isEven;
*)

(*- EOF --------------------------------------------------------------------*)