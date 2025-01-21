page 52646 "ORB LIFT ERP Permission Setup"
{
    ApplicationArea = All;
    Caption = 'LIFT ERP Permission Setup';
    PageType = List;
    SourceTable = "ORB LIFT ERP Permission Setup";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Get Customers"; Rec."Get Customers")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Get Customers field.', Comment = '%';
                }
                field("Get Sales Orders"; Rec."Get Sales Orders")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Get Sales Orders field.', Comment = '%';
                }
                field("Get Whse. Journal"; Rec."Get Whse. Journal")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Get Whse. Journal field.', Comment = '%';
                }
            }
        }
    }
}
