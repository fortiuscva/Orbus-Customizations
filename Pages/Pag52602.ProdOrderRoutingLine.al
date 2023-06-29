page 52602 "ORB Prod. Order Routing Line"
{
    ApplicationArea = All;
    Caption = 'Prod. Order Routing Line';
    PageType = List;
    SourceTable = "Prod. Order Routing Line";
    UsageCategory = Lists;
    Editable = false;
    SourceTableView = sorting(Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.") where(Status = filter(Released));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Routing No."; Rec."Routing No.")
                {
                    ToolTip = 'This field is used internally to identify the operation to record time against, and corresponds to the routing reference number of the production order line.';
                }
                field("Operation No."; Rec."Operation No.")
                {
                    ToolTip = 'Operation No.';
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ToolTip = 'Prod. Order No.';
                }
                field("SFI Prod. Order Item No."; Rec."SFI Prod. Order Item No.")
                {
                    ToolTip = 'Prod. Item No.';
                }
                field("Routing Status"; Rec."Routing Status")
                {
                    ToolTip = 'Specifies the status of the routing line, such as Planned, In Progress, or Finished.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Web Service Use Only';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the time card.';
                }
                field("SFI Total Unposted Run Time"; Rec."SFI Total Unposted Run Time")
                {
                    ToolTip = 'Total Unposted Run Time';
                }
                field("SFI Total Posted Run Time"; Rec."SFI Total Posted Run Time")
                {
                    ToolTip = 'Total Posted Run Time';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Contains a description for the time card. The description is auto-generated, but can be overridden.';
                }
                field("SFI Pending Quantity"; Rec."SFI Pending Quantity")
                {
                    ToolTip = 'Output quantity not yet posted.';
                }
                field("SFI Finished Quantity"; Rec."SFI Finished Quantity")
                {
                    ToolTip = 'The finished quantity.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the location where the machine or work center on the production order routing line operates.';
                }
                field("Routing Reference No."; Rec."Routing Reference No.")
                {
                    ToolTip = 'Web Service Use Only';
                }
            }
        }
    }
}
