@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition von Customer Orders'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_03CUSTOMERORD
  as select from zt03customerord
  association to parent ZR_03CUSTOMER2   as _Customers on $projection.CustomerId = _Customers.CustomerId
  composition [0..*] of ZR_03ORDERRECORD as _Records
  association to ZI_03OrderSum           as _Sum       on $projection.OrderId = _Sum.OrderId
  //association [0..*] to ZR_03ORDERRECORD as _Rec on $projection.OrderId = _Rec.OrderId
{
  key order_id              as OrderId,
      customer_id           as CustomerId,
      order_date            as OrderDate,
      @Semantics.amount.currencyCode: 'Currency'
      _Sum.TotalOrder       as Price,
      _Sum.CurrencyCodeEUR  as Currency,
      //       currency as Currency,
      status                as Status,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Customers,
      _Records,
      _Sum
}
