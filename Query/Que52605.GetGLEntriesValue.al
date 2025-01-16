query 52605 "ORB Get G/L Entries Value"
{
    Caption = 'Get G/L Entries Value';
    QueryType = Normal;

    elements
    {
        dataitem(GLEntry; "G/L Entry")
        {
            filter(PostingDate; "Posting Date")
            {

            }
            filter(SourceType; "Source Type")
            {
            }
            filter(SourceNo; "Source No.")
            {
            }
            filter(Document_Type; "Document Type")
            {
            }
            filter(G_L_Account_No_; "G/L Account No.")
            {
            }
            column(Amount; Amount)
            {
                Method = Sum;
            }
        }
    }

}
