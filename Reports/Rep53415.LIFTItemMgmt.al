report 53415 "ORB LIFT Item Mgmt"
{
    ApplicationArea = All;
    Caption = 'LIFT Item Mgmt';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            begin
                if not LIFTItem.Get("No.", '') then
                    InsertLIFTERPItem(Item)
                else
                    ModifyLIFTERPItem(Item, LIFTItem)
            end;
        }
    }
    procedure InsertLIFTERPItem(Item: Record Item)
    begin
        LIFTItem.Init();
        LIFTItem."Item No." := Item."No.";
        LIFTItem.Insert(true);
        ModifyLIFTERPItem(Item, LIFTItem);
    end;

    procedure ModifyLIFTERPItem(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
    begin
        ValidateLIFTERPItemFields(Item, LIFTItem);
        LIFTItem.Modify(true);
    end;

    procedure ValidateLIFTERPItemFields(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
    var
        ProdLineValue: Record "ORB LIFT Product Line Values";
        LIFTMaterial: Record "ORB LIFT Material";
        LIFTStorageType: Record "ORB LIFT Storage Type";
    begin
        LIFTItem.Validate(Description, Item.Description);
        LIFTItem.Validate("Product Name", (Item."No." + ' | ' + Item.Description));
        LIFTItem.Validate("Catalog Id", 7567);

        ProdLineValue.Reset();
        ProdLineValue.SetRange("Product Line Dimension", Item."Product Line Dimension");
        if ProdLineValue.FindFirst() then
            LIFTItem.Validate("Prod Line Dim Id", ProdLineValue.VALUE_ID);

        if ((Item."Replenishment System" = Item."Replenishment System"::Purchase) or (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order")) then
            LIFTItem.Validate("Product Type", 'Regular')
        else if Item."Replenishment System" = Item."Replenishment System"::Assembly then
            LIFTItem.Validate("Product Type", 'Kit');

        if not Item."LV Sourced" then
            LIFTItem.Validate("Ship From Whse Loc Id", 1086748);

        if not Item."Sales Blocked" then
            LIFTItem.Validate(Status, 'A')
        else
            LIFTItem.Validate(Status, 'I');

        if Item."Department Dimension" = '01' then begin
            if Item."Replenishment System" = Item."Replenishment System"::Assembly then begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", 'Kit');
                if LIFTMaterial.FindFirst() then
                    LIFTItem.Validate("Material Id", LIFTMaterial."Material Id");
            end else begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", Item."No.");
                if LIFTMaterial.FindFirst() then
                    LIFTItem.Validate("Material Id", LIFTMaterial."Material Id");
            end;

            LIFTStorageType.Reset();
            LIFTStorageType.SetRange(Name, 'Hardware-FG');
            if LIFTStorageType.FindFirst() then
                LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");

            LIFTItem.Validate("Print Format", 5941450);
        end;

    end;

    var
        LIFTItem: Record "ORB LIFT ERP Item";
}
