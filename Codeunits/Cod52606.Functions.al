codeunit 52606 "ORB Functions"
{
    procedure RestrictZeroTransactionAmountforCreditCardPayment(SalesHeader: Record "Sales Header")
    var
        EFTTransactionRecLcl: Record "EFT Transaction -CL-";
        PaymentMethodLbl: label 'CREDITCARD';
        NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
    begin
        SalesHeader.CalcFields("Amount Including VAT");
        if SalesHeader."Amount Including VAT" > 0 then
            if SalesHeader."Payment Method Code" = PaymentMethodLbl then begin
                EFTTransactionRecLcl.Reset();
                EFTTransactionRecLcl.SetRange("Document Type", SalesHeader."Document Type");
                EFTTransactionRecLcl.SetRange("Document No.", SalesHeader."No.");
                //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                EFTTransactionRecLcl."Transaction Status"::Approved);
                EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                EFTTransactionRecLcl.CalcSums("Transaction Amount");

                if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                    Error(NoValidCreditCardErrorLbl);
            end;
    end;

    procedure CalcINBINQty(ProdOrderComponents: Record "Prod. Order Component"): Decimal
    var
        WarehouseActLinRecLcl: Record "Warehouse Activity Line";
        WarehouseEntryRecLcl: Record "Warehouse Entry";
    begin
        WarehouseActLinRecLcl.Reset();
        WarehouseActLinRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Action Type");
        WarehouseActLinRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseActLinRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseActLinRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseActLinRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseActLinRecLcl.SetRange("Action Type", WarehouseActLinRecLcl."Action Type"::Place);
        IF WarehouseActLinRecLcl.FindSet() then
            WarehouseActLinRecLcl.CalcSums(Quantity);

        WarehouseEntryRecLcl.Reset();
        WarehouseEntryRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntryRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntryRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntryRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntryRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntryRecLcl.SetRange("Reference Document", WarehouseEntryRecLcl."Reference Document"::Pick);
        IF WarehouseEntryRecLcl.FindSet() then
            WarehouseEntryRecLcl.CalcSums(Quantity);

        exit(WarehouseActLinRecLcl.Quantity + WarehouseEntryRecLcl.Quantity);
    end;

    procedure CalcReviewRequiredQty(ProdOrderComponents: Record "Prod. Order Component"): Decimal
    var
        WarehouseActLinRecLcl: Record "Warehouse Activity Line";
        WarehouseEntryRecLcl: Record "Warehouse Entry";
        WarehouseEntry2RecLcl: Record "Warehouse Entry";
    begin
        WarehouseActLinRecLcl.Reset();
        WarehouseActLinRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Action Type");
        WarehouseActLinRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseActLinRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseActLinRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseActLinRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseActLinRecLcl.SetRange("Action Type", WarehouseActLinRecLcl."Action Type"::Place);
        IF WarehouseActLinRecLcl.FindSet() then
            WarehouseActLinRecLcl.CalcSums(Quantity);

        WarehouseEntryRecLcl.Reset();
        WarehouseEntryRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntryRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntryRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntryRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntryRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntryRecLcl.SetRange("Reference Document", WarehouseEntryRecLcl."Reference Document"::Pick);
        IF WarehouseEntryRecLcl.FindSet() then
            WarehouseEntryRecLcl.CalcSums(Quantity);

        WarehouseEntry2RecLcl.Reset();
        WarehouseEntry2RecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntry2RecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntry2RecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntry2RecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntry2RecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntry2RecLcl.SetRange("Reference Document", WarehouseEntry2RecLcl."Reference Document"::"Prod.");
        IF WarehouseEntry2RecLcl.FindSet() then
            WarehouseEntry2RecLcl.CalcSums(Quantity);

        exit(WarehouseActLinRecLcl.Quantity + WarehouseEntryRecLcl.Quantity - Abs(WarehouseEntry2RecLcl.Quantity));
    end;

    procedure UpdateTakeZone(WarehouseActHeaderPar: Record "Warehouse Activity Header")
    var
        WarehouseActLineRecLcl: Record "Warehouse Activity Line";
    begin
        if not Confirm('Are you sure you want to update the "Take" line zone code', false) then
            exit;

        WarehouseActLineRecLcl.Reset();
        WarehouseActLineRecLcl.SetRange("Activity Type", WarehouseActLineRecLcl."Activity Type"::Pick);
        WarehouseActLineRecLcl.SetRange("No.", WarehouseActHeaderPar."No.");
        if WarehouseActLineRecLcl.FindSet() then
            repeat

            until WarehouseActLineRecLcl.Next() = 0;
    end;
}
