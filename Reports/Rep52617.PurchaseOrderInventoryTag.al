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
        dataitem(WarehouseReceiptLine; "Warehouse Receipt Line")
        {
            DataItemTableView = sorting("No.", "Line No.");
            column(ItemNo;"Item No.")
            {
                
            }
            column(Description; Description)
            {
                
            }
            column(Quantity; Quantity)
            {
                
            }
            column(SourceNo;"Source No.")
            {
                
            }
            column(BarcodeString; EncodedTextVarGbl)
            {
                
            }
            column(PrintedBy;UserIDVarGbl)
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
                if ("Item No." <> '') then begin
                        BarcodeText := "Item No." ;
                        BarcodeFontProvider.ValidateInput(BarcodeText ,BarcodeSymbology );
                        EncodedTextVarGbl := BarcodeFontProvider.EncodeFont(BarcodeText, BarcodeSymbology );
                End
            end;

            trigger OnPreDataItem()
            begin
                WarehouseReceiptLine.SetRange("No.",WareHouseReceiptNoVarGbl);
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
                                    WareHouseReceiptHeaderRecordVar: Record "Warehouse Receipt Header";
                                  
                                begin
                                    If Page.RunModal(Page::"Warehouse Receipts",WareHouseReceiptHeaderRecordVar) = Action::LookupOK then
                                     WareHouseReceiptNoVarGbl := WareHouseReceiptHeaderRecordVar."No.";
                                      
                                end;

                            }

                        }
                }
            
            }

    }

      trigger OnInitReport()
        begin
            UserIDVarGbl := Database.UserId;
        end;
        var
        EncodedTextVarGbl:Text;   
        UserIDVarGbl: Code[100];
        WareHouseReceiptNoVarGbl:Code[20];
        }

    
    
