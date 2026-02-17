pageextension 52632 "ORB IWX License Plate List" extends "IWX License Plate List"
{
    layout
    {
        addlast(Group)
        {
            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the DS Payment Type field.', Comment = '%';
            }
            field("ORB Posted Sales Invoice No."; GetPostedSalesInvNo())
            {
                Caption = 'Invoice No.';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Invoice No. field.';
                Editable = false;
            }
            field("ORB SystemCreatedAt"; Rec.SystemCreatedAt)
            {
                Caption = 'System Created At';
                ApplicationArea = All;
                ToolTip = 'Specifies the date and time when the License plate was created in the system.';
            }

            field("ORB SystemModifiedAt"; Rec.SystemModifiedAt)
            {
                Caption = 'System Modified At';
                ApplicationArea = All;
                ToolTip = 'Specifies the date and time when the License plate was last modified in the system.';
            }

            field("ORB SystemCreatedBy"; Rec.SystemCreatedBy)
            {
                Caption = 'System Created By';
                ApplicationArea = All;
                ToolTip = 'Specifies the user who created the License plate in the system.';
            }
            field("ORB SystemModifiedBy"; Rec.SystemModifiedBy)
            {
                Caption = 'System Modified By';
                ApplicationArea = All;
                ToolTip = 'Specifies the user who last modified the License plate in the system.';

            }
        }
    }

    local procedure GetPostedSalesInvNo() InvoiceDocNo: Code[20]
    var
        TempSalesInvLine: Record "Sales Invoice Line" temporary;
        InvFound: Boolean;
    begin
        Clear(InvFound);
        InvoiceDocNo := '';
        SalesShptLine.Reset();
        SalesShptLine.SetRange("Document No.", Rec."Shipment No.");
        SalesShptLine.SetFilter("No.", '<>%1', '');
        if SalesShptLine.FindSet() then begin
            repeat
                Clear(TempSalesInvLine);
                TempSalesInvLine.DeleteAll();
                SalesShptLine.GetSalesInvLines(TempSalesInvLine);
                if TempSalesInvLine.FindFirst() then begin
                    InvoiceDocNo := TempSalesInvLine."Document No.";
                    InvFound := true;
                end;
            until (SalesShptLine.Next() = 0) or InvFound;
        end;
    end;

    var
        SalesShptLine: Record "Sales Shipment Line";

}
