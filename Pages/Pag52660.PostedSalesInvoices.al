page 52660 "ORB Posted Sales Invoices"
{
    APIVersion = 'v2.0';
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    DelayedInsert = true;
    EntityName = 'postedSalesInvoice';
    EntitySetName = 'postedSalesInvoices';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Sales Invoice Header";
    Extensible = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = false;
                }
                field(magentoOrderNo; Rec."ORB Magento Order #")
                {
                    Caption = 'Magento Order #';
                    Editable = false;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    Editable = false;
                }
                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                    Editable = false;
                }
                field(customerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer Name';
                    Editable = false;
                }
                field(invoiceDate; Rec."Document Date")
                {
                    Caption = 'Invoice Date';
                    Editable = false;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    Editable = false;
                }
                field(totalAmountIncludingTax; AmountIncludingTaxVar)
                {
                    Caption = 'Total Amount Including Tax';
                    Editable = false;
                }
                field(remainingAmount; RemainingAmountVar)
                {
                    Caption = 'Remaining Amount';
                    Editable = false;
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';
                    Editable = false;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    Editable = false;
                }
                part(pdfDocument; "Posted Sales Invoice API PDF")
                {
                    Caption = 'PDF Document';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'pdfPSIDocument';
                    EntitySetName = 'pdfPSIDocument';
                    SubPageLink = "Document Id" = field(SystemId), "Document Type" = const("Sales Invoice");
                }
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
    end;

    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        AmountIncludingTaxVar: Decimal;
        LCYCurrencyCode: Code[10];
        CurrencyCodeTxt: Text;
        RemainingAmountVar: Decimal;


    local procedure SetCalculatedFields()
    begin
        GetAmountIncludingTax();
        GetRemainingAmount();
        CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
    end;

    local procedure GetAmountIncludingTax()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.Reset();
        SalesInvoiceLine.SetRange("Document No.", Rec."No.");
        SalesInvoiceLine.CalcSums("Amount Including VAT");
        AmountIncludingTaxVar := SalesInvoiceLine."Amount Including VAT";
    end;

    local procedure GetRemainingAmount();
    begin
        RemainingAmountVar := Rec.GetRemainingAmount();
    end;
}