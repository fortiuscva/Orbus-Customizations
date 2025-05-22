codeunit 52616 "ORB LIFTtoBC Functions"
{
    procedure IsValidValue(TargetDatatype: enum "ORB LIFT BC Datatypes"; TargetValue: Text): Boolean
    var
        CodeLcl: Code[20];
        TextLcl: Text;
        IntegerLcl: Integer;
        DecimalLcl: Decimal;
        DateLcl: Date;
        BooleanLcl: Boolean;
    begin
        if (TargetValue = '') or (TargetValue = 'null') then
            exit(false);
        case TargetDatatype of
            BCDatatypes::Code:
                exit(Evaluate(CodeLcl, TargetValue));
            BCDatatypes::Text:
                exit(Evaluate(TextLcl, TargetValue));
            BCDatatypes::Integer:
                exit(Evaluate(IntegerLcl, TargetValue));
            BCDatatypes::Decimal:
                exit(Evaluate(DecimalLcl, TargetValue));
            BCDatatypes::Date:
                exit(Evaluate(DateLcl, TargetValue));
            BCDatatypes::Boolean:
                exit(Evaluate(BooleanLcl, TargetValue));
        end;
    end;

    var
        BCDatatypes: enum "ORB LIFT BC Datatypes";
}
