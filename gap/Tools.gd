# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Tools

####################################
#
#! @Section Properties
#
####################################

#! @Description
#!  Is the category <A>C</A> finitely presented.
#!  This property is true by construction for finitely presented categories generated by finite quivers.
#! @Arguments C
DeclareProperty( "IsFinitelyPresentedCategory",
        IsCapCategory );

AddCategoricalProperty( [ "IsFinitelyPresentedCategory", "IsFinitelyPresentedCategory" ] );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  The defining triple of the quiver underlying the finitely presented category <A>C</A>.
#! @Arguments C
#! @Returns a pair
DeclareAttribute( "DefiningTripleOfUnderlyingQuiver",
        IsCapCategory );

CapJitAddTypeSignature( "DefiningTripleOfUnderlyingQuiver", [ IsCapCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfNTupleOf( 3,
                   IsInt,
                   IsInt,
                   CapJitDataTypeOfListOf(
                           CapJitDataTypeOfNTupleOf( 2,
                                   IsInt,
                                   IsInt ) ) );
    
end );

#! @Description
#!  The data tables of the category <A>C</A>.
#! @Arguments C
#! @Returns a pair of lists
DeclareAttribute( "DataTablesOfCategory",
        IsCapCategory );
