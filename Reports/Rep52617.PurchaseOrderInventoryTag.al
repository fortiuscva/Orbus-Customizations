/// <summary>
/// Report Purchase Order ItemList (ID 52617).
/// </summary>
report 52617 "Purchase Order Inventory Tag"
{
    Caption = 'Receiving Tag';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Layouts/ReceivingTag.rdl';
    
    dataset
    {
        dataitem(Noofloops;Integer)
        { 
            DataItemTableView =sorting(Number);
              
            column(BarcodeString; EncodedTextVarGbl)
            {
                
            }
            column(PrintedBy; UserIDVarGbl)
            {
                
            }
            column(Quantity; QuantityVarGbl)
            {
                
                
            }
            column(ItemNo; ItemNoVarGbl)
            {
                
            }
            column(ItemVariant; ItemVariantVarGbl)
            {
                
            }
           
            column(PurchaseOrderNumber; PurchaseOrderNumberVarGbl)
            {
                
            }
            
            trigger OnAfterGetRecord()
            var
            BarcodeSymbology: Enum "Barcode Symbology";
            BarcodeFontProvider: Interface "Barcode Font Provider";
            BarcodeText:Text;
            ItemReferenceRecLcl : Record "Item Reference";
            CrossRefMissingErrorLbl : Label 'Item CrossReference not setup for Item: %1 and Variant: %2, Call Purchasing';
            begin
                clear(BarcodeText);
                clear( EncodedTextVarGbl);
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::"Code39";
               if (ItemNoVarGbl <> '') and (ItemVariantVarGbl = '') then begin
                        BarcodeText := ItemNoVarGbl ;
                        BarcodeFontProvider.ValidateInput(BarcodeText ,BarcodeSymbology );
                        EncodedTextVarGbl := BarcodeFontProvider.EncodeFont(BarcodeText, BarcodeSymbology );
               end else if (ItemNoVarGbl <> '') and (ItemVariantVarGbl <> '')  then begin
                        ItemReferenceRecLcl.Setrange("Item No.", ItemNoVarGbl);
                        ItemReferenceRecLcl.Setrange("Variant Code",ItemVariantVarGbl);
                        ItemReferenceRecLcl.SetRange("Reference Type",ItemReferenceRecLcl."Reference Type"::"Bar Code");
                        If  ItemReferenceRecLcl.findfirst then begin
                            BarcodeText := ItemReferenceRecLcl."Reference No.";
                            BarcodeFontProvider.ValidateInput(BarcodeText ,BarcodeSymbology );
                            EncodedTextVarGbl := BarcodeFontProvider.EncodeFont(BarcodeText, BarcodeSymbology );
                        end else
                            Error(CrossRefMissingErrorLbl,ItemNoVarGbl,ItemVariantVarGbl);
               end;
            end;
            trigger OnPreDataItem()
            var
            NoValidEntryErrorLbl:Label 'Please check your Tag entries';
              begin
                SetRange(Number,1,1);
                if not NotonDocumentVarGbl then begin
                    if (WareHouseReceiptNoVarGbl = '') OR (ItemNoVarGbl ='') or (QuantityVarGbl =0 ) then
                        Error(NoValidEntryErrorLbl);
                end else begin
                    if  (ItemNoVarGbl ='') or (QuantityVarGbl =0 ) then
                        Error(NoValidEntryErrorLbl);
                end;
            end;           
    } 
    }       
   requestpage
    {
            layout{
            area(Content)
                {
                        group(Options)
                        {
                            Caption = 'Create Receiving Tag';
                            field(WareHouseReceiptNoVarGbl;WareHouseReceiptNoVarGbl)
                            {
                                Caption = 'WareHouse Receipt No';
                                ApplicationArea = All;
                                trigger OnLookup(var Text:Text) myBoolean: Boolean;
                                var
                                    WareHouseReceiptHeaderRecLcl: Record "Warehouse Receipt Header";
                                begin
                                    clear(WarehouseReceiptLineNoVarGbl);
                                    if not NotonDocumentVarGbl then begin
                                        If Page.RunModal(Page::"Warehouse Receipts",WareHouseReceiptHeaderRecLcl) = Action::LookupOK then
                                        WareHouseReceiptNoVarGbl := WareHouseReceiptHeaderRecLcl."No.";
                                     end;
                                end;
                            }
                            field(ItemNoVarGbl;ItemNoVarGbl)
                            {
                               Caption = 'Item No';
                               ApplicationArea = All;
                               trigger OnLookup(var Text: Text): Boolean
                               var
                                WarehouseReceiptRecLcl : Record "Warehouse Receipt Line";
                               begin
                                    if not NotonDocumentVarGbl then begin
                                        WarehouseReceiptRecLcl.SetRange("No.", WareHouseReceiptNoVarGbl);
                                        if Page.RunModal(Page::"Whse. Receipt Lines",WarehouseReceiptRecLcl) = Action::LookupOK then begin
                                            QuantityVarGbl := WarehouseReceiptRecLcl.Quantity;
                                            ItemNoVarGbl := WarehouseReceiptRecLcl."Item No.";
                                            WarehouseReceiptLineNoVarGbl := WarehouseReceiptRecLcl."Line No.";
                                            If WarehouseReceiptRecLcl."Variant Code" <>'' then
                                                ItemVariantVarGbl := WarehouseReceiptRecLcl."Variant Code";
                                        end else begin
                                            if  NotonDocumentVarGbl then begin
                                                if Page.RunModal(Page::"Item List",ItemRecGbl) = Action::LookupOK then
                                                  ItemNoVarGbl :=  ItemRecGbl."No.";
                                            end;
                                        end;
                                    end; 
                               end;
                               trigger OnValidate()
                                var
                                    InValidItemErrorLbl : Label 'Check your Item No';
                                    ItemRecLcl : Record Item;
                                    ErrorInvalidItemLbl: Label 'Item %1 does not exist in BC';
                                begin
                                    if not NotonDocumentVarGbl then begin
                                        WarehouseReceiptLineRecGbl .reset;
                                        WarehouseReceiptLineRecGbl .SetRange("No.",WareHouseReceiptNoVarGbl);
                                        WarehouseReceiptLineRecGbl.SetRange("Item No.",ItemNoVarGbl);
                                        If not WarehouseReceiptLineRecGbl.FindFirst() then begin
                                            QuantityVarGbl := 0;
                                            Error(InValidItemErrorLbl);
                                        end;
                                    end else begin
                                        ItemRecLcl.Reset();
                                        ItemRecLcl.SetRange("No.",ItemNoVarGbl);
                                        IF not ItemRecLcl.FindFirst() then
                                            Error(ErrorInvalidItemLbl,ItemNoVarGbl);
                                    end;
                                end;
                         }
                         field(ItemVariantVarGbl;ItemVariantVarGbl)
                         {
                            Caption = 'Item Variant';
                            ApplicationArea = All;
                            ToolTip = 'Item Variant';
                            
                            trigger OnLookup(var Text: Text): Boolean
                            begin
                                if NotonDocumentVarGbl then begin
                                    ItemVariantRecGbl.reset;
                                    ItemVariantRecGbl.SetRange("Item No.",ItemVariantVarGbl);
                                    if Page.RunModal(Page::"Item Variants",ItemVariantRecGbl) = Action::LookupOK then
                                        ItemVariantVarGbl := ItemVariantRecGbl.Code
                                end;
                            end;
                            trigger OnValidate()
                            begin
                                if NotonDocumentVarGbl then begin
                                    ItemVariantRecGbl.reset;
                                    ItemVariantRecGbl.SetRange("Item No.",ItemNoVarGbl);
                                    if not ItemVariantRecGbl.FindFirst() then 
                                        Error(ErrorInvalidItemLbl,ItemVariantVarGbl);
                                end else begin
                                        WarehouseReceiptLineRecGbl .reset;
                                        WarehouseReceiptLineRecGbl .SetRange("No.",WareHouseReceiptNoVarGbl);
                                        WarehouseReceiptLineRecGbl.SetRange("Item No.",ItemNoVarGbl);
                                        WarehouseReceiptLineRecGbl.SetRange("Line No.",WarehouseReceiptLineNoVarGbl);
                                        WarehouseReceiptLineRecGbl.SetRange("Variant Code",ItemVariantVarGbl);
                                        if  not WarehouseReceiptLineRecGbl.FindFirst() then
                                            Error(ErrorInvalidItemLbl,ItemVariantVarGbl);
                                end;
                            end;
                         }
                        field(QuantityVarGbl;QuantityVarGbl)
                        {
                                Caption = 'Quantity';
                                ApplicationArea = All;
                        }
                        field(PurchaseOrderNumberVarGbl;PurchaseOrderNumberVarGbl)
                            {
                                Caption = 'PO No';
                                ApplicationArea = All;
                            }
                        field(NotonDocumentVarGbl;NotonDocumentVarGbl)
                            {
                                Caption = 'Not on Document';
                                ApplicationArea = All;
                            }
                        }
                  
                }
            }
    }
    trigger OnInitReport()
        begin
            UserIDVarGbl := Database.UserId;
        end;

    trigger OnPostReport()
    var
        ConfirmOkVarLcl : Boolean;
        LocalReportReportLcl : Report "Purchase Order Inventory Tag";
     begin
       // ConfirmOkVarLcl := Confirm('Continue Printing Tag',true);
       // if ConfirmOkVarLcl then begin
            clear(LocalReportReportLcl);
            LocalReportReportLcl.Run;
           // end                
       end;        
    var
        EncodedTextVarGbl:Text;   
        UserIDVarGbl: Code[100];
        WareHouseReceiptNoVarGbl:Code[20];
        QuantityVarGbl: Decimal;
        ItemNoVarGbl: Code[20];
        ItemVariantVarGbl: Code[10];
        PurchaseOrderNumberVarGbl: Code[200];
        NotonDocumentVarGbl:Boolean; 
        ItemRecGbl : Record Item;
        ItemVariantRecGbl : Record "Item Variant";
        ErrorInvalidItemLbl: Label 'Item Variant %1 is invalid';   
        WarehouseReceiptLineNoVarGbl: Integer; 
        WarehouseReceiptLineRecGbl : Record "Warehouse Receipt Line";
    }

    
    
