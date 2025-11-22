page 53434 "ORB LIFT HW Material Variants"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'Hardware Material Variants API';
    DelayedInsert = true;
    EntityName = 'HardwareMaterialVariantsAPI';
    EntitySetName = 'HardwareMaterialVariantsAPI';
    PageType = API;
    SourceTable = "Item Variant";
    SourceTableView = where(Blocked = const(false), "ORB Department Dimension" = const('01'), "ORB Material Id" = filter(<> 0), "ORB Storage Type Id" = filter(<> 0), "ORB Do Not Integrate" = const(false));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                // field(blocked; Rec.Blocked)
                // {
                //     Caption = 'Blocked';
                // }
                // field(DepartmentDimension; Rec."ORB Department Dimension")
                // {
                //     Caption = 'Department Dimension';
                // }
                field(materialId; Rec."ORB Material Id")
                {
                    Caption = 'ORB Material Id';
                }
                field(materialName; Rec."ORB Material Name")
                {
                    Caption = 'Material Name';
                }
                field(storageTypeId; Rec."ORB Storage Type Id")
                {
                    Caption = 'ORB Storage Type Id';
                }
                field(storageTypeName; Rec."ORB Storage Type Name")
                {
                    Caption = 'Storage Type Name';
                }
                // field(orbDoNotIntegrate; Rec."ORB Do Not Integrate")
                // {
                //     Caption = 'Do Not Integrate';
                // }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
            }
        }
    }
}
