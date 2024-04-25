codeunit 52607 "ORB Web Service"
{
    trigger OnRun()

    begin
        SalesHeader.init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := 'test1212';
        SalesHeader.insert();
        SalesHeader.Validate("Sell-to Customer No.", 'ORB00001');
        SalesHeader.Modify();
        SalesLine.Init();
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine.Type := salesline.Type::Item;
        SalesLine."Line No." := 10000;
        SalesLine.Insert(true);
        SalesLine.Validate("No.", 'XCLM-2X2-K1-G');
        SalesLine.Validate(Quantity, 1);
        SalesLine.Modify();
    end;

    procedure SendSalesHeader(SalesOrderString: text): Text
    begin
        SalesOrderString := '{  "OrderNo":"TEST132",  "CustomerNo":"10014",    "LineNo":"10000",    "ItemNo":"XCLM-2X2-K1-G","Quantity" : "10"  }';
        if CreateSalesOrder(SalesOrderString) then
            exit(StrSubstNo('Order %1 has been created successfully', SalesHeader."No."))
        else
            exit(GetLastErrorText());
    end;

    [TryFunction]
    local procedure CreateSalesOrder(ReponseString: Text)
    var
        ResponseObject: JsonObject;
        JsonHeaderToken: JsonToken;
        JsonHeadeObject: JsonObject;
    begin
        ResponseObject := ReadJson(ReponseString);
        ResponseObject.Get('data', JsonHeaderToken);
        JsonHeadeObject := JsonHeaderToken.AsObject();
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := GetTokenAsText(JsonHeadeObject, 'OrderNo');
        SalesHeader.Validate("Sell-to Customer No.", GetTokenAsText(JsonHeadeObject, 'CustmerNo'));
        SalesHeader.Validate("Order Date", GetTokenAsDate(JsonHeadeObject, 'OrderDate'));
        SalesHeader.Validate("External Document No.", GetTokenAsText(JsonHeadeObject, 'ReferenceNo'));
        SalesHeader.Insert(true);
        InsertSalesLines(SalesHeader, ReponseString);
    end;

    local procedure InsertSalesLines(var SalesHeader: Record "Sales Header"; ResponseString: Text)
    var
        ResponseObject: JsonObject;
        SalesLine: Record "Sales Line";
        JsonLineToken: JsonToken;
        JsonLineObject: JsonObject;
        JsonArrayLine: JsonArray;
    begin
        ResponseObject := ReadJson(ResponseString);
        ResponseObject.Get('Lines', JsonLineToken);
        JsonArrayLine := JsonLineToken.AsArray();
        foreach JsonLineToken in JsonArrayLine do begin
            JsonLineObject := JsonLineToken.AsObject();
            SalesLine.Init();
            SalesLine."Document No." := SalesHeader."No.";
            SalesLine."Document Type" := SalesHeader."Document Type";
            SalesLine."Line No." := GetTokenAsInt(JsonLineObject, 'LineNo');
            SalesLine.Insert(true);
        end;
    end;

    local procedure GetTokenAsText(jObjectPar: JsonObject; pathPar: Text): Text
    var
        jTokenLoc: JsonToken;
    begin
        if GetToken(jObjectPar, pathPar, jTokenLoc) then
            exit(jTokenLoc.AsValue().AsText())
        else
            exit('');
    end;

    procedure GetTokenAsInt(jObjectPar: JsonObject; pathPar: Text): Integer
    var
        jTokenLoc: JsonToken;
    begin
        if GetToken(jObjectPar, pathPar, jTokenLoc) then
            exit(jTokenLoc.AsValue().AsInteger())
        else
            exit(0);
    end;


    procedure GetTokenAsDate(jObjectPar: JsonObject; pathPar: Text): Date
    var
        jTokenLoc: JsonToken;
    begin
        if GetToken(jObjectPar, pathPar, jTokenLoc) then
            exit(jTokenLoc.AsValue().AsDate())
        else
            exit(0D);
    end;

    local procedure ReadJson(data: Text) result: JsonObject;
    var
        jsonArray2: JsonArray;
        jsontoken: JsonToken;
    begin
        jsonArray2.ReadFrom(data);
        foreach jsontoken in jsonArray2 do
            result := jsontoken.AsObject();
    end;

    local procedure GetToken(jObjectPar: JsonObject; pathPar: Text; var jTokenVar: JsonToken): Boolean
    begin
        if jObjectPar.SelectToken(pathPar, jTokenVar) then
            exit(not jTokenVar.AsValue().IsNull())
        else
            exit(false);
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
}
