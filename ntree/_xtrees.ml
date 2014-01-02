(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                          Example NTrees                                  *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(*
  Example string NTREE:
               one
      two      three    five
  seven nine   eight
*)

val stree =
            insertSon
            (
             insertSon
             (
              insertSon (NTree("one",[]))
              (
               insertSon
               (
                insertSon (NTree("two",[]))
                (NTree("seven",[]))
               )
               (NTree("eight",[]))
              )
             )
             (insertSon (NTree("three",[])) (NTree("nine",[])))
            )
            (NTree("five",[]));

(*--------------------------------------------------------------------------*)
(*
  Example integer NTREE :
        1
   2    3    5
  7 8   9
*)

val one =NTree( 1, [] );
val two =NTree( 2, [] );
val three=NTree( 3, [] );
val five =NTree( 5, [] );
val seven=NTree( 7, [] );
val eight=NTree( 8, [] );
val nine=NTree( 9, [] );

val itree =
            insertSon
            (
             insertSon
             (
              insertSon
              one
              (
               insertSon (insertSon two seven) eight
              )
             )
             (insertSon three nine)
            )
            five;

(*- EOF --------------------------------------------------------------------*)