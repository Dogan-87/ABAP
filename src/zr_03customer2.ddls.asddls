@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition von Customer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_03CUSTOMER2 as select from zt03customer as _Customers
composition [0..*] of ZR_03CUSTOMERORD as _Orders
    association [0..1] to ZI_TotalforCust as _Total on $projection.CustomerId = _Total.CustomerId    
{
    key customer_id as CustomerId,
    firstname as Firstname,
    lastname as Lastname,    
    street as Street,    
    postzahl as Postzahl,
    city as City,
    country as Country,
    _Total.Fullname as Fullname,
    _Total.OrdersSum as OrdersSum,
    _Total.Statussum as Statussum,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    created_at as CreatedAt,
    @Semantics.user.localInstanceLastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
     @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    
    _Orders,
    _Total
}
