# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

BindGlobal( "FP_CATEGORIES_METHOD_NAME_RECORD", rec(

SetOfGeneratingMorphismsOfCategory := rec(
  filter_list := [ "category" ],
  return_type := "list_of_morphisms",
  dual_operation := "SetOfGeneratingMorphismsOfCategory",
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( FP_CATEGORIES_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DECLARATIONS_AND_INSTALLATIONS_FROM_METHOD_NAME_RECORD(
    FP_CATEGORIES_METHOD_NAME_RECORD,
    "FpCategories",
    "ToolsMethodRecord",
    "Futher CAP operations",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( FP_CATEGORIES_METHOD_NAME_RECORD, "FpCategories" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( FP_CATEGORIES_METHOD_NAME_RECORD );
