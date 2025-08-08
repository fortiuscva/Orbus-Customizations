query 53401 "ORB LIFT Whse. Trans. By Id"
{
    Caption = 'ORB LIFT Whse. Trans. By Id';
    QueryType = Normal;

    elements
    {
        dataitem(ORBLIFTIntegrationDataLog; "ORB LIFT Integration Data Log")
        {
            DataItemTableFilter = "Source Type" = const(83);
            column(SourceNo; "Source No.")
            {
            }
            column(TransactionID; "Transaction ID")
            {
            }
            column(Source_Line_No_; "Source Line No.")
            {
                Method = sum;
            }
        }
    }

}
