pageextension 52654 "ORB Released Production Orders" extends "Released Production Orders"
{

    actions
    {

        modify(ProdOrderReport)
        {

            Visible = false;

        }
        addafter("Production Order Statistics")
        {
            action("ORB ProdOrderReportnew")
            {
                ApplicationArea = All;
                Caption = 'Custom Production Order new';
                Promoted = true;
                PromotedCategory = Report;
                Image = Report;

                trigger OnAction()
                var
                    ProdOrderRoutingLine: Record "Prod. Order Routing Line";
                    WorkCenter: Record "Work Center";
                    ManufacturingCommentLine: Record "Manufacturing Comment Line";
                    ProdOrderRoutingCommentLine: Record "Prod. Order Rtng Comment Line";
                    ProdOrderComponent: Record "Prod. Order Component";
                    ProductionOrderHeader: Record "Production Order";
                    MachineCenter: Record "Machine Center";
                    ReservationEntry: Record "Reservation Entry";
                    var1: Integer;
                    var2: Integer;
                    var3: Integer;
                begin
                    ProdOrderRoutingLine.Reset();
                    ProdOrderRoutingLine.SetRange("Prod. Order No.", Rec."No.");
                    ProdOrderRoutingLine.SetRange(Type, ProdOrderRoutingLine.Type::"Work Center");
                    if ProdOrderRoutingLine.FindSet() then
                        repeat
                            ProdOrderRoutingLine."Comment 1" := '';
                            ProdOrderRoutingLine."Comment 2" := '';
                            ProdOrderRoutingLine."Comment 3" := '';
                            ProdOrderRoutingLine."Comment 4" := '';
                            ProdOrderRoutingLine."Comment 5" := '';
                            ProdOrderRoutingLine.Modify();
                            WorkCenter.SetRange("No.", ProdOrderRoutingLine."No.");
                            if WorkCenter.FindFirst() then ManufacturingCommentLine.SetRange("No.", WorkCenter."No.");
                            if ManufacturingCommentLine.FindFirst() then begin
                                ProdOrderRoutingLine."Comment 1" := ManufacturingCommentLine.Comment;
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Comment 2" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Comment 2" = ProdOrderRoutingLine."Comment 1" then ProdOrderRoutingLine."Comment 2" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Comment 3" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Comment 3" = ProdOrderRoutingLine."Comment 2" then ProdOrderRoutingLine."Comment 3" := '';
                                if ProdOrderRoutingLine."Comment 3" = ProdOrderRoutingLine."Comment 1" then ProdOrderRoutingLine."Comment 3" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Comment 4" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Comment 4" = ProdOrderRoutingLine."Comment 3" then ProdOrderRoutingLine."Comment 4" := '';
                                if ProdOrderRoutingLine."Comment 4" = ProdOrderRoutingLine."Comment 2" then ProdOrderRoutingLine."Comment 4" := '';
                                if ProdOrderRoutingLine."Comment 4" = ProdOrderRoutingLine."Comment 1" then ProdOrderRoutingLine."Comment 4" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Comment 5" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Comment 5" = ProdOrderRoutingLine."Comment 4" then ProdOrderRoutingLine."Comment 5" := '';
                                if ProdOrderRoutingLine."Comment 5" = ProdOrderRoutingLine."Comment 3" then ProdOrderRoutingLine."Comment 5" := '';
                                if ProdOrderRoutingLine."Comment 5" = ProdOrderRoutingLine."Comment 2" then ProdOrderRoutingLine."Comment 5" := '';
                                if ProdOrderRoutingLine."Comment 5" = ProdOrderRoutingLine."Comment 1" then ProdOrderRoutingLine."Comment 5" := '';
                                ProdOrderRoutingLine.Modify();
                            end;
                        until ProdOrderRoutingLine.Next() = 0;
                    //
                    ProdOrderRoutingLine.Reset();
                    ProdOrderRoutingLine.SetRange("Prod. Order No.", Rec."No.");
                    ProdOrderRoutingLine.SetRange(Type, ProdOrderRoutingLine.Type::"Machine Center");
                    if ProdOrderRoutingLine.FindSet() then
                        repeat
                            ProdOrderRoutingLine."Machine Comment 1" := '';
                            ProdOrderRoutingLine."Machine Comment 2" := '';
                            ProdOrderRoutingLine."Machine Comment 3" := '';
                            ProdOrderRoutingLine."Machine Comment 4" := '';
                            ProdOrderRoutingLine."Machine Comment 5" := '';
                            ProdOrderRoutingLine.Modify();
                            MachineCenter.SetRange("No.", ProdOrderRoutingLine."No.");
                            if MachineCenter.FindFirst() then ManufacturingCommentLine.SetRange("No.", MachineCenter."No.");
                            if ManufacturingCommentLine.FindFirst() then begin
                                ProdOrderRoutingLine."Machine Comment 1" := ManufacturingCommentLine.Comment;
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Machine Comment 2" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Machine Comment 2" = ProdOrderRoutingLine."Machine Comment 1" then ProdOrderRoutingLine."Machine Comment 2" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Machine Comment 3" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Machine Comment 3" = ProdOrderRoutingLine."Machine Comment 2" then ProdOrderRoutingLine."Machine Comment 3" := '';
                                if ProdOrderRoutingLine."Machine Comment 3" = ProdOrderRoutingLine."Machine Comment 1" then ProdOrderRoutingLine."Machine Comment 3" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Machine Comment 4" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Machine Comment 4" = ProdOrderRoutingLine."Machine Comment 3" then ProdOrderRoutingLine."Machine Comment 4" := '';
                                if ProdOrderRoutingLine."Machine Comment 4" = ProdOrderRoutingLine."Machine Comment 2" then ProdOrderRoutingLine."Machine Comment 4" := '';
                                if ProdOrderRoutingLine."Machine Comment 4" = ProdOrderRoutingLine."Machine Comment 1" then ProdOrderRoutingLine."Machine Comment 4" := '';
                                ManufacturingCommentLine.Next(1);
                                ProdOrderRoutingLine."Machine Comment 5" := ManufacturingCommentLine.Comment;
                                if ProdOrderRoutingLine."Machine Comment 5" = ProdOrderRoutingLine."Machine Comment 4" then ProdOrderRoutingLine."Machine Comment 5" := '';
                                if ProdOrderRoutingLine."Machine Comment 5" = ProdOrderRoutingLine."Machine Comment 3" then ProdOrderRoutingLine."Machine Comment 5" := '';
                                if ProdOrderRoutingLine."Machine Comment 5" = ProdOrderRoutingLine."Machine Comment 2" then ProdOrderRoutingLine."Machine Comment 5" := '';
                                if ProdOrderRoutingLine."Machine Comment 5" = ProdOrderRoutingLine."Machine Comment 1" then ProdOrderRoutingLine."Machine Comment 5" := '';
                                ProdOrderRoutingLine.Modify();
                            end;
                        until ProdOrderRoutingLine.Next() = 0;
                    //
                    ProdOrderRoutingLine.Reset();
                    ProdOrderRoutingLine.SetRange("Prod. Order No.", Rec."No.");
                    if ProdOrderRoutingLine.FindSet() then
                        repeat
                            ProdOrderRoutingCommentLine.SetRange("Prod. Order No.", ProdOrderRoutingLine."Prod. Order No.");
                            ProdOrderRoutingCommentLine.SetRange("Routing No.", ProdOrderRoutingLine."Routing No.");
                            ProdOrderRoutingCommentLine.SetRange("Operation No.", ProdOrderRoutingLine."Operation No.");
                            ProdOrderRoutingLine."Routing Line Comment 1" := '';
                            ProdOrderRoutingLine."Routing Line Comment 2" := '';
                            ProdOrderRoutingLine."Routing Line Comment 3" := '';
                            ProdOrderRoutingLine."Routing Line Comment 4" := '';
                            ProdOrderRoutingLine."Routing Line Comment 5" := '';
                            ProdOrderRoutingLine.Modify();
                            if ProdOrderRoutingCommentLine.FindFirst() then begin
                                ProdOrderRoutingLine."Routing Line Comment 1" := ProdOrderRoutingCommentLine.Comment;
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 2" := ProdOrderRoutingCommentLine.Comment;
                                if ProdOrderRoutingLine."Routing Line Comment 2" = ProdOrderRoutingLine."Routing Line Comment 1" then ProdOrderRoutingLine."Routing Line Comment 2" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 3" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 3" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 3" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 3" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 4" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 4" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 4" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 4" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 4" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 5" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 5" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 5" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 5" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 5" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 5" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 6" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 6" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 6" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 6" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 6" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 6" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 6" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 7" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 7" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 7" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 8" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 8" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 8" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 9" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 9" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 9" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 10" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 10" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 10" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 11" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 11" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 11" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 12" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 12" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 12" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 13" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 13" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 13" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 14" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 14" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 14" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 15" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 15" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 15" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 16" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 15") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 16" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 16" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 17" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 16") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 15") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 17" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 17" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 18" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 17") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 16") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 15") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 18" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 18" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 19" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 18") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 17") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 16") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 15") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 19" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 19" := '';
                                ProdOrderRoutingCommentLine.Next(1);
                                ProdOrderRoutingLine."Routing Line Comment 20" := ProdOrderRoutingCommentLine.Comment;
                                if (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 19") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 18") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 17") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 16") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 15") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 14") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 13") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 12") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 11") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 10") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 9") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 8") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 7") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 6") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 5") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 4") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 3") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 2") or (ProdOrderRoutingLine."Routing Line Comment 20" = ProdOrderRoutingLine."Routing Line Comment 1") then ProdOrderRoutingLine."Routing Line Comment 20" := '';
                                ProdOrderRoutingLine.Modify();
                            end;
                        until ProdOrderRoutingLine.Next() = 0;
                    Commit();
                    if (Rec."Sales Order No." = '') or (Rec."Sales Order No." = 'No SO #') then begin
                        var1 := 0;
                        var2 := 0;
                        var3 := 0;
                        ReservationEntry.Reset();
                        ReservationEntry.SetRange("Source ID", Rec."No.");
                        ReservationEntry.SetFilter("Source Type", '5406');
                        if ReservationEntry.FindFirst() then begin
                            var1 := ReservationEntry."Line No.";
                        end;
                        ReservationEntry.Reset();
                        var2 := var1 - 1;
                        ReservationEntry.SetRange("Line No.", var2);
                        if ReservationEntry.FindFirst() then
                            if ReservationEntry."Source Type" = 37 then begin
                                Rec."Sales Order No." := ReservationEntry."Source ID";
                                Rec.Modify();
                                ReservationEntry.Next(1);
                            end
                            else begin
                                Rec."Sales Order No." := '';
                                Rec.Modify();
                                ReservationEntry.Next(1);
                            end;
                    end;
                    Commit();
                    ProductionOrderHeader.SetRange(Status, Rec.Status::Released);
                    ProductionOrderHeader.SetRange("No.", Rec."No.");
                    Report.RunModal(Report::"ORB Custom Production Order", true, true, ProductionOrderHeader);
                end;
            }
        }

    }
}