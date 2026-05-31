@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition Product für Orderrecord'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_03PRODREC
  as select from zt03product
  association [0..*] to ZR_03ORDERRECORD as _Records on $projection.ProductId = _Records.ProductId
{

      @UI.facet: [ { id: 'Products',
                          type: #LINEITEM_REFERENCE,
                          label: 'Products',
                          position: 10  }]

      @UI.lineItem: [{ position: 10, value: 'ProductId' }]
      @UI.identification: [{ position: 10, value: 'ProductId' }]
  key product_id            as ProductId,
      @UI.lineItem: [{ position: 20, value: 'ProductName' }]
      @UI.identification: [{ position: 20, value: 'ProductName' }]
      product_name          as ProductName,
      @UI.lineItem: [{ position: 30, value: 'Description' }]
      @UI.identification: [{ position: 30, value: 'Description' }]
      description           as Description,
      @UI.lineItem: [{ position: 40, value: 'UnitPrice' }]
      @UI.identification: [{ position: 40, value: 'UnitPrice' }]
      @Semantics.amount.currencyCode: 'Currency'
      unit_price            as UnitPrice,
      @UI.lineItem: [{ position: 50, value: 'Currency' }]
      @UI.identification: [{ position: 50, value: 'Currency' }]
      currency              as Currency,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Records
}
