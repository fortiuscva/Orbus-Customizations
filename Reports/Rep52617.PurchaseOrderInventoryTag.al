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
            column(PurchaseOrderNumber; PurchaseOrderNumberVarGbl)
            {
                
            }
            
            trigger OnAfterGetRecord()
            var
            BarcodeSymbology: Enum "Barcode Symbology";
            BarcodeFontProvider: Interface "Barcode Font Provider";
            BarcodeText:Text;
            begin
                clear(BarcodeText);
                clear( EncodedTextVarGbl);
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;
                BarcodeSymbology := Enum::"Barcode Symbology"::"Code39";
               if (ItemNoVarGbl <> '') then begin
                        BarcodeText := ItemNoVarGbl ;
                        BarcodeFontProvider.ValidateInput(BarcodeText ,BarcodeSymbology );
                        EncodedTextVarGbl := BarcodeFontProvider.EncodeFont(BarcodeText, BarcodeSymbology );
                End
            end;
            
            trigger OnPreDataItem()
            var
            NoValidEntryErrorLbl:Label 'Please check your Tag entries';
              begin
                SetRange(Number,1,1);
                iF (WareHouseReceiptNoVarGbl = '') OR (ItemNoVarGbl ='') or (QuantityVarGbl =0 ) then
                 Error(NoValidEntryErrorLbl);
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
                                    If Page.RunModal(Page::"Warehouse Receipts",WareHouseReceiptHeaderRecLcl) = Action::LookupOK then
                                     WareHouseReceiptNoVarGbl := WareHouseReceiptHeaderRecLcl."No.";
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
                                WarehouseReceiptRecLcl.SetRange("No.", WareHouseReceiptNoVarGbl);
                                if Page.RunModal(Page::"Whse. Receipt Lines",WarehouseReceiptRecLcl) = Action::LookupOK then begin
                                    QuantityVarGbl := WarehouseReceiptRecLcl.Quantity;
                                    ItemNoVarGbl := WarehouseReceiptRecLcl."Item No.";
                                    //PurchaseOrderNumberVarGbl := WarehouseReceiptRecLcl."Source No.";
                                end;
                               end;

                               trigger OnValidate()
                                var
                                WarehouseReceiptLineRecLcl : Record "Warehouse Receipt Line";
                                InValidItemErrorLbl : Label 'Check your Item No';
                                begin
                                    WarehouseReceiptLineRecLcl .reset;
                                    WarehouseReceiptLineRecLcl .SetRange("No.",WareHouseReceiptNoVarGbl);
                                    WarehouseReceiptLineRecLcl.SetRange("Item No.",ItemNoVarGbl);
                                    If not WarehouseReceiptLineRecLcl.FindFirst() then begin
                                        QuantityVarGbl := 0;
                                        Error(InValidItemErrorLbl);
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
        begin
                ConfirmOkVarLcl := Confirm('Continue Printing Tag',true);
                if ConfirmOkVarLcl then begin
                 clear(LocalReportReportLcl);
                 LocalReportReportLcl.Run;
                end                
            end;        
    end;
        var
        EncodedTextVarGbl:Text;   
        UserIDVarGbl: Code[100];
        WareHouseReceiptNoVarGbl:Code[20];
        QuantityVarGbl: Decimal;
        ItemNoVarGbl: Code[20];
        PurchaseOrderNumberVarGbl: Code[20];      
        }

    
    
