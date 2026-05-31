CLASS LHC_ZR_T03PRODUCT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Products
        RESULT result,
      Pricevalidation FOR VALIDATE ON SAVE
            IMPORTING keys FOR Products~Pricevalidation,
      validateCurrency FOR VALIDATE ON SAVE
            IMPORTING keys FOR Products~validateCurrency.
ENDCLASS.

CLASS LHC_ZR_T03PRODUCT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD Pricevalidation.
   DATA failed_record LIKE LINE OF failed-products.
    DATA reported_record LIKE LINE OF reported-products.

    READ ENTITIES OF zr_t03product
    IN LOCAL MODE ENTITY Products
    FIELDS ( UnitPrice )
     WITH CORRESPONDING #( keys )
     RESULT DATA(Costs).

    LOOP AT costs INTO DATA(cost).
      IF cost-UnitPrice < 0.
        failed_record-%tky = cost-%tky.
        APPEND failed_record TO failed-products.
        reported_record-%tky = cost-%tky.
        reported_record-%msg = new_message(
                                   id = 'ZT03_MESSAGE'
                                   number = '001'
                                   severity = if_abap_behv_message=>severity-error
                                   ).
        APPEND reported_record TO reported-products.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateCurrency.

    DATA failed_record LIKE LINE OF failed-products.
    DATA reported_record LIKE LINE OF reported-products.
    DATA exists TYPE abap_bool.

    READ ENTITIES OF zr_t03product
    IN LOCAL MODE ENTITY Products
    FIELDS ( Currency )
    WITH CORRESPONDING #( keys )
    RESULT DATA(Currencies).

    LOOP AT currencies INTO DATA(currency).
      exists = abap_false.
      SELECT SINGLE FROM i_currency
         FIELDS @abap_true
         WHERE currency = @currency-Currency
         INTO @exists.
      IF exists = abap_false. " the currency code is not valid
        failed_record-%tky = currency-%tky.
        APPEND failed_record TO failed-products.
        reported_record-%tky = currency-%tky.
        reported_record-%msg = new_message(
                                    id = 'ZT03_MESSAGE'
                                    number = '002'
                                    severity = if_abap_behv_message=>severity-error
                                    v1 = currency-Currency ).
        APPEND reported_record TO reported-products.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
