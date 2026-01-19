page 52606 "ORB Edit Check Ledger Entries"
{
    ApplicationArea = All;
    Caption = 'Edit Check Ledger Entries';
    PageType = List;
    SourceTable = "Check Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ToolTip = 'Specifies the number of the bank account used for the check ledger entry.';
                }
                field("Bank Account Ledger Entry No."; Rec."Bank Account Ledger Entry No.")
                {
                    ToolTip = 'Specifies the entry number of the bank account ledger entry from which the check ledger entry was created.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date of the check ledger entry.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the document type linked to the check ledger entry. For example, Payment.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number on the check ledger entry.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a printing description for the check ledger entry.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the amount on the check ledger entry.';
                }
                field("Check Date"; Rec."Check Date")
                {
                    ToolTip = 'Specifies the check date if a check is printed.';
                }
                field("Check No."; Rec."Check No.")
                {
                    ToolTip = 'Specifies the check number if a check is printed.';
                }
                field("Check Type"; Rec."Check Type")
                {
                    ToolTip = 'Specifies the type check, such as Manual.';
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
                {
                    ToolTip = 'Specifies the code for the payment type to be used for the entry on the journal line.';
                }
                field("Entry Status"; Rec."Entry Status")
                {
                    ToolTip = 'Specifies the printing (and posting) status of the check ledger entry.';
                }
                field("Original Entry Status"; Rec."Original Entry Status")
                {
                    ToolTip = 'Specifies the status of the entry before you changed it.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies whether the entry has been fully applied to.';
                }
                field("Statement Status"; Rec."Statement Status")
                {
                    ToolTip = 'Specifies that the structure of the lines is based on the chart of cost types. You define up to seven cost centers and cost objects that appear as columns in the report.';
                }
                field("Statement No."; Rec."Statement No.")
                {
                    ToolTip = 'Specifies the bank account statement that the check ledger entry has been applied to, if the Statement Status is Bank Account Ledger Applied or Check Ledger Applied.';
                }
                field("Statement Line No."; Rec."Statement Line No.")
                {
                    ToolTip = 'Specifies the statement line that the check ledger entry has been applied to, if the Statement Status is Bank Account Ledger Applied or Check Ledger Applied.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Data Exch. Entry No."; Rec."Data Exch. Entry No.")
                {
                    ToolTip = 'Specifies the value of the Data Exch. Entry No. field.';
                }
                field("Data Exch. Voided Entry No."; Rec."Data Exch. Voided Entry No.")
                {
                    ToolTip = 'Specifies the value of the Data Exch. Voided Entry No. field.';
                }
                field("Positive Pay Exported"; Rec."Positive Pay Exported")
                {
                    ToolTip = 'Specifies the value of the Positive Pay Exported field.';
                }
                field("Print Gen Jnl Line SystemId"; Rec."Print Gen Jnl Line SystemId")
                {
                    ToolTip = 'Specifies the value of the SystemId to Print field.', Comment = '%';
                }

                // field("Record ID to Print"; Rec."Record ID to Print")
                // {
                //     ToolTip = 'Specifies the value of the Record ID to Print field.';
                // }
                field("Trace No."; Rec."Trace No.")
                {
                    ToolTip = 'Specifies the value of the Trace No. field.';
                }
                field("Transmission File Name"; Rec."Transmission File Name")
                {
                    ToolTip = 'Specifies the value of the Transmission File Name field.';
                }
                field("Check No"; Rec."Check No")
                {
                    ToolTip = 'Specifies the value of the Check No field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        PermissionErrorLbl: Label 'You do not have permissions to open this page.';
    begin
        if UserId <> 'BCADMIN' then
            Error(PermissionErrorLbl);
    end;
}
