CLASS zcl_03_fill_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_03_FILL_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_customer TYPE TABLE OF zt03customer,
          lt_orders   TYPE TABLE OF zt03customerord,
          lt_records  TYPE TABLE OF zt03orderrecord,
          lt_products TYPE TABLE OF zt03product,
          lt_status   TYPE TABLE OF zt03status.

    DATA: ls_customer TYPE zt03customer,
          ls_orders   TYPE zt03customerord,
          ls_records  TYPE zt03orderrecord,
          ls_products TYPE zt03product,
          ls_status   TYPE zt03status.


    ls_customer = VALUE #(  customer_id = '000001'
                            firstname = 'Max'
                            lastname = 'Mustermann'
                            street = 'Bahnhofstrasse 12'
                            postzahl = '69190'
                            city = 'Berlin'
                            country = 'DE'
     ).
    APPEND ls_customer TO lt_customer.

    ls_customer = VALUE #(  customer_id = '000002'
                            firstname = 'Janos'
                            lastname = 'Kovacs'
                            street = 'Mozartstrasse 18'
                            postzahl = '64190'
                            city = 'München'
                            country = 'DE'
     ).
    APPEND ls_customer TO lt_customer.

    ls_customer = VALUE #( customer_id = '000003'
                           firstname = 'Mario'
                           lastname = 'Rossi'
                           street = 'Elmstrasse 1'
                           postzahl = '75279'
                           city = 'Hamburg'
                           country = 'DE'
    ).
    APPEND ls_customer TO lt_customer.

    ls_customer = VALUE #(  customer_id = '000004'
                            firstname = 'Jane'
                            lastname = 'Doe'
                            street = 'Bakerstrasse 16'
                            postzahl = '79429'
                            city = 'Schwerin'
                            country = 'DE'
     ).
    APPEND ls_customer TO lt_customer.


    ls_orders = VALUE #(  order_id = '000001'
                           customer_id = '000001'
*                           product_id = '000101'
*                           product_count = '5'
                           order_date = '20250101'
                           price = '250.00'
                           currency = 'EUR'
                           status = 'PEN'
    ).
    APPEND ls_orders TO lt_orders.


    ls_orders = VALUE #(  order_id = '000002'
                           customer_id = '000002'
*                           product_id = '000201'
*                           product_count = '1'
                           order_date = '20250212'
                           price = '100.00'
                           currency = 'USD'
                           status = 'NEW'
    ).
    APPEND ls_orders TO lt_orders.


    ls_orders = VALUE #(  order_id = '000003'
                           customer_id = '000003'
*                           product_id = '000201'
*                           product_count = '2'
                           order_date = '20250403'
                           price = '200.00'
                           currency = 'EUR'
                           status = 'COMP'
    ).
    APPEND ls_orders TO lt_orders.

    ls_orders = VALUE #(   order_id = '000004'
                           customer_id = '000004'
*                           product_id = '000101'
*                           product_count = '4'
                           order_date = '20250403'
                           price = '200.00'
                           currency = 'USD'
                           status = 'COMP'
   ).
    APPEND ls_orders TO lt_orders.

    ls_orders = VALUE #(  order_id = '000005'
                          customer_id = '000001'
*                          product_id = '000101'
*                          product_count = '1'
                          order_date = '20250530'
                          price = '250.00'
                          currency = 'EUR'
                          status = 'NEW'
   ).
    APPEND ls_orders TO lt_orders.

    ls_orders = VALUE #(  order_id = '000006'
                          customer_id = '000003'
*                          product_id = '000101'
*                          product_count = '10'
                          order_date = '20250601'
                          price = '500.00'
                          currency = 'EUR'
                          status = 'NEW'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000007'
                          customer_id = '000004'
*                          product_id = '000201'
*                          product_count = '3'
                          order_date = '20250708'
                          price = '300.00'
                          currency = 'USD'
                          status = 'PEN'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000008'
                          customer_id = '000001'
*                          product_id = '000101'
*                          product_count = '1'
                          order_date = '20250810'
                          price = '50.00'
                          currency = 'EUR'
                          status = 'COMP'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000009'
                          customer_id = '000002'
*                          product_id = '000201'
*                          product_count = '2'
                          order_date = '20250911'
                          price = '200.00'
                          currency = 'USD'
                          status = 'CANC'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000010'
                          customer_id = '000003'
*                          product_id = '000101'
*                          product_count = '1'
                          order_date = '20260408'
                          price = '50.00'
                          currency = 'EUR'
                          status = 'CANC'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000011'
                          customer_id = '000004'
*                          product_id = '000101'
*                          product_count = '2'
                          order_date = '20260422'
                          price = '100.00'
                          currency = 'USD'
                          status = 'COMP'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000012'
                              customer_id = '000003'
*                              product_id = '000201'
*                              product_count = '1'
                              order_date = '20260423'
                              price = '100.00'
                              currency = 'EUR'
                              status = 'COMP'
       ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000013'
                          customer_id = '000004'
*                          product_id = '000101'
*                          product_count = '15'
                          order_date = '20260424'
                          price = '750.00'
                          currency = 'USD'
                          status = 'COMP'
   ).
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000014'
                          customer_id = '000001'
*                          product_id = '000101'
*                          product_count = '1'
                          order_date = '20260425'
                          price = '50.00'
                          currency = 'EUR'
                          status = 'PEN'
   ).
    APPEND ls_orders TO lt_orders.
    APPEND ls_orders TO lt_orders.
    ls_orders = VALUE #(  order_id = '000015'
                          customer_id = '000002'
*                          product_id = '000201'
*                          product_count = '1'
                          order_date = '20260425'
                          price = '100.00'
                          currency = 'USD'
                          status = 'COMP'
   ).

    APPEND ls_orders TO lt_orders.

    ls_products = VALUE #( product_id = '000101'
                           product_name = 'Whey Isolate'
                           description = 'Whey Protein Isolate %55'
                           unit_price = '50.00'
                           currency = 'EUR'
). APPEND ls_products TO lt_products.

    ls_products = VALUE #( product_id = '000201'
                           product_name = 'Whey Concentrate'
                           description = 'Whey Protein Concentrate %76'
                           unit_price = '100.00'
                           currency = 'EUR'
). APPEND ls_products TO lt_products.

    ls_records = VALUE #( orderrecord_id = '000001'
                          order_id = '000001'
                          customer_id = '000001'
                          product_id = '101'
                          quantity = '2'
                          unit_price = ''
                          currency_code = ''
     ).
    APPEND ls_records TO lt_records.
    ls_records = VALUE #( orderrecord_id = '000002'
                        order_id = '000001'
                        customer_id = '000001'
                        product_id = '201'
                        quantity = '3'
                        unit_price = ''
                        currency_code = ''
   ).
    APPEND ls_records TO lt_records.


    ls_status = VALUE #( status_id = 'NEW' description = 'New' ).
    APPEND ls_status TO lt_status.
    ls_status = VALUE #( status_id = 'COMP' description = 'Completed' ).
    APPEND ls_status TO lt_status.
    ls_status = VALUE #( status_id = 'CANC' description = 'Canceled' ).
    APPEND ls_status TO lt_status.
    ls_status = VALUE #( status_id = 'PEN' description = 'Pending' ).
    APPEND ls_status TO lt_status.

deLETE FROM zt03product .
deLETE FROM zt03product_d .

*    MODIFY zt03customer FROM TABLE @lt_customer.
*     MODIFY zt03customerord FROM TABLE @lt_orders.
    MODIFY zt03product FROM TABLE @lt_products.
*    MODIFY zt03status FROM TABLE @lt_status.
*     MODIFY zt03orderrecord FROM TABLE @lt_records.

    out->write( lt_products ).

*    SELECT FROM zt03customerord FIELDS MAX( order_id ) AS max_order_id
*    INTO TABLE  @DATA(result).
**    out->write(  result ).
*    DATA(max_order_id) = VALUE #( result[ 1 ]-max_order_id DEFAULT 0 ).
*    max_order_id += 1.
**    out->write(  max_order_id ).
*
*    SELECT FROM zc_03customerord FIELDS MAX( OrderId ) AS max_order_id
*    INTO TABLE  @DATA(result2).
**     out->write(  result2 ).
*
*
*    SELECT FROM zt03customer FIELDS MAX( customer_id ) AS max_customer_id INTO TABLE @DATA(result2).
*    DATA(max_customer_id) = VALUE #( result2[ 1 ]-max_customer_id DEFAULT 0 ).
*
*    out->write(  max_customer_id ).



*    SELECT MAX( order_id ) FROM zt03customerord INTO @DATA(lv_max).
*    out->write(  lv_max ).

  ENDMETHOD.
ENDCLASS.
