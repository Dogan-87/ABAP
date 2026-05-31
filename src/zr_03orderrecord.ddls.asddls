@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition von Order Records'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_03ORDERRECORD
  as select from zt03orderrecord
  association        to parent ZR_03CUSTOMERORD as _Orders    on $projection.OrderId = _Orders.OrderId
  association [0..1] to ZR_03CUSTOMER2          as _Customers on $projection.CustomerId = _Customers.CustomerId
  association [0..1] to ZR_T03PRODUCT           as _Products  on $projection.ProductId = _Products.ProductID
  association [1..1] to ZI_03Recorcconvert      as _Convert   on $projection.OrderrecordId = _Convert.OrderrecordId
{
  key orderrecord_id           as OrderrecordId,
      order_id                 as OrderId,
      customer_id              as CustomerId,
      product_id               as ProductId,
      quantity                 as Quantity,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      _Convert.PriceConverted  as UnitPrice,
      _Convert.CurrencyCodeEUR as CurrencyCode,
      created_by               as CreatedBy,
      created_at               as CreatedAt,
      local_last_changed_by    as LocalLastChangedBy,
      local_last_changed_at    as LocalLastChangedAt,
      last_changed_at          as LastChangedAt,

      _Orders,
      _Customers,
      _Products,
      _Convert
}
