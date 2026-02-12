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
        ItemVariantLcl: Record "Item Variant";
        DimensionValue: Record "Dimension Value";
    begin
        if LIFTItem.Description <> Item.Description then
            LIFTItem.Validate(Description, Item.Description);

        if LIFTItem."Product Name" <> (Item."No." + ' | ' + Item.Description) then
            LIFTItem.Validate("Product Name", (Item."No." + ' | ' + Item.Description));

        if LIFTItem."Catalog Id" <> 7567 then
            LIFTItem.Validate("Catalog Id", 7567);

        if LIFTItem."Do Not Integrate (Material)" <> Item."ORB Do Not Integrate" then
            LIFTItem.Validate("Do Not Integrate (Material)", Item."ORB Do Not Integrate");

        if LIFTItem."Do Not Integrate (Sellable)" <> Item."ORB Do Not Integrate (Sell)" then
            LIFTItem.Validate("Do Not Integrate (Sellable)", Item."ORB Do Not Integrate (Sell)");

        ProdLineValue.Reset();
        ProdLineValue.SetRange("Product Line Dimension", Item."Product Line Dimension");
        if ProdLineValue.FindFirst() then begin
            if LIFTItem."Prod Line Dim Id" <> ProdLineValue.VALUE_ID then
                LIFTItem.Validate("Prod Line Dim Id", ProdLineValue.VALUE_ID);

            if LIFTItem."Material Category Id" <> ProdLineValue."Category Id" then
                LIFTItem.Validate("Material Category Id", ProdLineValue."Category Id");

            if LIFTItem."Material Subcategory Id" <> ProdLineValue."Subcategory Id" then
                LIFTItem.Validate("Material Subcategory Id", ProdLineValue."Subcategory Id");
        end;

        if ((Item."Replenishment System" = Item."Replenishment System"::Purchase) or (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order")) then begin
            if LIFTItem."Product Type" <> 'Regular' then
                LIFTItem.Validate("Product Type", 'Regular');
        end
        else if Item."Replenishment System" = Item."Replenishment System"::Assembly then
            if LIFTItem."Product Type" <> 'Kit' then
                LIFTItem.Validate("Product Type", 'Kit');

        if not Item."LV Sourced" then begin
            if LIFTItem."Ship From Whse Loc Id" <> 1086748 then
                LIFTItem.Validate("Ship From Whse Loc Id", 1086748);
        end
        else
            if LIFTItem."Ship From Whse Loc Id" <> 0 then
                LIFTItem.Validate("Ship From Whse Loc Id", 0);

        if not Item."Sales Blocked" then begin
            if LIFTItem.Status <> 'A' then
                LIFTItem.Validate(Status, 'A')
        end
        else
            if LIFTItem.Status <> 'I' then
                LIFTItem.Validate(Status, 'I');

        if Item."Department Dimension" = '01' then begin
            if Item."Replenishment System" = Item."Replenishment System"::Assembly then begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", 'Kit');
                if LIFTMaterial.FindFirst() then
                    if LIFTItem."Product Material Id" <> LIFTMaterial."Material Id" then
                        LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");
            end
            else if ((Item."Replenishment System" = Item."Replenishment System"::Purchase) or (Item."Replenishment System" = Item."Replenishment System"::"Prod. Order")) then begin
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", LIFTItem."Item No.");
                if LIFTMaterial.FindFirst() then
                    if LIFTItem."Product Material Id" <> LIFTMaterial."Material Id" then
                        LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");
            end;

            LIFTStorageType.Reset();
            LIFTStorageType.SetRange(Name, 'Hardware-FG');
            LIFTStorageType.FindFirst();
            if LIFTItem."Storage Type Id" <> LIFTStorageType."Storage Type ID" then
                LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");

            if LIFTItem."Print Format" <> 5941450 then
                LIFTItem.Validate("Print Format", 5941450);
        end
        else if Item."Department Dimension" = '02' then begin
            DimensionValue.Reset();
            DimensionValue.Get('MATERIAL', Item."Material Dimension");
            LIFTMaterial.Reset();
            LIFTMaterial.SetRange("Material Name", DimensionValue.Name);
            LIFTMaterial.FindFirst();
            if LIFTItem."Product Material Id" <> LIFTMaterial."Material Id" then
                LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");

            LIFTStorageType.Reset();
            LIFTStorageType.SetRange(Name, '--Select Variant--');
            LIFTStorageType.FindFirst();
            if LIFTItem."Storage Type Id" <> LIFTStorageType."Storage Type ID" then
                LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");
        end;

        if LIFTItem."Variant Code" = '' then begin
            ItemVariantLcl.Reset();
            ItemVariantLcl.SetRange("Item No.", LIFTItem."Item No.");
            if ItemVariantLcl.FindLast() then
                if not LIFTItem."Has Variants" then
                    LIFTItem.Validate("Has Variants", true);
        end;

        if LIFTItem."Unit Cost" <> Item."Unit Cost" then
            LIFTItem.Validate("Unit Cost", Item."Unit Cost");

        if not LIFTItem."To Be Synchronized" then
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
        LiftItemLcl: Record "ORB LIFT ERP Item";
    begin
        if LIFTItem.Description <> ItemVariant.Description then
            LIFTItem.Validate(Description, ItemVariant.Description);

        if LIFTItem."Do Not Integrate (Material)" <> ItemVariant."ORB Do Not Integrate" then
            LIFTItem.Validate("Do Not Integrate (Material)", ItemVariant."ORB Do Not Integrate");

        if LIFTItem."Do Not Integrate (Sellable)" <> ItemVariant."ORB Do Not Integrate (Sell)" then
            LIFTItem.Validate("Do Not Integrate (Sellable)", ItemVariant."ORB Do Not Integrate (Sell)");

        ItemRec.Reset();
        ItemRec.SetRange("No.", ItemVariant."Item No.");
        ItemRec.FindFirst();
        if not ItemRec."Sales Blocked" then begin
            if LIFTItem.Status <> 'A' then
                LIFTItem.Validate(Status, 'A')
        end
        else
            if LIFTItem.Status <> 'I' then
                LIFTItem.Validate(Status, 'I');

        if LIFTItem."Unit Cost" <> ItemRec."Unit Cost" then
            LIFTItem.Validate("Unit Cost", ItemRec."Unit Cost");

        LiftItemLcl.Reset();
        LiftItemLcl.Get(ItemVariant."Item No.", '');
        if LIFTItem."Material Id" <> LiftItemLcl."Material Id" then
            LIFTItem.Validate("Material Id", LiftItemLcl."Material Id");

        LIFTStorageType.Reset();
        LIFTStorageType.SetRange(Name, ItemVariant.Code);
        if LIFTStorageType.FindFirst() then
            if LIFTItem."Storage Type Id" <> LIFTStorageType."Storage Type ID" then
                LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");

        if not LIFTItem."To Be Synchronized" then
            LIFTItem.Validate("To Be Synchronized", true);
    end;

    var
        LIFTItem: Record "ORB LIFT ERP Item";
}
