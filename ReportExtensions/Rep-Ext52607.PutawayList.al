reportextension 52607 "ORB Put-away List" extends "Put-away List"
{
    RDLCLayout = '.\Reports\Layouts\OrbusWarehousePutAway_Mod.rdl';
    dataset
    {
        add("Warehouse Activity Header")
        {
           column(ORBEndocdePutAwayTagVarGbl; EndocdePutAwayTagVarGbl)
            {
                
            }
         }

        modify("Warehouse Activity Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                EndocdePutAwayTagVarGbl := '';
                EndocdePutAwayTagVarGbl :=GetScannableBarcode("Warehouse Activity Header"."No.");
            end;
        }
      add(WhseActLine)
      {
        column(ORBEncodedItemNoVarGbl; EncodedItemNoVarGbl)
            {

            }
      }
      modify(WhseActLine)
        {
            trigger OnAfterAfterGetRecord()
            begin
                EncodedItemNoVarGbl := '';
                EncodedItemNoVarGbl :=GetScannableBarcode(WhseActLine."Item No.");
            end;
        }

    }
    
    var
        EncodedItemNoVarGbl: Text;        
        EndocdePutAwayTagVarGbl: Text;

    local procedure GetScannableBarcode(Var Code2Convert: Code[20]):Text
    var 
    BarCodeString : Text;
    BarcodeFontProviderInterfaceLcl : Interface "Barcode Font Provider";
    BarCodeSymbologyEnumLcl: Enum "Barcode Symbology";
    BarcodeFontProviderEnumLcl : Enum "Barcode Font Provider";
    EncodedBarStringLcl: Text;
    begin
        clear(EncodedBarStringLcl);
        clear(BarCodeString);
        BarCodeSymbologyEnumLcl := BarCodeSymbologyEnumLcl::Code39;
        BarcodeFontProviderInterfaceLcl:= BarcodeFontProviderEnumLcl::IDAutomation1D;
        BarCodeString := Code2Convert;
        EncodedBarStringLcl := BarcodeFontProviderInterfaceLcl.EncodeFont(BarCodeString,BarCodeSymbologyEnumLcl);
        exit(EncodedBarStringLcl);
    end;
}    



  

