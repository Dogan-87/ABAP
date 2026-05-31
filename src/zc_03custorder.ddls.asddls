@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of Customer Orders'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_03CustOrder 
  as projection on ZR_03CUSTOMERORD as _Orders
{
@UI.facet: [  
             { id: 'Customers', 
               type: #IDENTIFICATION_REFERENCE, 
               targetElement: '_Customers', 
               label: 'Customers',
               position: 10
     
             } ,        
               { id: 'Records', 
               type: #LINEITEM_REFERENCE, 
               targetElement: '_Records', 
               label: 'Records',
               position: 20 
             } , 
              { id: 'Orders', 
              type: #IDENTIFICATION_REFERENCE, 
               label: 'Orders' }          
             ]
    @UI.lineItem: [{ position: 10, value: 'OrderId' }]
    @UI.identification: [{ position: 10, value: 'OrderId' }]
    @UI.selectionField: [{ position: 10}]
    key OrderId,   
    @UI.lineItem: [{ position: 20, value: 'CustomerId' }]
    @UI.identification: [{ position: 20, value: 'CustomerId' }]
    CustomerId,   
    @UI.lineItem: [{ position: 40, value: 'OrderDate' }] 
    @UI.identification: [{ position: 40, value: 'OrderDate' }]
    @UI.selectionField: [{ position: 30, element: 'OrderDate' }]     
    OrderDate,  
    @UI.lineItem: [{ position: 60, value: 'Price',cssDefault.width: '200px' }]
    @UI.identification: [{ position: 60, value: 'Price', label: 'Price' }] 
    @Semantics.amount.currencyCode: 'Currency'    
    Price,   
    @UI.lineItem: [{ position: 70, value: 'Currency', hidden: true }]
    @UI.identification: [{ position: 70, value: 'Currency', hidden: true }] 
    @Consumption.valueHelpDefinition: [{ 
    entity.name: 'I_CurrencyStdVH',
    entity.element: 'Currency',
    useForValidation: true
     }]    
    Currency,    
    @UI.lineItem: [{ position: 80, value: 'Status',cssDefault.width: '100px'}]  
    @UI.identification: [{ position: 80, value: 'Status' }] 
    @Consumption.valueHelpDefinition: [{ 
    entity.name: 'ZI_03Status',
    entity.element: 'Status',
    useForValidation: true
     }]   
    Status, 
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Customers : redirected to parent ZC_03Customer,
    _Records : redirected to composition child ZC_03ORDERRECORD,
    _Sum
    
   
}
