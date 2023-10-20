CLASS zcl_demo_abap_internal_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
    CLASS-METHODS: class_constructor.

  PRIVATE SECTION.
    "Creating structured data types.
    TYPES: "Line types for internal tables
      BEGIN OF struc1,
        a TYPE i,
        b TYPE c LENGTH 3,
        c TYPE c LENGTH 3,
        d TYPE c LENGTH 3,
      END OF struc1,
      BEGIN OF struc2,
        a TYPE i,
        b TYPE c LENGTH 3,
        e TYPE c LENGTH 3,
        f TYPE string,
      END OF struc2,
      "Types for demonstrating nested internal tables
      BEGIN OF l_type1,
        key_field TYPE i,
        char1     TYPE c LENGTH 10,
        char2     TYPE c LENGTH 10,
        num1      TYPE i,
        num2      TYPE i,
      END OF l_type1,
      BEGIN OF l_type2,
        key_field TYPE i,
        num1      TYPE i,
        num2      TYPE i,
      END OF l_type2,
      BEGIN OF nested1,
        key_field TYPE i,
        char1     TYPE c LENGTH 10,
        tab       TYPE STANDARD TABLE OF l_type2 WITH EMPTY KEY,
      END OF nested1,
      BEGIN OF nested2,
        key_field TYPE i,
        char2     TYPE c LENGTH 10,
        tab       TYPE STANDARD TABLE OF l_type1 WITH EMPTY KEY,
      END OF nested2,
      "Declaring internal table types.
      "Types for demonstrating nested internal tables
      ty_nested1 TYPE STANDARD TABLE OF nested1 WITH EMPTY KEY,
      ty_nested2 TYPE STANDARD TABLE OF nested2 WITH EMPTY KEY.

    CLASS-DATA:
      "Declaring internal tables.
      "Internal tables for demonstrating nested internal tables
      itab_nested1 TYPE ty_nested1,
      itab_nested2 TYPE ty_nested2,
      "Internal tables for CORRESPONDING/MOVE-CORRESPONDING demo
      tab1         TYPE TABLE OF struc1 WITH NON-UNIQUE KEY a,
      tab2         TYPE TABLE OF struc2 WITH NON-UNIQUE KEY a,
      tab3         TYPE SORTED TABLE OF struc1 WITH UNIQUE KEY a,
      tab4         TYPE SORTED TABLE OF struc2 WITH UNIQUE KEY a.

    CLASS-METHODS:
      fill_dbtabs,
      fill_itabs_for_corresponding.
ENDCLASS.