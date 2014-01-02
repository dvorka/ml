(*--------------------------------------------------------------------------*)
(*                                                                          *)
(*                    Hashing: functors of hash tables                      *)
(*                                                                          *)
(*                               Dvorka                                     *)
(*                                1998                                      *)
(*--------------------------------------------------------------------------*)
(* Hash table implementation *)

functor UniHashTabloid ( SpecialKey : HASHKEYOID ) : HASHTABLOID =
struct
    structure Key = SpecialKey

    exception       HashIndexTooBig

    (*                    ( size, [ (key,[CollisionList]) ] *)
    type HASHTabloid = ( int * ( (int * Key.HashKeyoid list) list ))

    fun Create size = ( size, [] )
    fun Items  ( size, []   ) = size |
        Items  ( size, H::T ) = size

    fun Insert item (size,table) =
        let
         fun Ins item [] =                    (* key not in table yet - add *)
              [((Key.HashFun item), [item])] |(* return new table *)
             Ins item ((k,ColisionLst)::T) =
              if (Key.HashFun item) = k then  (* already in -> collision *)
                (k,(item::ColisionLst))::T
              else
                (k,ColisionLst)::(Ins item T)
        in
         if (Key.HashFun item) < size then   (* check key size *)
          (size,(Ins item table))            (* OK work directly with table *)
         else
          raise HashIndexTooBig
        end

    fun Find item (size,table) =
        let
         fun fnd []                   = false | (* not in table -> false *)
             fnd ((k,ColisionLst)::T) =
              if (Key.HashFun item)   = k then  (* check collision list *)
               let
                fun cl []     = false |
                    cl (h::t) = if (Key.Id h item) then true else (cl t)
               in
                cl ColisionLst
               end
              else
                fnd T
        in
         if (Key.HashFun item) < size then   (* check if key has right size *)
          fnd table
         else
          raise HashIndexTooBig
        end

    fun InsertList []     table = table |
        InsertList (H::T) table = InsertList T (Insert H table)

end

(*--------------------------------------------------------------------------*)
(* Reference to hash table implementation *)

functor UniRefHashTabloid( UniHash : HASHTABLOID ) : REFHASHTABLOID =
struct
    structure Key    = UniHash.Key
    type HASHTabloid = UniHash.HASHTabloid

    exception       HashIndexTooBig

    fun Create size = let
                        val table = ref (UniHash.Create size)
                      in
                        table
                      end

    fun Items table = UniHash.Items (!table)

    fun Insert item itable = itable := (UniHash.Insert item (!itable) )
         

    fun Find item table = UniHash.Find item (!table)

    fun InsertList list itable = itable := (UniHash.InsertList list (!itable))

end

(*- EOF ---------------------------------------------------------------------*)