page 53433 "ORB LIFT Materials"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbLIFTMaterials';
    DelayedInsert = true;
    EntityName = 'LIFTMaterials';
    EntitySetName = 'LIFTMaterials';
    PageType = API;
    SourceTable = "ORB LIFT Material";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(materialId; Rec."Material Id")
                {
                    Caption = 'Material Id';
                }
                field(materialName; Rec."Material Name")
                {
                    Caption = 'Material Name';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(mfgProfileId; Rec."MFG Profile Id")
                {
                    Caption = 'MFG Profile Id';
                }
                field(materialTypeId; Rec."Material Type Id")
                {
                    Caption = 'Material Type Id';
                }
                field(primaryVendorId; Rec."Primary Vendor Id")
                {
                    Caption = 'Primary Vendor Id';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(category; Rec.Category)
                {
                    Caption = 'Category';
                }
                field(subCategory; Rec."Sub Category")
                {
                    Caption = 'Sub Category';
                }
            }
        }
    }
}
