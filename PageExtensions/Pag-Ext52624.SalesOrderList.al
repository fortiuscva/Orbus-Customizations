pageextension 52624 "ORB Sales Order List" extends "Sales Order List"
{
    actions
    {
        addlast("O&rder")
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
