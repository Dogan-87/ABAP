@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view of Order Records'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_03ORDERRECORD 
   as projection on ZR_03ORDERRECORD as _Records
   association [1..1] to ZC_T03PRODUCT as _Products on $projection.ProductId = _Products.ProductID
{
@UI.facet: [  
             { id: 'Customers', 
               type: #IDENTIFICATION_REFERENCE, 
               targetElement: '_Customers', 
               label: 'Customers',
               position: 10
             } ,
             
              { id: 'Orders', 
              type: #IDENTIFICATION_REFERENCE, 
               targetElement: '_Orders',
               label: 'Orders',
               position: 20 },  
                
              { id: 'Records', 
              type: #IDENTIFICATION_REFERENCE,
               label: 'Records',
               position: 30 },
               
              { id: 'Products', 
               type: #IDENTIFICATION_REFERENCE, 
               targetElement: '_Products', 
               label: 'Products',
               position: 40 }
                      
             ]

    @UI.lineItem: [{ position: 10, value: 'OrderrecordId' }]
    @UI.identification: [{ position: 10, value: 'OrderrecordId' }]
//    @UI.selectionField: [{ position: 10}]
    key OrderrecordId,
    @UI.lineItem: [{ position: 20, value: 'OrderId' }]
    @UI.identification: [{ position: 20, value: 'OrderId' }]    
    OrderId,
    @UI.lineItem: [{ position: 30, value: 'CustomerId' }]
    @UI.identification: [{ position: 30, value: 'CustomerId' }]    
    CustomerId,  
    @UI.lineItem: [{ position: 40, value: 'ProductId' }] 
    @UI.identification: [{ position: 40, value: 'ProductId' }] 
    @Consumption.valueHelpDefinition: [{
    entity.name: 'ZC_03Product',
    entity.element: 'ProductId',
    useForValidation: true
    }]  
    ProductId, 
    @UI.lineItem: [{ position: 50, value: 'Quantity' }] 
    @UI.identification: [{ position: 50, value: 'Quantity' }]   
    Quantity,    
    @UI.lineItem: [{ position: 60, value: 'UnitPrice',cssDefault.width: '200px' }]
    @UI.identification: [{ position: 60, value: 'UnitPrice', label: 'Unit Price' }] 
    @Semantics.amount.currencyCode: 'CurrencyCode'     
    UnitPrice,   
    @UI.lineItem: [{ position: 70, value: 'CurrencyCode', hidden: true }]
    @UI.identification: [{ position: 70, value: 'CurrencyCode', hidden: true }] 
    @Consumption.valueHelpDefinition: [{ 
    entity.name: 'I_CurrencyStdVH',
    entity.element: 'Currency',
    useForValidation: true
     }]       
    CurrencyCode,   
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Customers : redirected to ZC_03Customer,
    _Orders : redirected to parent ZC_03CustOrder,
    _Products,
    _Convert
}
