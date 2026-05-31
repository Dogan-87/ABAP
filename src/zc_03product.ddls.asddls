@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View of Products'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_03Product
  provider contract transactional_query as projection on ZI_03Product 
association [0..*] to ZC_03ORDERRECORD as _Records on $projection.ProductId = _Records.ProductId
{

      @UI.facet: [ { id: 'Products',
                     type: #LINEITEM_REFERENCE,
                     label: 'Products',
                     position: 10  }
//               
//              { id: 'Records', 
//               type: #LINEITEM_REFERENCE, 
//               targetElement: '_Records', 
//               label: 'Records',
//               position: 20 }
                           
                           ]


    @UI.lineItem: [{ position: 10, value: 'ProductId' }]
    @UI.identification: [{ position: 10, value: 'ProductId' }]
    key ProductId,
     @UI.lineItem: [{ position: 20, value: 'ProductName' }]
    @UI.identification: [{ position: 20, value: 'ProductName' }]
    ProductName,
    @UI.lineItem: [{ position: 30, value: 'Description' }]
    @UI.identification: [{ position: 30, value: 'Description' }]
    Description,
    @UI.lineItem: [{ position: 40, value: 'UnitPrice' }]
    @UI.identification: [{ position: 40, value: 'UnitPrice' }]
    @Semantics.amount.currencyCode: 'Currency'
    UnitPrice,
    @UI.lineItem: [{ position: 50, value: 'Currency' }]
    @UI.identification: [{ position: 50, value: 'Currency' }]    
    Currency,
    /* Associations */
    _Records
}
