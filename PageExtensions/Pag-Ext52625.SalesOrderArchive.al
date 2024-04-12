pageextension 52625 "ORB Sales Order Archive" extends "Sales Order Archive"
{
    actions
    {
        addlast("Ver&sion")
        {
            action("ORB Sales Header Additional Fields")
            {
                Image = Navigate;
                ApplicationArea = all;
                RunObject = page "Sales Header Additional Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }
        }
    }
}
