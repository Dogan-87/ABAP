@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Total values for Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_03TOTALFORCUST as select from ZI_TotalforCust
{

    key CustomerId,
    Fullname,
    @UI.dataPoint: { title: 'Total Num. of Orders', qualifier: 'OrdersSum', targetValueElement:'OrdersSum', visualization: #NUMBER }
    OrdersSum,
    @UI.dataPoint: { title: 'Completed Orders Sum (EUR)', qualifier: 'Statussum', targetValueElement:'Statussum', visualization: #NUMBER }
    Statussum,
    /* Associations */
    _Orders
}
