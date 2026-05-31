@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status ValueHelp'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_03Status

  as select from zt03status
{
      @UI.facet: [ { id: 'Status',
                     type: #IDENTIFICATION_REFERENCE,
                     label: 'Status' }
                   ]
      @UI.selectionField: [{exclude: true}]
  key status_id   as Status,
      description as Description

}
