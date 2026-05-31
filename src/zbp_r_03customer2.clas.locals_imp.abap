CLASS lhc__records DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS Validateproducttyp FOR VALIDATE ON SAVE
      IMPORTING keys FOR _Records~Validateproducttyp.
*    METHODS Validaterecords FOR DETERMINE ON SAVE
*      IMPORTING keys FOR _Records~Validaterecords.

ENDCLASS.

CLASS lhc__records IMPLEMENTATION.

  METHOD Validateproducttyp.
    DATA failed_record LIKE LINE OF failed-_records.
    DATA reported_record LIKE LINE OF reported-_records.
  READ ENTITIES OF ZR_03customer2
  IN LOCAL MODE ENTITY _Records
      FIELDS ( ProductId  OrderId CustomerId )
      WITH CORRESPONDING #( keys )
      RESULT DATA(products).
  LOOP AT products INTO DATA(product).

  IF product-ProductId IS NOT INITIAL.
      SELECT SINGLE FROM zr_03orderrecord
        FIELDS ProductId
        WHERE productid = @product-ProductId
          AND ( orderid = @product-OrderId and customerid = @product-CustomerId )
        INTO @DATA(lv_exists).
      IF sy-subrc = 0.
        failed_record-%tky = product-%tky.
        APPEND failed_record TO failed-_records.
        reported_record-%tky = product-%tky.
        reported_record-%msg = new_message(
          id = 'ZT03_MESSAGE'
          number = '003'
          severity = if_abap_behv_message=>severity-error
          v1 = product-ProductId
        ).
        APPEND reported_record TO reported-_records.
      ENDIF.
    ENDIF.
  ENDLOOP.
  ENDMETHOD.

*  METHOD Validaterecords.
*
**
**  READ ENTITIES OF ZR_03customer2
**  IN LOCAL MODE ENTITY _Records
**      FIELDS ( OrderrecordId )
**      WITH CORRESPONDING #( keys )
**      RESULT DATA(records).
***
**  SELECT MAX( orderrecordid ) AS max_id
**  FROM zr_03orderrecord
**  INTO @DATA(max_id_db).
**
**  DATA next_id TYPE zr_03orderrecord-OrderrecordId VALUE 0.
**  IF max_id_db IS NOT INITIAL.
**    next_id = max_id_db.
**  ENDIF.
**
**        MODIFY ENTITIES OF zr_03customer2
**          IN LOCAL MODE ENTITY _Records
**          UPDATE FIELDS ( OrderrecordId )
**          WITH VALUE #( ( OrderrecordId = next_id ) ).
*
*
*  ENDMETHOD.

ENDCLASS.

*CLASS lhc__records DEFINITION INHERITING FROM cl_abap_behavior_handler.
*
*  PRIVATE SECTION.
**
***    METHODS Pricevalidation FOR VALIDATE ON SAVE
***      IMPORTING keys FOR _Records~Pricevalidation.
**
*ENDCLASS.

*CLASS lhc__records IMPLEMENTATION.
*
**  METHOD Pricevalidation.
*
*    DATA failed_record LIKE LINE OF failed-_records.
*    DATA reported_record LIKE LINE OF reported-_records.
*
*    READ ENTITIES OF zr_03customer2
*    IN LOCAL MODE ENTITY _Records
*    FIELDS ( UnitPrice )
*     WITH CORRESPONDING #( keys )
*     RESULT DATA(Costs).
*
*    LOOP AT costs INTO DATA(cost).
*      IF cost-UnitPrice < 0.
*        failed_record-%tky = cost-%tky.
*        APPEND failed_record TO failed-_records.
*        reported_record-%tky = cost-%tky.
*        reported_record-%msg = new_message(
*                                   id = '/LRN/S4D400'
*                                   number = '101'
*                                   severity = if_abap_behv_message=>severity-error
*                                   ).
*        APPEND reported_record TO reported-_records.
*      ENDIF.
*    ENDLOOP.
*
*
*
*
*
*
*
*  ENDMETHOD.

*ENDCLASS.

CLASS lhc__Customers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _Customers RESULT result.


*    METHODS setNextCustomerId FOR DETERMINE ON SAVE
*      IMPORTING keys FOR _Customers~setNextCustomerId.

ENDCLASS.

CLASS lhc__Customers IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

*  METHOD setNextCustomerId.
*
*    READ ENTITIES OF zr_03customer2 IN LOCAL MODE
*        ENTITY _Customers
*       FIELDS ( CustomerId )
*        WITH CORRESPONDING #( keys )
*        RESULT DATA(cust).
*
*    SELECT FROM zt03customer FIELDS MAX( customer_id ) AS max_customer_id INTO TABLE @DATA(result).
*
*    DATA(max_customer_id) = VALUE #( result[ 1 ]-max_customer_id DEFAULT 0 ).
*
*    LOOP AT cust INTO DATA(customer).
*      IF customer-CustomerId IS INITIAL.
*        MODIFY ENTITIES OF zr_03customer2 IN LOCAL MODE
*          ENTITY _Customers
*          UPDATE FIELDS ( CustomerId )
*          WITH VALUE #( (
*            %tky   =  customer-%tky
*            CustomerId = max_customer_id + 1
*
*        ) ).
*      ENDIF.
*    ENDLOOP.
*
*  ENDMETHOD.





ENDCLASS.

CLASS lhc__Orders DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR _Orders RESULT result.
    METHODS setInitialStatus FOR DETERMINE ON SAVE
      IMPORTING keys FOR _Orders~setInitialStatus.

    METHODS setOrderDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR _Orders~setOrderDate.


*    METHODS CreateOrder FOR MODIFY
*      IMPORTING keys FOR ACTION _Orders~CreateOrder RESULT result.

*    METHODS earlynumbering_cba_Orders FOR NUMBERING
*      IMPORTING entities FOR CREATE _Customers\_Orders.

*    METHODS OrderIdvalidation FOR VALIDATE ON SAVE
*      IMPORTING keys FOR _Orders~OrderIdvalidation.
*    METHODS setNextOrderId FOR DETERMINE ON SAVE
*      IMPORTING keys FOR _Orders~setNextOrderId.

ENDCLASS.

CLASS lhc__Orders IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setInitialStatus.
    READ ENTITIES OF zr_03customer2 IN LOCAL MODE
      ENTITY _Orders
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(ords).

    LOOP AT ords INTO DATA(ord).
      IF ord-Status IS INITIAL.
        MODIFY ENTITIES OF zr_03customer2 IN LOCAL MODE
          ENTITY _Orders
          UPDATE FIELDS ( Status )
          WITH VALUE #( (
            %tky   =  ord-%tky
            Status = 'NEW'
          ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD setOrderDate.
    DATA(today) = cl_abap_context_info=>get_system_date(  ).
    READ ENTITIES OF zr_03customer2
        IN LOCAL MODE ENTITY _Orders
        FIELDS ( OrderDate )
        WITH CORRESPONDING #( keys )
        RESULT DATA(orderD).

    LOOP AT orderD INTO DATA(order_key).
      IF order_key-OrderDate IS INITIAL OR order_key-OrderDate > today.
        MODIFY ENTITIES OF zr_03customer2 IN LOCAL MODE
        ENTITY _Orders
        UPDATE FIELDS ( OrderDate )
        WITH VALUE #( ( %tky = order_key-%tky   OrderDate = today ) ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

*  METHOD earlynumbering_cba_Orders.
*
*    DATA lv_max TYPE zt03customerord-order_id.
*
*    SELECT MAX( order_id )
*      FROM zt03customerord
*      INTO @lv_max.
*
*    LOOP AT mapped-_Orders ASSIGNING FIELD-SYMBOL(<mapped>).
*
*      lv_max += 1.
*
*      <mapped>-OrderId = lv_max.
*
*    ENDLOOP.
*
*  ENDMETHOD.

*  METHOD setNextOrderId.
*
*  READ ENTITIES OF zr_03customer2 IN LOCAL MODE
*        ENTITY _Orders
*       FIELDS ( OrderId )
*        WITH CORRESPONDING #( keys )
*        RESULT DATA(ords).
*
*
*    SELECT FROM zt03customerord FIELDS MAX( order_id ) AS max_order_id INTO TABLE  @DATA(result).
*
*    DATA(max_order_id) = VALUE #( result[ 1 ]-max_order_id DEFAULT 0 ).
*
*    LOOP AT ords INTO DATA(ord).
*      IF ord-OrderId IS INITIAL or ord-OrderId = 0.
*        MODIFY ENTITIES OF zr_03customer2 IN LOCAL MODE
*          ENTITY _Orders
*          UPDATE FIELDS ( OrderId )
*          WITH VALUE #( (
*            %tky   =  ord-%tky
*            OrderId = max_order_id + 1
*
*        ) ).
*      ENDIF.
*    ENDLOOP.
*
*  ENDMETHOD.
*
*  METHOD OrderIdvalidation.
*
*    DATA failed_id LIKE LINE OF failed-_orders.
*    DATA reported_id LIKE LINE OF reported-_orders.
*
*    READ ENTITIES OF zr_03customer2
*    IN LOCAL MODE ENTITY _Orders
*    FIELDS ( OrderId )
*     WITH CORRESPONDING #( keys )
*     RESULT DATA(ords).
*
*    LOOP AT ords INTO DATA(ord).
*      IF ord-OrderId IS INITIAL OR ord-OrderId = 0.
*        SELECT FROM zt03customerord FIELDS MAX( order_id ) AS max_order_id INTO TABLE  @DATA(result).
*
*        DATA(max_order_id) = VALUE #( result[ 1 ]-max_order_id DEFAULT 0 ).
*
*
*        failed_id-%tky = ord-%tky.
*        APPEND failed_id TO failed-_orders.
*        reported_id-%tky = ord-%tky.
*        reported_id-%msg = new_message(
*                                   id = 'ZT03_MESSAGE'
*                                   number = '101'
*                                   severity = if_abap_behv_message=>severity-error
*                                   v1 = max_order_id + 1
*                                   ).
*        APPEND reported_id TO reported-_orders.
*      ENDIF.
*    ENDLOOP.
*
*
*
*  ENDMETHOD.




* METHOD CreateOrder.
*
*
*  DATA(customer_id) = keys[ 1 ]-CustomerId.
*
*
*  SELECT MAX( order_id )
*    FROM zt03customerord
*    INTO @DATA(max_id).
*
*  DATA(next_id) = COND #( WHEN max_id IS INITIAL THEN 1 ELSE max_id + 1 ).
*
*
*  INSERT zt03customerord FROM VALUE #(
*    order_id    = next_id
*    customer_id = customer_id
*    order_date  = cl_abap_context_info=>get_system_date( )
*    status      = 'NEW'
*  ).
*
*
*  READ ENTITIES OF ZR_03CUSTOMERORD
*    IN LOCAL MODE
*    ENTITY _Orders
*      BY \_KEY
*        FIELDS ( OrderId CustomerId OrderDate Status )
*        WITH VALUE #(
*          ( OrderId = next_id  CustomerId = customer_id )
*        )
*    RESULT DATA(orders).
*
*  result = orders[ 1 ].
*
*ENDMETHOD.

ENDCLASS.
