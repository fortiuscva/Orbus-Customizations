page 53449 "ORB Case Log"
{
    ApplicationArea = All;
    Caption = 'Case Log';
    PageType = List;
    SourceTable = "ORB Case Buffer";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                    trigger OnDrillDown()
                    begin
                        if Rec."Document Type" = Rec."Document Type"::"Posted Sales Invoice" then begin
                            SalesInvoiceHeader.Reset();
                            if SalesInvoiceHeader.Get(Rec."Document No.") then
                                Page.RunModal(Page::"Posted Sales Invoice", SalesInvoiceHeader);
                        end
                        else if Rec."Document Type" = Rec."Document Type"::"Sales Order" then begin
                            SalesHeader.Reset();
                            if SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."Document No.") then
                                Page.RunModal(Page::"Sales Order", SalesHeader);
                        end;
                    end;
                }
                field("Case No."; Rec."Case No.")
                {
                    ToolTip = 'Specifies the value of the Case No. field.', Comment = '%';
                    trigger OnDrillDown()
                    begin
                        CaseWSG.Reset();
                        if CaseWSG.Get(Rec."Case No.") then
                            Page.RunModal(Page::"Case Card WSG", CaseWSG);
                    end;
                }
                field("Entity Type"; Rec."Entity Type")
                {
                    ToolTip = 'Specifies the value of the Entity Type field.', Comment = '%';
                }
                field("Entity No."; Rec."Entity No.")
                {
                    ToolTip = 'Specifies the value of the Entity No. field.', Comment = '%';
                }
                field("Entity Name"; Rec."Entity Name")
                {
                    ToolTip = 'Specifies the value of the Entity Name field.', Comment = '%';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the value of the Contact Name field.', Comment = '%';
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ToolTip = 'Specifies the value of the Contact Email field.', Comment = '%';
                }
                field("Contact Phone"; Rec."Contact Phone")
                {
                    ToolTip = 'Specifies the value of the Contact Phone field.', Comment = '%';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field.', Comment = '%';
                }
                field("Customer Complaint"; Rec."Customer Complaint")
                {
                    ToolTip = 'Specifies the value of the Customer Complaint field.', Comment = '%';
                }
                field("Customer Expectation"; Rec."Customer Expectation")
                {
                    ToolTip = 'Specifies the value of the Customer Expectation field.', Comment = '%';
                }
                field("Describe Issue"; Rec."Describe Issue")
                {
                    ToolTip = 'Specifies the value of the Describe Issue field.', Comment = '%';
                }
                field(Link; Rec.Link)
                {
                    ToolTip = 'Specifies the value of the Link field.', Comment = '%';
                }
                field("Must Arrive Date"; Rec."Must Arrive Date")
                {
                    ToolTip = 'Specifies the value of the Must Arrive Date field.', Comment = '%';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name field.', Comment = '%';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ToolTip = 'Specifies the value of the Ship-to Contact field.', Comment = '%';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address field.', Comment = '%';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address 2 field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                }
                field("Magento Result ID"; Rec."Magento Result ID")
                {
                    ToolTip = 'Specifies the value of the Magento Result ID field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(ShowDocument)
            {
                ApplicationArea = all;
                Caption = 'Show Document';
                Image = EditLines;
                trigger OnAction()
                begin
                    if Rec."Document Type" = Rec."Document Type"::"Posted Sales Invoice" then begin
                        SalesInvoiceHeader.Reset();
                        if SalesInvoiceHeader.Get(Rec."Document No.") then
                            Page.Run(Page::"Posted Sales Invoice", SalesInvoiceHeader);
                    end
                    else if Rec."Document Type" = Rec."Document Type"::"Sales Order" then begin
                        SalesHeader.Reset();
                        if SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."Document No.") then
                            Page.Run(Page::"Sales Order", SalesHeader);
                    end;
                end;
            }
            action(ShowCaseCard)
            {
                ApplicationArea = all;
                Caption = 'Show Case Card';
                Image = EditLines;
                trigger OnAction()
                begin
                    CaseWSG.Reset();
                    if CaseWSG.Get(Rec."Case No.") then
                        Page.Run(Page::"Case Card WSG", CaseWSG);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Card_Promoted; ShowDocument)
                {
                }
                actionref(CaseCard_Promoted; ShowCaseCard)
                {
                }
            }
        }
    }
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        CaseWSG: Record "Case WSG";
}
