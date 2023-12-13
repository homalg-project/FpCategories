#! @BeginChunk PathCategories

#    x
#     ⭮
#      0
#     s ⭝   a
#        1 ----🡢 2
#        | ⭝     |
#       c|   ⭝ e |b
#        🡣     ⭝ 🡣
#        3 ----🡢 4
#            d    ⭝ t
#                  5
#                   ⭯
#                    y


#! @Example
LoadPackage( "FpCategories", false );
#! true
str :=
  "q(0..5)[x:0->0,s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5,y:5->5]";;
q := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,
#! t:4-≻5,y:5-≻5]" )
C := PathCategory( q );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,
#! b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) )
Display( C );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,
#! a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ):
#!
#! 15 primitive operations were used to derive 30 operations for this category
SetOfObjects( C );
#! [ (0), (1), (2), (3), (4), (5) ]
SetOfGeneratingMorphisms( C );
#! [ x:(0) -≻ (0), s:(0) -≻ (1), a:(1) -≻ (2), c:(1) -≻ (3), e:(1) -≻ (4),
#!   b:(2) -≻ (4), d:(3) -≻ (4), t:(4) -≻ (5), y:(5) -≻ (5) ]
C.5;
#! (5)
ObjectIndex( C.5 );
#! 6
C.id_5;
#! id(5):(5) -≻ (5)
C.("id(5)");
#! id(5):(5) -≻ (5)
m := C.("x^2*s*a*b*t*y^2");
#! x^2⋅s⋅a⋅b⋅t⋅y^2:(0) -≻ (5)
m := C.("x^2sabty^2");
#! x^2⋅s⋅a⋅b⋅t⋅y^2:(0) -≻ (5)
IsWellDefined( m );
#! true
MorphismLength( m );
#! 8
MorphismIndices( m );
#! [ 1, 1, 2, 3, 6, 8, 9, 9 ]
MorphismSupport( m );
#! [ x:(0) -≻ (0), x:(0) -≻ (0), s:(0) -≻ (1), a:(1) -≻ (2), b:(2) -≻ (4),
#! t:(4) -≻ (5), y:(5) -≻ (5), y:(5) -≻ (5) ]
relations := [ [ C.x^5, C.x ], [ C.y^5, C.y^2 ] ];;
m = MorphismConstructor( C,
        Source( m ), MorphismLength( m ), MorphismSupport( m ), Target( m ) );
#! true
qC := QuotientCategory( C, relations );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,
#! b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ]
Display( qC );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,
#! a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ]:
#!
#! 25 primitive operations were used to derive 64 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
qC.0;
#! (0)
ObjectIndex( qC.0 );
#! 1
qC.x^7;
#! [x^3]:(0) -≻ (0)
CanonicalRepresentative( qC.x^7 );
#! x^3:(0) -≻ (0)
HomomorphismStructureOnObjects( qC.0, qC.5 );
#! |75|
List( SetOfGeneratingMorphisms( qC ), IsMonomorphism );
#! [ false, true, true, true, true, true, true, true, false ]
List( SetOfGeneratingMorphisms( qC ), IsEpimorphism );
#! [ false, true, true, true, true, true, true, true, false ]
LoadPackage( "Algebroids", false );
#! true
k := HomalgFieldOfRationals();
#! Q
kC := k[C]; # or LinearClosure( k, C );
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) )
kC.x + kC.x^2;
#! 1*x^2 + 1*x:(0) -≻ (0)
kqC := k[qC];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[x:0-≻0,s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5,y:5-≻5]" ) ) / [ x^5 = x, y^5 = y^2 ] )
HomomorphismStructureOnObjects( kqC.0, kqC.5 );
#! <A row module over Q of rank 75>
kqC.x + kqC.x^2;
#! 1*[x^2] + 1*[x]:(0) -≻ (0)
List( SetOfGeneratingMorphisms( kqC ), IsMonomorphism );
#! [ false, true, true, true, true, true, true, true, false ]
List( SetOfGeneratingMorphisms( kqC ), IsEpimorphism );
#! [ false, true, true, true, true, true, true, true, false ]
homs := BasisOfExternalHom( kqC.0, kqC.5 );;
mor := 2 * homs[1] - 3 * homs[4] + homs[75];
#! 2*[x^4⋅s⋅a⋅b⋅t⋅y^4] - 3*[x^4⋅s⋅c⋅d⋅t⋅y^3] + 1*[s⋅e⋅t]:(0) -≻ (5)
EvalString( CellAsEvaluatableString( mor, [ "kqC", "qC", "C" ] ) ) = mor;
#! true
A := AlgebroidFromDataTables( kqC );
#! Q-algebroid( {0,1,2,3,4,5}[x:0-≻0,s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,
#! t:4-≻5,y:5-≻5] ) defined by 6 objects and 9 generating morphisms
HomomorphismStructureOnObjects( A.0, A.5 );
#! <A row module over Q of rank 75>
A.x + A.x^2;
#! <1*x^2 + 1*x:(0) -≻ (0)>
#! @EndExample

#! @Example
LoadPackage( "Algebroids", false );
#! true
str := "q(0,1,2,3,4,5)[s:0->1,a:1->2,c:1->3,e:1->4,b:2->4,d:3->4,t:4->5]";;
quiver := FinQuiver( str );
#! FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" )
P := PathCategory( quiver );
#! PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,
#! d:3-≻4,t:4-≻5]" ) )
Display( P );
#! A CAP category with name PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,
#! c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" ) ):
#!
#! 16 primitive operations were used to derive 64 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
HomStructure( P.0, P.5 );
#! |3|
k := HomalgFieldOfRationals( );
#! Q
kP := k[P];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3,4,5)[s:0-≻1,a:1-≻2,c:1-≻3,
#! e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5]" ) ) )
HomStructure( kP.0, kP.5 );
#! <A row module over Q of rank 3>
T := AlgebroidFromDataTables( kP );
#! Q-algebroid( {0,1,2,3,4,5}[s:0-≻1,a:1-≻2,c:1-≻3,e:1-≻4,b:2-≻4,d:3-≻4,t:4-≻5] )
#! defined by 6 objects and 7 generating morphisms
HomStructure( T.0, T.5 );
#! <A row module over Q of rank 3>
#! @EndExample
