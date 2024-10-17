page 52634 "ORB Users API"
{
    UsageCategory = Lists;
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'UsersAPI';
    DelayedInsert = true;
    EntityName = 'UsersAPI';
    EntitySetName = 'UsersAPI';
    PageType = API;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = User;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(UserSecurityID; Rec."User Security ID")
                {
                    ToolTip = 'Specifies an ID that uniquely identifies the user. This value is generated automatically and should not be changed.';
                }
                field(UserName; Rec."User Name")
                {
                    ToolTip = 'Specifies the name of the user. If the user must enter credentials when they sign in, this is the name they must enter.';
                }
                field(FullName; Rec."Full Name")
                {
                    ToolTip = 'Specifies the full name of the user.';
                }
                field(ContactEmail; Rec."Contact Email")
                {
                    ToolTip = 'Specifies the user''s email address.';
                }
                field(AuthenticationEmail; Rec."Authentication Email")
                {
                    ToolTip = 'Specifies the Microsoft account that this user uses to sign in to Office 365 or SharePoint Online.';
                }
            }
        }
    }
}
