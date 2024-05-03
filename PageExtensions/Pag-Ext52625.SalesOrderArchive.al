pageextension 52625 "ORB Sales Order Archive" extends "Sales Order Archive"
{
    actions
    {
        addlast("Ver&sion")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Hdr Arch. Add. Flds";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No."), "Version No." = field("Version No."), "Doc. No. Occurrence" = field("Doc. No. Occurrence");
            }
        }
    }
}
