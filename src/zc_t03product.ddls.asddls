@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZT03PRODUCT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_T03PRODUCT
  provider contract transactional_query
  as projection on ZR_T03PRODUCT
  association [1..1] to ZR_T03PRODUCT as _BaseEntity on $projection.ProductID = _BaseEntity.ProductID
{
  key ProductID,
  ProductName,
  Description,
  @Semantics: {
    amount.currencyCode: 'Currency'
  }
  UnitPrice,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Currency,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
