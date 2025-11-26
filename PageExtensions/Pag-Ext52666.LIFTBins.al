pageextension 52666 "ORB LIFT Bins" extends Bins
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Bin Location Id"; Rec."ORB Bin Location Id")
            {

                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast("&Bin")
        {
            action("ORB Update Bin Location Id")
            {
                ApplicationArea = all;

                trigger OnAction()
                var
                    BinRecLcl: Record Bin;
                begin
                    BinRecLcl.Reset();
                    BinRecLcl.SetRange("Location Code", rec."Location Code");
                    BinRecLcl.SetRange(Code, rec.Code);
                    if BinRecLcl.FindFirst() then
                        Report.RunModal(Report::"ORB Update Bin Location ID", true, false, BinRecLcl);
                end;
            }
        }
    }
}
