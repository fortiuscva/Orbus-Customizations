page 52647 "ORB Association API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'associationAPI';
    DelayedInsert = true;
    EntityName = 'associationv2API';
    EntitySetName = 'associationv2API';
    PageType = API;
    SourceTable = "ORBAPP Associations";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
            }
        }
    }
}
