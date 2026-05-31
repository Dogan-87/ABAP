@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of Customer'
@Metadata.ignorePropagatedAnnotations: true
@UI: {
  headerInfo: {
    typeName: 'Customer',
    typeNamePlural: 'Customers',

    title: { type: #STANDARD,
            value: 'Fullname',
            label: 'Customer Full Name',
            targetElement: '_Total.Fullname' }
            }
    }
    

define root view entity ZC_03Customer
  provider contract transactional_query
  as projection on ZR_03CUSTOMER2
//  association [0..1] to ZC_03TOTALFORCUST as _Total on $projection.CustomerId = _Total.CustomerId
{
      @UI.facet: [
                      { id: 'Customers',
                     type: #IDENTIFICATION_REFERENCE,
                     label: 'Customer',
                     position: 10
                     },

               { id: 'OrdersSum',
                    type: #DATAPOINT_REFERENCE,
                    purpose: #HEADER,
                    label: 'OrdersSum',
//                    targetElement: '_Total',
                    targetQualifier: 'OrdersSum',                   
                    position: 15
                },

               { id: 'Statussum',
                    type: #DATAPOINT_REFERENCE,
                    purpose: #HEADER,
                    label: 'Statussum',
//                    targetElement: '_Total',

                    targetQualifier: 'Statussum',
                    position: 16
                },

                   { id: 'Orders',
                     type: #LINEITEM_REFERENCE,
                     targetElement: '_Orders',
                     label: 'Orders',
                     position: 20
                   }
      ]
      @UI.lineItem: [{ position: 10, value: 'CustomerId' }]
      @UI.identification: [{ position: 10, value: 'CustomerId' }]
      @UI.selectionField: [{ position: 10, element: 'CustomerId' }]
  key CustomerId,
      @UI.lineItem: [{ position: 30, value: 'Firstname',cssDefault.width: '100px' }]
      @UI.identification: [{ position: 30, value: 'Firstname' }]
      Firstname,
      @UI.lineItem: [{ position: 40, value: 'Lastname',cssDefault.width: '100px' }]
      @UI.identification: [{ position: 40, value: 'Lastname' }]
      @UI.selectionField: [{ position: 40, element: 'Lastname' }]
      Lastname,
      @UI.lineItem: [{ position: 50, value: 'Street',cssDefault.width: '150px' }]
      @UI.identification: [{ position: 50, value: 'Street' }]
      Street,
      @UI.lineItem: [{ position: 60, value: 'Postzahl' }]
      @UI.identification: [{ position: 60, value: 'Postzahl' }]
      Postzahl,
      @UI.lineItem: [{ position: 70, value: 'City',cssDefault.width: '100px' }]
      @UI.identification: [{ position: 70, value: 'City' }]
      @UI.selectionField: [{ position: 70, element: 'City' }]
      City,
      @UI.lineItem: [{ position: 80, value: 'Country',cssDefault.width: '100px' }]
      @UI.identification: [{ position: 80, value: 'Country' }]
      @UI.selectionField: [{ position: 80, element: 'Country' }]
      Country,
      @UI.lineItem: [{ position: 90, value: 'Fullname', hidden: true }]
      @UI.identification: [{ position: 90, value: 'Fullname', hidden: true }]
      Fullname,
      @UI.dataPoint: { title: 'Total Num. of Orders', targetValueElement: 'OrdersSum', visualization: #NUMBER }
      @UI.lineItem: [{ position: 100, value: 'OrdersSum', hidden: true }]
      @UI.identification: [{ position: 100, label: 'Total Num. of Orders', value: 'OrdersSum' }]
      OrdersSum,
      @UI.dataPoint: { title: 'Completed Orders Sum (EUR)', targetValueElement: 'Statussum', visualization: #NUMBER }
      @UI.lineItem: [{ position: 110, value: 'Statussum', hidden: true }]
      @UI.identification: [{ position: 110, label: 'Completed Orders Sum (EUR)', value: 'Statussum' }]
      Statussum,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Orders : redirected to composition child ZC_03CustOrder,
      _Total
     
}
