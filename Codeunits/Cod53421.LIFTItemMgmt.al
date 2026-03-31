codeunit 53421 "ORB LIFT Item Mgmt."
{
    procedure InsertBCItemIntoStagingTable(Item: Record Item)
    begin
        LIFTItem.Init();
        LIFTItem."Item No." := Item."No.";
        LIFTItem."Variant Code" := '';
        LIFTItem.Insert(true);
        ModifyBCItemInStagingTable(Item, LIFTItem);
    end;

    procedure ModifyBCItemInStagingTable(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
    begin
        ValidateBCItemFieldsInStagingTable(Item, LIFTItem);
        LIFTItem.Modify(true);
    end;

    procedure ValidateBCItemFieldsInStagingTable(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
    var
        ProdLineValue: Record "ORB LIFT Product Line Values";
        LIFTMaterial: Record "ORB LIFT Material";
        LIFTStorageType: Record "ORB LIFT Storage Type";
    begin

        LIFTItem.Validate(Description, Item.Description);
        LIFTItem.Validate("Product Name", (Item."No." + ' | ' + Item.Description));
        LIFTItem.Validate("Catalog Id", 7567);

        LIFTItem.Validate("Do Not Integrate (Material)", Item."ORB Do Not Integrate");
        LIFTItem.Validate("Do Not Integrate (Sellable)", Item."ORB Do Not Integrate (Sell)");

        ProdLineValue.Reset();
        ProdLineValue.SetRange("Product Line Dimension", Item."Product Line Dimension");
        if ProdLineValue.FindFirst() then
            LIFTItem.Validate("Prod Line Dim Id", ProdLineValue.VALUE_ID);

        if ((Item."Replenishment System" = Item."Replenishment System"::Purchase) or (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order")) then
            LIFTItem.Validate("Product Type", 'Regular')
        else if Item."Replenishment System" = Item."Replenishment System"::Assembly then
            LIFTItem.Validate("Product Type", 'Kit');

        if not Item."LV Sourced" then
            LIFTItem.Validate("Ship From Whse Loc Id", 1086748)
        else
            LIFTItem.Validate("Ship From Whse Loc Id", 0);

        if not Item."Sales Blocked" then
            LIFTItem.Validate(Status, 'A')
        else
            LIFTItem.Validate(Status, 'I');

        if Item."Department Dimension" = '01' then begin
            if Item."Replenishment System" = Item."Replenishment System"::Assembly then begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", 'Kit');
                if LIFTMaterial.FindFirst() then
                    LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");
            end
            else if ((Item."Replenishment System" = Item."Replenishment System"::Purchase) or (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order")) then begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", LIFTItem."Item No.");
                if LIFTMaterial.FindFirst() then
                    LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");
            end;

            LIFTStorageType.Reset();
            LIFTStorageType.SetRange(Name, 'Hardware-FG');
            LIFTStorageType.FindFirst();
            LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");
            LIFTItem.Validate("Print Format", 5941450);
        end;

        LIFTItem.Validate("Unit Cost", Item."Unit Cost");
        LIFTItem.Validate("To Be Synchronized", true);
    end;

    procedure InsertBCItemVariantIntoStagingTable(ItemVariant: Record "Item Variant")
    begin
        LIFTItem.Init();
        LIFTItem."Item No." := ItemVariant."Item No.";
        LIFTItem."Variant Code" := ItemVariant.Code;
        LIFTItem.Insert(true);
        ModifyBCItemVariantInStagingTable(ItemVariant, LIFTItem);
    end;

    procedure ModifyBCItemVariantInStagingTable(ItemVariant: Record "Item Variant"; var LIFTItem: Record "ORB LIFT ERP Item")
    begin
        ValidateBCItemVariantFieldsInStagingTable(ItemVariant, LIFTItem);
        LIFTItem.Modify(true);
    end;

    procedure ValidateBCItemVariantFieldsInStagingTable(ItemVariant: Record "Item Variant"; var LIFTItem: Record "ORB LIFT ERP Item")
    var
        LIFTStorageType: Record "ORB LIFT Storage Type";
        ItemRec: Record Item;
    begin
        LIFTItem.Validate(Description, ItemVariant.Description);
        LIFTItem.Validate("Do Not Integrate (Material)", ItemVariant."ORB Do Not Integrate");
        LIFTItem.Validate("Do Not Integrate (Sellable)", ItemVariant."ORB Do Not Integrate (Sell)");

        ItemRec.Reset();
        ItemRec.SetRange("No.", ItemVariant."Item No.");
        ItemRec.FindFirst();
        if not ItemRec."Sales Blocked" then
            LIFTItem.Validate(Status, 'A')
        else
            LIFTItem.Validate(Status, 'I');

        LIFTItem.Validate("Unit Cost", ItemRec."Unit Cost");

        LIFTStorageType.Reset();
        LIFTStorageType.SetRange(Name, ItemVariant.Code);
        if LIFTStorageType.FindFirst() then
            LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");

        LIFTItem.Validate("To Be Synchronized", true);
    end;

    var
        LIFTItem: Record "ORB LIFT ERP Item";
}
