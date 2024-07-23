/// <summary>
/// Report Send Auto Email Confirmation (ID 52609).
/// </summary>
report 52609 "ORB Email Confirmation Layout"
{
    Caption = 'Email Confirmation Layout';
    DefaultLayout = Word;
    WordLayout = 'Reports/Layouts/EmailConfirmation.docx';
    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = filter(1));
            column(number; number)
            {

            }
        }

    }
}
