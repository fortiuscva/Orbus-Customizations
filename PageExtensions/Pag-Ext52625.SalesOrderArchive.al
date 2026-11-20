pageextension 52625 "ORB Sales Order Archive" extends "Sales Order Archive"
{
    layout
    {
        addlast(General)
        {
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved escalated issue';
            }
            field("ORB Order Cancelled"; Rec."ORB Order Cancelled")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user whether the LIFT Order is Cancelled or not';
            }
        }

        addfirst(factboxes)
        {
            part(ORBSalesLineArchAddFieldsFB; "ORB SL Arch. Add. Fields FB")
            {
                ApplicationArea = Suite;
                Provider = SalesLinesArchive;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
        }
        addafter("Work Description")
        {
            group("ORB ProductionNote")
            {
                Caption = 'Production Note';
                field("ORB GetProductionNote"; Rec.GetProductionNote())
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                    MultiLine = true;
                    ShowCaption = false;
                    ToolTip = 'Specifies the value of the Production Note field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        addlast("Ver&sion")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Hdr Arch. Add. Flds";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No."), "Version No." = field("Version No."), "Doc. No. Occurrence" = field("Doc. No. Occurrence");
            }
        }
    }
    // trigger OnAfterGetRecord()
    // begin
    //     ProductionNote := Rec.GetProductionNote();
    // end;

    // var
    //     ProductionNote: Text;
}
