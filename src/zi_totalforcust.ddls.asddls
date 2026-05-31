@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Total values for Customers'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TotalforCust as select from zt03customer
association [0..*] to ZR_03CUSTOMERORD as _Orders on $projection.CustomerId = _Orders.CustomerId
{
   key customer_id as CustomerId,
   @UI.lineItem: [{ position: 10, value: 'Fullname' }]
   @UI.identification: [{ position: 10, value: 'Fullname' }]
   concat_with_space(firstname, lastname, 1 ) as Fullname,
   @UI.dataPoint: { title: 'Total Num. of Orders', qualifier: 'OrdersSum', visualization: #NUMBER }
   @UI.lineItem: [{ position: 20, value: 'OrdersSum' }]
   @UI.identification: [{ position: 20, value: 'OrdersSum' }]
   count(distinct _Orders.OrderId) as OrdersSum,

    @UI.dataPoint: { title: 'Completed Orders Sum (EUR)', qualifier: 'Statussum', visualization: #NUMBER }
    @UI.lineItem: [{ position: 40, value: 'Statussum' }]
    @UI.identification: [{ position: 40, value: 'Statussum' }]
   sum( case _Orders.Status
     when 'COMP' then cast(  _Orders.Price as abap.dec( 10, 2 ) ) 
     else cast( 0 as abap.dec(10,2) )
     end ) as Statussum,

   _Orders 
}
group by
customer_id,
firstname,
lastname
