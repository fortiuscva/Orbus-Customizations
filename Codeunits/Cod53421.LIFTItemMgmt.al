codeunit 53421 "ORB LIFT Item Mgmt."
{
    procedure InsertLiftERPMaterialProduct(Item: Record Item)
    begin
        LIFTItem.Init();
        LIFTItem."Item No." := Item."No.";
        LIFTItem.Insert(true);
        ModifyLiftERPMaterialProduct(Item, LIFTItem);
    end;

    procedure ModifyLiftERPMaterialProduct(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
    begin
        ValidateLiftERPMaterialProductFields(Item, LIFTItem);
        LIFTItem.Modify(true);
    end;

    procedure ValidateLIFTERPMaterialProductFields(Item: Record Item; var LIFTItem: Record "ORB LIFT ERP Item")
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
            end else begin
                if Item."ORB Material Id" <> 0 then
                    LIFTItem.Validate("Product Material Id", Item."ORB Material Id")
                else begin
                    LIFTMaterial.Reset();
                    LIFTMaterial.SetRange("Material Name", Item."No.");
                    if LIFTMaterial.FindFirst() then
                        LIFTItem.Validate("Product Material Id", LIFTMaterial."Material Id");
                end;
            end;

            LIFTStorageType.Reset();
            LIFTStorageType.SetRange(Name, 'Hardware-FG');
            if LIFTStorageType.FindFirst() then
                LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");

            LIFTItem.Validate("Print Format", 5941450);
        end;



        if Item."ORB Material Id" <> 0 then begin
            LIFTItem.Validate("Material Id", Item."ORB Material Id");
            LIFTMaterial.Reset();
            LIFTMaterial.SetRange("Material Id", Item."ORB Material Id");
            if LIFTMaterial.FindFirst() then begin
                LIFTItem.Validate("Material Type Id", LIFTMaterial."Material Type Id");
                LIFTItem.Validate("Primary Vendor Id", LIFTMaterial."Primary Vendor Id");
                LIFTItem.Validate("Material Category Id", LIFTMaterial.Category);
                LIFTItem.Validate("Material Subcategory Id", LIFTMaterial."Sub Category");
            end;
        end
        else begin
            LIFTMaterial.Reset();
            LIFTMaterial.SetRange("Material Name", Item."No.");
            if LIFTMaterial.FindFirst() then begin
                LIFTItem.Validate("Material Id", LIFTMaterial."Material Id");
                LIFTItem.Validate("Material Type Id", LIFTMaterial."Material Type Id");
                LIFTItem.Validate("Primary Vendor Id", LIFTMaterial."Primary Vendor Id");
                LIFTItem.Validate("Material Category Id", LIFTMaterial.Category);
                LIFTItem.Validate("Material Subcategory Id", LIFTMaterial."Sub Category");
            end
            else begin
                LIFTItem.Validate("Material Type Id", 121821);
                LIFTItem.Validate("Primary Vendor Id", 57643);
            end;
        end;

        LIFTItem.Validate("Unit Cost", Item."Unit Cost");
        LIFTItem.Validate("Do Not Integrate", Item."ORB Do Not Integrate");
        LIFTItem.Validate("Do Not Integrate (Sellable)", Item."ORB Do Not Integrate (Sell)");
        LIFTItem.Validate("To Be Synchronized", true);
    end;

    procedure InsertLIFTERPVendorMaterial(ItemVariant: Record "Item Variant")
    begin
        LIFTItem.Init();
        LIFTItem."Item No." := ItemVariant."Item No.";
        LIFTItem."Variant Code" := ItemVariant.Code;
        LIFTItem.Insert(true);
        ModifyLIFTERPVendorMaterial(ItemVariant, LIFTItem);
    end;

    procedure ModifyLIFTERPVendorMaterial(ItemVariant: Record "Item Variant"; var LIFTItem: Record "ORB LIFT ERP Item")
    begin
        ValidateLIFTERPVendorMaterialFields(ItemVariant, LIFTItem);
        LIFTItem.Modify(true);
    end;

    procedure ValidateLIFTERPVendorMaterialFields(ItemVariant: Record "Item Variant"; var LIFTItem: Record "ORB LIFT ERP Item")
    var
        ProdLineValue: Record "ORB LIFT Product Line Values";
        LIFTMaterial: Record "ORB LIFT Material";
        LIFTStorageType: Record "ORB LIFT Storage Type";
        ItemRec: Record Item;
    begin
        LIFTItem.Validate(Description, ItemVariant.Description);
        ItemRec.Reset();
        ItemRec.Get(ItemVariant."Item No.");
        if ItemRec."ORB Material Id" <> 0 then begin
            LIFTItem.Validate("Material Id", LIFTMaterial."Material Id");
            LIFTMaterial.Reset();
            LIFTMaterial.SetRange("Material Id", ItemRec."ORB Material Id");
            if LIFTMaterial.FindFirst() then begin
                LIFTItem.Validate("Material Type Id", LIFTMaterial."Material Type Id");
                LIFTItem.Validate("Primary Vendor Id", LIFTMaterial."Primary Vendor Id");
                LIFTItem.Validate("Material Category Id", LIFTMaterial.Category);
                LIFTItem.Validate("Material Subcategory Id", LIFTMaterial."Sub Category");
            end;
        end
        else begin
            LIFTMaterial.Reset();
            LIFTMaterial.SetRange("Material Name", ItemVariant."Item No.");
            if LIFTMaterial.FindFirst() then begin
                LIFTItem.Validate("Material Id", LIFTMaterial."Material Id");
                LIFTItem.Validate("Material Type Id", LIFTMaterial."Material Type Id");
                LIFTItem.Validate("Primary Vendor Id", LIFTMaterial."Primary Vendor Id");
                LIFTItem.Validate("Material Category Id", LIFTMaterial.Category);
                LIFTItem.Validate("Material Subcategory Id", LIFTMaterial."Sub Category");
            end
            else begin
                LIFTItem.Validate("Material Type Id", 121821);
                LIFTItem.Validate("Primary Vendor Id", 57643);
            end;
        end;
        if not ItemRec."Sales Blocked" then
            LIFTItem.Validate(Status, 'A')
        else
            LIFTItem.Validate(Status, 'I');

        LIFTItem.Validate("Unit Cost", ItemRec."Unit Cost");

        LIFTStorageType.Reset();
        LIFTStorageType.SetRange(Name, ItemVariant.Code);
        if LIFTStorageType.FindFirst() then
            LIFTItem.Validate("Storage Type Id", LIFTStorageType."Storage Type ID");
    end;

    var
        LIFTItem: Record "ORB LIFT ERP Item";
}
