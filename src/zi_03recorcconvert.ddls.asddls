@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Price Conversion View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_03Recorcconvert 

as select from zt03orderrecord as r

  association [0..1] to ZR_T03PRODUCT as _Products  on $projection.ProductId = _Products.ProductID
{


    key orderrecord_id as OrderrecordId,
    product_id as ProductId,
    quantity as Quantity,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast ( cast ( _Products.UnitPrice  as abap.dec( 10, 2 ) )
      * cast ( $projection.Quantity as abap.dec( 10, 2 ) ) as abap.curr( 10, 2 )) as UnitPrice,
      //    unit_price as UnitPrice,
      _Products.Currency                                                          as CurrencyCode,

      cast('EUR' as /dmo/currency_code) as CurrencyCodeEUR,
      @EndUserText.label: 'Price in EUR'
      @Semantics.amount.currencyCode: 'CurrencyCodeEUR'
      currency_conversion(amount             => $projection.UnitPrice,
                          source_currency    => _Products.Currency,
                          target_currency    => $projection.CurrencyCodeEUR,
                          exchange_rate_date => $session.system_date,
                          error_handling => 'SET_TO_NULL') as PriceConverted,
     _Products
}
