@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Total Price of Order ID`s'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_03OrderSum
  as select from ZR_03ORDERRECORD
  association to ZR_03CUSTOMERORD as _Order on $projection.OrderId = _Order.OrderId
{
  key OrderId                                                                          as OrderId,
      @Semantics.amount.currencyCode: 'CurrencyCodeEUR'
      cast( ( sum( cast(  UnitPrice as abap.dec( 10, 2 ) ) ) ) as abap.curr( 10, 2 ) ) as TotalOrder,
      cast('EUR' as /dmo/currency_code)                                                as CurrencyCodeEUR,
      _Order
}
group by
  OrderId
