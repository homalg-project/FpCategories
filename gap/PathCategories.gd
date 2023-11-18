# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Path Categories

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of path categories.
DeclareCategory( "IsPathCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in path categories.
DeclareCategory( "IsPathCategoryObject",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in path categories.
DeclareCategory( "IsPathCategoryMorphism",
        IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  The input is a &CAP; quiver <A>q</A>.
#!  The output is the path category of <A>q</A>, i.e., the category whose objects are the objects of <A>q</A>
#!  and whose morphisms are lists of morphisms in <A>q</A>, in which the target of any morphism
#!  is equal to the source of the next morphism.
#! @Arguments q
#! @Returns a &CAP; category
DeclareOperation( "PathCategory", [ IsFinQuiver ] );


if false then
#! @Description
#!  The input is a path category <A>C</A> of &CAP; quiver $q$ and a positive integer <A>i</A>.
#!  The output is the <A>i</A>'th object in <A>C</A>.
#! @Arguments C, i
#! @Returns a &CAP; category object
DeclareOperation( "ObjectConstructor", [ IsPathCategory, IsInt ] );

#! @Description
#!  The input is a path category <A>C</A> of &CAP; quiver $q$, two objects <A>s</A>, <A>t</A>
#!  a nonnegative integer <A>length</A> and a list <A>support</A> of length <A>l</A>
#!  consisting of morphisms in $q$ where the target of each morphism is equal to the source of the next morphism.
#!  The output is the morphism in <A>C</A> whose length is <A>l</A> and whose support is <A>support</A>.
#! @Arguments C, s, l, support, t
#! @Returns a &CAP; category object
DeclareOperation( "MorphismConstructor", [ IsPathCategory, IsPathCategoryObject, IsInt, IsDenseList, IsPathCategoryObject ] );
fi;

#! @Description
#!  Assigns the objects of <A>C</A> to global variables.
#!  Names of the variables are the concatenation of <A>str</A> with the labels of the objects.
#!  The default value of <A>str</A> is the empty string.
#! @Arguments C [, str]
#! @Returns nothing
DeclareOperation( "AssignSetOfObjects", [ IsPathCategory, IsString ] );

#! @Description
#!  Assigns the generating morphisms of <A>C</A> to global variables.
#!  Names of the variables are the concatenation of <A>str</A> with the labels of the generating morphisms.
#!  The default value of <A>str</A> is the empty string.
#! @Arguments C [, str]
#! @Returns nothing
DeclareOperation( "AssignSetOfGeneratingMorphisms", [ IsPathCategory, IsString ] );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Returns the defining quiver of the path category <A>C</A>.
#! @Arguments C
#! @Returns a list of &CAP; category objects
DeclareAttribute( "UnderlyingQuiver", IsPathCategory );

#! @Description
#!  Returns the set of objects of <A>C</A>.
#! @Arguments C
#! @Returns a list of &CAP; category objects
DeclareAttribute( "SetOfObjects", IsPathCategory );

#! @Description
#!  Returns the set of generating morphisms of <A>C</A>.
#! @Arguments C
#! @Returns a list of &CAP; category morphisms
DeclareAttribute( "SetOfGeneratingMorphisms", IsPathCategory );

#! @Description
#!  Returns the index of the object <A>v</A>.
#! @Arguments v
#! @Returns a positive integer
DeclareAttribute( "ObjectIndex", IsPathCategoryObject );

DeclareAttribute( "UnderlyingQuiverObject", IsPathCategoryObject );

#! @Description
#!  Returns the label of the object <A>v</A>.
#! @Arguments v
#! @Returns a string
DeclareAttribute( "ObjectLabel", IsPathCategoryObject );

#! @Description
#!  Returns the length of <A>alpha</A>.
#! @Arguments alpha
#! @Returns a positive integer
DeclareAttribute( "MorphismLength", IsPathCategoryMorphism );

#! @Description
#!  Returns the list of morphisms in the underlying quiver which defines <A>alpha</A>.
#! @Arguments alpha
#! @Returns a dense-list of &CAP; quiver morphisms
DeclareAttribute( "MorphismSupport", IsPathCategoryMorphism );

#! @Description
#!  Returns the indices of the morphisms in <C>MorphismSupport</C>(<A>alpha</A>).
#! @Arguments alpha
#! @Returns a dense-list of positive integers
DeclareAttribute( "MorphismIndices", IsPathCategoryMorphism );

#! @Description
#!  Returns the label of the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a positive integer
DeclareAttribute( "MorphismLabel", IsPathCategoryMorphism );

#! @Description
#!  Returns whether <A>C</A> can be enriched over the category of finite sets.
#! @Arguments C
#! @Returns a boolean
DeclareProperty( "IsFinitePathCategory", IsPathCategory );

KeyDependentOperation( "ExternalHomsWithGivenLengthData", IsPathCategory, IsInt, ReturnTrue );
KeyDependentOperation( "ExternalHomsWithGivenLength", IsCapCategory, IsInt, ReturnTrue );
DeclareAttribute( "ExternalHoms", IsPathCategory );

