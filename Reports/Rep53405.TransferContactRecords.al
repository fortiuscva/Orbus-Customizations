report 53405 "ORB Transfer Contact Records"
{
    ApplicationArea = All;
    Caption = 'ORB Transfer Contact Records';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(LIFTContact; "LIFT Contact")
        {
            DataItemTableView = sorting("No.");
            trigger OnAfterGetRecord()
            var
                ORBLIFTContact: Record "ORB LIFT Contact";
            begin
                ORBLIFTContact.Init();
                ORBLIFTContact."No." := "No.";
                ORBLIFTContact.Insert();
                ORBLIFTContact.Name := Name;
                ORBLIFTContact."Customer No." := "Customer No.";
                ORBLIFTContact."Customer Name" := "Customer Name";
                ORBLIFTContact."E-Mail" := "E-Mail";
                ORBLIFTContact."Phone No." := "Phone No.";
                ORBLIFTContact."First Name" := "First Name";
                ORBLIFTContact."Last Name" := "Last Name";
                ORBLIFTContact.Modify();
            end;
        }
    }
}
