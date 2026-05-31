@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_03TESTSUM
  as select from zt03customer
  association [0..*] to ZR_03CUSTOMERORD as _Order on $projection.CustomerId = _Order.CustomerId
{
  key customer_id                                    as CustomerId,
      sum( cast( _Order.Price as abap.dec( 10, 2 ))) as TotalSumm,
      cast('EUR' as /dmo/currency_code)              as CurrencyCodeEUR
}
group by
  customer_id
