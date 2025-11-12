pageextension 53402 "ORB Item Variant Card" extends "Item Variant Card"
{
    layout
    {
        addlast(ItemVariant)
        {
            field("ORB Material Id"; Rec."ORB Material Id")
            {
                ApplicationArea = all;
            }
            field("ORB Material Name"; Rec."ORB Material Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Material Name field.', Comment = '%';
            }
            field("ORB Storage Type Id"; Rec."ORB Storage Type Id")
            {
                ApplicationArea = all;
            }
            field("ORB Storage Type Name"; Rec."ORB Storage Type Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Storage Type Name field.', Comment = '%';
            }
            field("ORB Do Not Integrate"; Rec."ORB Do Not Integrate")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Do Not Integrate field.', Comment = '%';
            }
        }
    }
}
