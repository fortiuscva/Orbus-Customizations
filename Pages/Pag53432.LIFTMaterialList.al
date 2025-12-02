page 53432 "ORB LIFT Material List"
{
    ApplicationArea = All;
    Caption = 'LIFT Materials';
    PageType = List;
    SourceTable = "ORB LIFT Material";
    UsageCategory = Lists;
    // Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Material Id"; Rec."Material Id")
                {
                    ToolTip = 'Specifies the value of the Material Id field.', Comment = '%';
                }
                field("Material Name"; Rec."Material Name")
                {
                    ToolTip = 'Specifies the value of the Material Name field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("MFG Profile Id"; Rec."MFG Profile Id")
                {
                    ToolTip = 'Specifies the value of the MFG Profile Id field.', Comment = '%';
                }
                field("Material Type Id"; Rec."Material Type Id")
                {
                    ToolTip = 'Specifies the value of the Material Type Id field.', Comment = '%';
                }
                field("Primary Vendor Id"; Rec."Primary Vendor Id")
                {
                    ToolTip = 'Specifies the value of the Primary Vendor Id field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ToolTip = 'Specifies the value of the Sub Category field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
            }
        }
    }
}
