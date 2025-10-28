codeunit 53402 "ORB LIFT Customer Mgmt"
{
    procedure PropagateOnCustomerInsert(var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        if not Customer.Get(LIFTCustomer."No.") then begin
            Customer.Init();
            Customer."No." := LIFTCustomer."No.";
            Customer.Insert(true);
        end;
        UpdateCustomer(LIFTCustomer, true);
    end;

    procedure PropagateOnCustomerModify(var LIFTCustomer: Record "ORB LIFT Customer Buffer")
    begin
        if Customer.Get(LIFTCustomer."No.") then
            UpdateCustomer(LIFTCustomer, false);
    end;

    procedure UpdateCustomer(var LIFTCustomer: Record "ORB LIFT Customer Buffer"; CreateCustomer: Boolean)
    begin
        ValidateCustomerFields(Customer, LIFTCustomer, CreateCustomer);
        Customer.Modify(true);
    end;

    procedure ValidateCustomerFields(var Customer: Record Customer; var LIFTCustomer: Record "ORB LIFT Customer Buffer"; CreateCustomer: Boolean)
    begin
        Customer.Validate(Name, LIFTCustomer.Name);
        Customer.Validate(Address, LIFTCustomer.Address);
        Customer.Validate(City, LIFTCustomer.City);
        Customer.Validate(Contact, LIFTCustomer.Contact);
        Customer.Validate("Phone No.", LIFTCustomer."Phone No.");
        Customer.Validate("Ship-to Code", LIFTCustomer."Ship-to Code");
        Customer.Validate("Credit Limit (LCY)", LIFTCustomer."Credit Limit (LCY)");
        if CreateCustomer then
            Customer.Validate("Customer Posting Group", LIFTCustomer."Customer Posting Group");
        Customer.Validate("Currency Code", LIFTCustomer."Currency Code");
        Customer.Validate("Customer Price Group", LIFTCustomer."Customer Price Group");
        Customer.Validate("Customer Disc. Group", LIFTCustomer."Customer Disc. Group");
        // Customer.Validate("Payment Terms Id", LIFTCustomer."Payment Terms Id");
        Customer.Validate("Payment Terms Code", LIFTCustomer."Payment Terms Code");
        if (LIFTCustomer."Salesperson Code" <> '') then
            Customer.Validate("Salesperson Code", LIFTCustomer."Salesperson Code");
        Customer.Validate("Country/Region Code", LIFTCustomer."Country/Region Code");
        Customer.Validate(Blocked, LIFTCustomer.Blocked);
        Customer.Validate("Payment Method Code", LIFTCustomer."Payment Method Code");
        Customer.Validate("Last Date Modified", LIFTCustomer."Last Date Modified");
        if CreateCustomer then
            Customer.Validate("Gen. Bus. Posting Group", LIFTCustomer."Gen. Bus. Posting Group");
        Customer.Validate("Post Code", LIFTCustomer."Post Code");
        Customer.Validate(County, LIFTCustomer.County);
        Customer.Validate("E-Mail", LIFTCustomer."E-Mail");
        if LIFTCustomer."ORB LIFT TaxExempt" = 'Y' then
            Customer.Validate("Tax Liable", false)
        else
            Customer.Validate("Tax Liable", true);
        Customer.Validate("Currency Id", LIFTCustomer."Currency Id");
        Customer.Validate("Contact ID", LIFTCustomer."Contact ID");
        if LIFTCustomer."ORB LIFT TermsStatus" = 'PENDING' then
            Customer.Validate(Needs_Approval, Customer.Needs_Approval::noNeedsApproval)
        else
            Customer.Validate(Needs_Approval, Customer.Needs_Approval::yesNeedsApproval);
        Customer.Validate("UPS Account Number", LIFTCustomer."UPS Account Number");
        Customer.Validate("FedEx Account Number", LIFTCustomer."FedEx Account Number");
        Customer.Validate("Magento ID", LIFTCustomer."Magento ID");
        // Customer.Validate(ORBAPPAssociationsName, LIFTCustomer.ORBAPPAssociationsName);
        // Customer.Validate("ORB Regional Sales Executive", LIFTCustomer."ORB Regional Sales Executive");
        if (LIFTCustomer."ORB Customer Support" <> '') then
            Customer.Validate("ORB Customer Support", LIFTCustomer."ORB Customer Support");
        Customer.Validate("ORB Business Development", LIFTCustomer."ORB Business Development");
        // Customer.Validate("ORB LIFT Customer", LIFTCustomer."ORB LIFT Customer");
        // Customer.Validate("First Invoice Date", LIFTCustomer."First Invoice Date");
        Customer.Validate("Magento Contact No.", LIFTCustomer."Magento Contact No.");
        Customer.Validate("Magento Contact Name", LIFTCustomer."Magento Contact Name");
        Customer.Validate("Magento Contact Email", LIFTCustomer."Magento Contact Email");
        // Customer.Validate("Last Invoice Date", LIFTCustomer."Last Invoice Date");
        Customer.Validate("Needs Magento ID", LIFTCustomer."Needs Magento ID");
        // Customer.Validate("Last Visit Date", LIFTCustomer."Last Visit Date");
        // Customer.Validate(International, LIFTCustomer.International);
        if CreateCustomer then
            Customer.Validate("Shortcut Dimension 5 Code", LIFTCustomer.Channel);
        Customer.Validate("Shortcut Dimension 6 Code", LIFTCustomer.Industry);
        if CreateCustomer then
            Customer.Validate("Tax Area Code", 'AVATAX');
    end;

    var
        Customer: Record Customer;
}
