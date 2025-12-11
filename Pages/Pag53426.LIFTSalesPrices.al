page 53426 "ORB LIFT Sales Prices"
{
    ApplicationArea = All;
    Caption = 'LIFT Sales Prices';
    PageType = Worksheet;
    SourceTable = "ORB LIFT Sales Price";
    // Editable = false;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Sales Type"; Rec."Sales Type")
                {
                    ToolTip = 'Specifies the value of the Sales Type field.', Comment = '%';
                }
                field("Sales Code"; Rec."Sales Code")
                {
                    ToolTip = 'Specifies the value of the Sales Code field.', Comment = '%';
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit Of Measure Code field.', Comment = '%';
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ToolTip = 'Specifies the value of the Minimum Quantity field.', Comment = '%';
                }
                field("Maximum Quantity"; Rec."ORB LIFT Maximum Quantity")
                {
                    ToolTip = 'Specifies the value of the Maximum Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.', Comment = '%';
                }
                field("ORB LIFT Status"; Rec."ORB LIFT Status")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Sent to Celigo"; Rec."Sent to Celigo")
                {
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Sent to Celigo field.', Comment = '%';
                }
                field("To Be Processed"; Rec."To Be Processed")
                {
                    // Editable = false;
                    ToolTip = 'This field will be used to process sales price sync. in batches', Comment = '%';
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
            group(Control22)
            {
                ShowCaption = false;
                fixed(Control1900669001)
                {
                    ShowCaption = false;
                    group("Total No. of Items")
                    {
                        Caption = 'Total No. of Items';
                        field(TotalNoofItems; TotalNoofItems)
                        {
                            ApplicationArea = All;
                            Editable = false;
                            ShowCaption = false;

                            trigger OnDrillDown()
                            begin
                                LIFTSalesPriceItems.Reset();
                                Page.RunModal(0, LIFTSalesPriceItems);
                            end;
                        }
                    }
                    group("Processed Items")
                    {
                        Caption = 'Processed Items';
                        field(NoofItemsProcessed; NoofProcessedItems)
                        {
                            ApplicationArea = All;
                            Editable = false;
                            ShowCaption = false;

                            trigger OnDrillDown()
                            begin
                                LIFTSalesPriceItems.Reset();
                                LIFTSalesPriceItems.SetRange(Processed, true);
                                Page.RunModal(0, LIFTSalesPriceItems);
                            end;
                        }
                    }
                    group("Unprocessed Items")
                    {
                        Caption = 'Unprocessed Items';
                        field(NoofItemsUnprocessed; NoofUnprocessedItems)
                        {
                            ApplicationArea = All;
                            Editable = false;
                            ShowCaption = false;
                            trigger OnDrillDown()
                            begin
                                LIFTSalesPriceItems.Reset();
                                LIFTSalesPriceItems.SetRange(Processed, false);
                                Page.RunModal(0, LIFTSalesPriceItems);
                            end;
                        }
                    }

                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(LIFTSalesPriceItems)
            {
                Caption = 'Items';
                ApplicationArea = All;
                Image = ItemLines;
                RunObject = page "ORB LIFT SP Items";
            }

            action(LIFTUpdateSalesPriceItems)
            {
                Caption = 'Update Sales Price Processed Items';
                ApplicationArea = All;
                Image = ItemGroup;
                RunObject = report "ORB LIFT Update SP Items";
                trigger OnAction()
                begin
                    CurrPage.Update(false);
                end;
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(LIFTSalesPriceItems_Promoted; LIFTSalesPriceItems)
                {
                }
                actionref(LIFTUpdateSalesPriceItems_Promoted; LIFTUpdateSalesPriceItems)
                {
                }

            }
        }
        area(Processing)
        {
            group(Celigo)
            {
                Caption = 'Celigo';
                action(EnableSentToCeligo)
                {
                    Caption = 'Enable Sent to Celigo';
                    ApplicationArea = all;
                    Image = ChangeStatus;
                    trigger OnAction()
                    var
                        LIFTSalesPrice: Record "ORB LIFT Sales Price";
                    begin
                        if Confirm('Do you want to Enable the Sent to Celigo flag?', false) then begin
                            CurrPage.SetSelectionFilter(LIFTSalesPrice);
                            LIFTSalesPrice.MarkedOnly(True);
                            if LIFTSalesPrice.FindSet() then begin
                                repeat
                                    LIFTSalesPrice."Sent to Celigo" := true;
                                    LIFTSalesPrice.Modify(true);
                                until LIFTSalesPrice.Next() = 0;
                            end;
                            CurrPage.Update();
                        end;
                    end;
                }
                action(DisableSentToCeligo)
                {
                    Caption = 'Disable Sent to Celigo';
                    ApplicationArea = all;
                    Image = ChangeStatus;
                    trigger OnAction()
                    var
                        LIFTSalesPrice: Record "ORB LIFT Sales Price";
                    begin
                        if Confirm('Do you want to Disable the Sent to Celigo flag?', false) then begin
                            CurrPage.SetSelectionFilter(LIFTSalesPrice);
                            LIFTSalesPrice.MarkedOnly(True);
                            if LIFTSalesPrice.FindSet() then begin
                                repeat
                                    LIFTSalesPrice."Sent to Celigo" := false;
                                    LIFTSalesPrice.Modify(true);
                                until LIFTSalesPrice.Next() = 0;
                            end;
                            CurrPage.Update();
                        end;
                    end;
                }
                action(EnableToBeProcessed)
                {
                    Caption = 'Enable To Be Processed';
                    ApplicationArea = all;
                    Image = ChangeStatus;
                    trigger OnAction()
                    var
                        LIFTSalesPrice: Record "ORB LIFT Sales Price";
                    begin
                        if Confirm('Do you want to Enable the To Be Processed flag?', false) then begin
                            CurrPage.SetSelectionFilter(LIFTSalesPrice);
                            LIFTSalesPrice.MarkedOnly(True);
                            if LIFTSalesPrice.FindSet() then begin
                                repeat
                                    LIFTSalesPrice."To Be Processed" := true;
                                    LIFTSalesPrice.Modify(true);
                                until LIFTSalesPrice.Next() = 0;
                            end;
                            CurrPage.Update();
                        end;
                    end;
                }
                action(DisableToBeProcessed)
                {
                    Caption = 'Disable To Be Processed';
                    ApplicationArea = all;
                    Image = ChangeStatus;
                    trigger OnAction()
                    var
                        LIFTSalesPrice: Record "ORB LIFT Sales Price";
                    begin
                        if Confirm('Do you want to Disable the To Be Processed flag?', false) then begin
                            CurrPage.SetSelectionFilter(LIFTSalesPrice);
                            LIFTSalesPrice.MarkedOnly(True);
                            if LIFTSalesPrice.FindSet() then begin
                                repeat
                                    LIFTSalesPrice."To Be Processed" := false;
                                    LIFTSalesPrice.Modify(true);
                                until LIFTSalesPrice.Next() = 0;
                            end;
                            CurrPage.Update();
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        NoofProcessedItems := 0;
        NoofUnprocessedItems := 0;
        TotalNoofItems := 0;

        LIFTSalesPriceItems.Reset();
        TotalNoofItems := LIFTSalesPriceItems.Count;

        LIFTSalesPriceItems.Reset();
        LIFTSalesPriceItems.SetRange(Processed, true);
        NoofProcessedItems := LIFTSalesPriceItems.Count;

        LIFTSalesPriceItems.Reset();
        LIFTSalesPriceItems.SetRange(Processed, false);
        NoofUnprocessedItems := LIFTSalesPriceItems.Count;
    end;

    var
        NoofProcessedItems: Integer;
        NoofUnprocessedItems: Integer;
        TotalNoofItems: Integer;
        LIFTSalesPriceItems: Record "ORB LIFT Sales Price Items";
}
