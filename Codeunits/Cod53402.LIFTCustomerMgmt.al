codeunit 53402 "ORB LIFT Customer Mgmt"
{
    procedure PropagateOnCustomerInsert(var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        if not Customer.Get(LIFTCustomer."No.") then begin
            Customer.Init();
            Customer.Validate("No.", LIFTCustomer."No.");
            Customer.Insert();
        end;
        UpdateCustomer(LIFTCustomer);
    end;

    procedure PropagateOnCustomerModify(var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        if Customer.Get(LIFTCustomer."No.") then begin
            UpdateCustomer(LIFTCustomer);
        end;
    end;

    procedure UpdateCustomer(var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        ValidateCustomerFields(Customer, LIFTCustomer);
        Customer.Modify();
    end;

    procedure ValidateCustomerFields(var Customer: Record Customer; var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        Customer.Validate(Name, LIFTCustomer.Name);
        Customer.Validate(Address, LIFTCustomer.Address);
        Customer.Validate(City, LIFTCustomer.City);
        Customer.Validate(Contact, LIFTCustomer.Contact);
        Customer.Validate("Phone No.", LIFTCustomer."Phone No.");
        Customer.Validate("Ship-to Code", LIFTCustomer."Ship-to Code");
        Customer.Validate("Credit Limit (LCY)", LIFTCustomer."Credit Limit (LCY)");
        Customer.Validate("Customer Posting Group", LIFTCustomer."Customer Posting Group");
        Customer.Validate("Currency Code", LIFTCustomer."Currency Code");
        Customer.Validate("Customer Price Group", LIFTCustomer."Customer Price Group");
        Customer.Validate("Payment Terms Code", LIFTCustomer."Payment Terms Code");
        Customer.Validate("Salesperson Code", LIFTCustomer."Salesperson Code");
        Customer.Validate("Country/Region Code", LIFTCustomer."Country/Region Code");
        Customer.Validate(Blocked, LIFTCustomer.Blocked);
        Customer.Validate("Payment Method Code", LIFTCustomer."Payment Method Code");
        Customer.Validate("Last Date Modified", LIFTCustomer."Last Date Modified");
        Customer.Validate("Post Code", LIFTCustomer."Post Code");
        Customer.Validate(County, LIFTCustomer.County);
        Customer.Validate("E-Mail", LIFTCustomer."E-Mail");
        Customer.Validate("Tax Liable", LIFTCustomer."Tax Liable");
        Customer.Validate("Currency Id", LIFTCustomer."Currency Id");
        Customer.Validate("Contact ID", LIFTCustomer."Contact ID");
        Customer.Validate(Needs_Approval, LIFTCustomer.Needs_Approval);
        Customer.Validate("ORB Customer Approval Status", LIFTCustomer."ORB Customer Approval Status");
        Customer.Validate("Magento ID", LIFTCustomer."Magento ID");
        Customer.Validate(ORBAPPAssociationsName, LIFTCustomer.ORBAPPAssociationsName);
        Customer.Validate("ORB Regional Sales Executive", LIFTCustomer."ORB Regional Sales Executive");
        Customer.Validate("ORB Customer Support", LIFTCustomer."ORB Customer Support");
        Customer.Validate("ORB Business Development", LIFTCustomer."ORB Business Development");
        Customer.Validate("ORB LIFT Customer", LIFTCustomer."ORB LIFT Customer");
        Customer.Validate("First Invoice Date", LIFTCustomer."First Invoice Date");
        Customer.Validate("Magento Contact No.", LIFTCustomer."Magento Contact No.");
        Customer.Validate("Magento Contact Name", LIFTCustomer."Magento Contact Name");
        Customer.Validate("Magento Contact Email", LIFTCustomer."Magento Contact Email");
        Customer.Validate("Last Invoice Date", LIFTCustomer."Last Invoice Date");
        Customer.Validate("Needs Magento ID", LIFTCustomer."Needs Magento ID");
        Customer.Validate("Last Visit Date", LIFTCustomer."Last Visit Date");
        Customer.Validate(International, LIFTCustomer.International);
        Customer.Validate("Shortcut Dimension 5 Code", LIFTCustomer."Channel Code");
        Customer.Validate("Shortcut Dimension 6 Code", LIFTCustomer."Industry Code");
    end;

    var
        Customer: Record Customer;
}
