page 53430 "ORB LIFT Storage Types"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbLIFTStorageTypes';
    DelayedInsert = true;
    EntityName = 'LIFTStorageTypes';
    EntitySetName = 'LIFTStorageTypes';
    PageType = API;
    SourceTable = "ORB LIFT Storage Type";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(storageTypeID; Rec."Storage Type ID")
                {
                    Caption = 'Storage Type ID';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(length; Rec.Length)
                {
                    Caption = 'Length';
                }
                field(width; Rec.Width)
                {
                    Caption = 'Width';
                }
                field(unitOfMeasure; Rec."Unit Of Measure")
                {
                    Caption = 'Unit Of Measure';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}
