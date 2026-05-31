@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition of Products'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_03Product
  as select from zt03product as _Products
  association [0..*] to ZR_03ORDERRECORD as _Records on $projection.ProductId = _Records.ProductId
{


  key product_id   as ProductId,
      product_name as ProductName,
      description  as Description,
      @Semantics.amount.currencyCode: 'Currency'
      unit_price   as UnitPrice,
      @UI.hidden: true
      currency     as Currency,
      created_at as CreatedAt,
      @Semantics.user.createdBy: true
      created_by as CreatedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      
      _Records
}
