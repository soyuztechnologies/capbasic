using { CatalogService } from '../../srv/CatalogService';

//First Screen with Search Fields and Table Columns
annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common:{
            Text: PARTNER_GUID.COMPANY_NAME
        },
        ValueList.entity: CatalogService.BPSet
    )
};

@cds.odata.valuelist
annotate CatalogService.BPSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

annotate CatalogService.POItems with {
    PRODUCT_GUID@(
        Common:{
            Text: PRODUCT_GUID_NODE_KEY.PRODUCT_ID
        },
        ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);

annotate CatalogService.POs with @(
    UI: {
        SelectionFields  : [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            CURRENCY_CODE
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Boost',
                Action: 'CatalogService.boost',
                Inline: true
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
                Criticality: Criticality,
                CriticalityRepresentation: #WithIcon
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>PurchaseOrder}',
            TypeNamePlural : '{i18n>PurchaseOrders}',
            Title: {
                Label : '{i18n>POID}',
                Value: ID
            },
            Description: {
                Label : '{i18n>DESC}',
                Value: PARTNER_GUID.COMPANY_NAME
            },
            ImageUrl : 'https://yt3.ggpht.com/ytc/AAUvwnh3wZ_lF5toqPaf4QiypgoSn9BD5rZQXhC2bvRO3Rc=s900-c-k-c0x00ffffff-no-rj',
        },
        Facets  : [{
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>POGeneralInfo}',
            Target: ![@UI.FieldGroup#HeaderGeneralInformation]
        },{
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>POItemDetails}',
            Target : 'Items/@UI.LineItem',
            
        }
        ],
        FieldGroup#HeaderGeneralInformation  : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type : 'UI.DataField',
                    Value : PO_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID_NODE_KEY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.COMPANY_NAME,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PARTNER_GUID.BP_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : NET_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_CODE,
                },
                {
                    $Type : 'UI.DataField',
                    Value : LIFECYCLE_STATUS,
                },
            ]
        },
    }

);
annotate CatalogService.POItems with @(
    UI:{
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.ProductId,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_CODE,
            },
        ],

        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'PO Item',
            TypeNamePlural : 'PO Items',
            Title : {
                $Type : 'UI.DataField',
                Value : ID,
            },
            Description: {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
        },
        Facets  : [
            {
                Label: '{i18n>lineItemHeader}',
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#LineItemHeader',
            },
            {
                Label: 'Product Details',
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#ProductDetails',
            },
        ],
        FieldGroup#LineItemHeader : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : PO_ITEM_POS,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID_NODE_KEY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : NET_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_CODE,
                },
            ],
        },
        FieldGroup#ProductDetails : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.ProductId,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.DESCRIPTION,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.TYPE_CODE,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.CATEGORY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.TAX_TARIF_CODE,
                },
            ],
        },
    }

);

// annotate CatalogService.ProductSet with @(

//     UI: {
//         HeaderInfo  : {
//             $Type : 'UI.HeaderInfoType',
//             TypeName : 'Product',
//             TypeNamePlural : 'Products',
//             Title: {
//                 Value: PRODUCT_ID
//             },
//             Description : {
//                 Value : DESCRIPTION,
//             },
//             ImageUrl: 'sap-icon://product'
//         },
//         FieldGroup#ProductDetails  : {
//             $Type : 'UI.FieldGroupType',
//             Data : [
//                 {
//                     $Type : 'UI.DataField',
//                     Value : PRODUCT_ID,
//                 },
//                 {
//                     $Type : 'UI.DataField',
//                     Value : DESCRIPTION,
//                 },
//                 {
//                     $Type : 'UI.DataField',
//                     Value : TYPE_CODE,
//                 },
//                 {
//                     $Type : 'UI.DataField',
//                     Value : CATEGORY,
//                 },
//                 {
//                     $Type : 'UI.DataField',
//                     Value : SUPPLIER_GUID.COMPANY_NAME,
//                 },
//             ],
//         },
//     }

// );


