page 52662 "ORB Warehouse Activity Lines"
{
    ApplicationArea = All;
    Caption = 'Warehouse Activity Lines';
    PageType = List;
    SourceTable = "Warehouse Activity Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("ATO Component"; Rec."ATO Component")
                {
                    ToolTip = 'Specifies the value of the ATO Component field.', Comment = '%';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ToolTip = 'Specifies the value of the Action Type field.', Comment = '%';
                }
                field("Activity Type"; Rec."Activity Type")
                {
                    ToolTip = 'Specifies the value of the Activity Type field.', Comment = '%';
                }
                field("Assemble to Order"; Rec."Assemble to Order")
                {
                    ToolTip = 'Specifies the value of the Assemble to Order field.', Comment = '%';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the bin where the items are picked or put away.';
                }
                field("Bin Ranking"; Rec."Bin Ranking")
                {
                    ToolTip = 'Specifies the value of the Bin Ranking field.', Comment = '%';
                }
                field("Bin Type Code"; Rec."Bin Type Code")
                {
                    ToolTip = 'Specifies the value of the Bin Type Code field.', Comment = '%';
                }
                field(Breakbulk; Rec.Breakbulk)
                {
                    ToolTip = 'Specifies the value of the Breakbulk field.', Comment = '%';
                }
                field("Breakbulk No."; Rec."Breakbulk No.")
                {
                    ToolTip = 'Specifies the value of the Breakbulk No. field.', Comment = '%';
                }
                field("Cross-Dock Information"; Rec."Cross-Dock Information")
                {
                    ToolTip = 'Specifies the value of the Cross-Dock Information field.', Comment = '%';
                }
                field(Cubage; Rec.Cubage)
                {
                    ToolTip = 'Specifies the value of the Cubage field.', Comment = '%';
                }
                field(Dedicated; Rec.Dedicated)
                {
                    ToolTip = 'Specifies the value of the Dedicated field.', Comment = '%';
                }
                field(Descriptfion; Rec.Description)
                {
                    ToolTip = 'Specifies an extended description of the item on the line.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies a description of the item on the line.';
                }
                field("Destination No."; Rec."Destination No.")
                {
                    ToolTip = 'Specifies the value of the Destination No. field.', Comment = '%';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ToolTip = 'Specifies the value of the Destination Type field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the value of the Expiration Date field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the lot number to handle in the document.';
                }
                field("Lot No. Blocked"; Rec."Lot No. Blocked")
                {
                    ToolTip = 'Specifies the value of the Lot No. Blocked field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Original Breakbulk"; Rec."Original Breakbulk")
                {
                    ToolTip = 'Specifies the value of the Original Breakbulk field.', Comment = '%';
                }
                field("Over-Receipt Code"; Rec."Over-Receipt Code")
                {
                    ToolTip = 'Specifies the value of the Over-Receipt Code field.', Comment = '%';
                }
                field("Over-Receipt Quantity"; Rec."Over-Receipt Quantity")
                {
                    ToolTip = 'Specifies the value of the Over-Receipt Quantity field.', Comment = '%';
                }
                field("Package No."; Rec."Package No.")
                {
                    ToolTip = 'Specifies the package number to handle in the document.';
                }
                field("Qty. (Base)"; Rec."Qty. (Base)")
                {
                    ToolTip = 'Specifies the quantity of the item to be handled, in the base unit of measure.';
                }
                field("Qty. Handled"; Rec."Qty. Handled")
                {
                    ToolTip = 'Specifies the value of the Qty. Handled field.', Comment = '%';
                }
                field("Qty. Handled (Base)"; Rec."Qty. Handled (Base)")
                {
                    ToolTip = 'Specifies the number of items on the line that have been handled in this warehouse activity.';
                }
                field("Qty. Outstanding"; Rec."Qty. Outstanding")
                {
                    ToolTip = 'Specifies the value of the Qty. Outstanding field.', Comment = '%';
                }
                field("Qty. Outstanding (Base)"; Rec."Qty. Outstanding (Base)")
                {
                    ToolTip = 'Specifies the number of items, expressed in the base unit of measure, that have not yet been handled for this warehouse activity line.';
                }
                field("Qty. Rounding Precision"; Rec."Qty. Rounding Precision")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision field.', Comment = '%';
                }
                field("Qty. Rounding Precision (Base)"; Rec."Qty. Rounding Precision (Base)")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision (Base) field.', Comment = '%';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Qty. per Unit of Measure field.', Comment = '%';
                }
                field("Qty. to Handle"; Rec."Qty. to Handle")
                {
                    ToolTip = 'Specifies the value of the Qty. to Handle field.', Comment = '%';
                }
                field("Qty. to Handle (Base)"; Rec."Qty. to Handle (Base)")
                {
                    ToolTip = 'Specifies the quantity of items to be handled in this warehouse activity.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number to handle in the document.';
                }
                field("Serial No. Blocked"; Rec."Serial No. Blocked")
                {
                    ToolTip = 'Specifies the value of the Serial No. Blocked field.', Comment = '%';
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ToolTip = 'Specifies the shelf number of the item for informational use.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ToolTip = 'Specifies the delivery conditions of the related shipment.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ToolTip = 'Specifies the shipping advice, informing whether partial deliveries are acceptable, copied from the source document header.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies which shipping agent is used to transport the products.';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the code that represents the default shipping agent service.';
                }
                field("Sorting Sequence No."; Rec."Sorting Sequence No.")
                {
                    ToolTip = 'Specifies the value of the Sorting Sequence No. field.', Comment = '%';
                }
                field("Source Document"; Rec."Source Document")
                {
                    ToolTip = 'Specifies the value of the Source Document field.', Comment = '%';
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ToolTip = 'Specifies the value of the Source Line No. field.', Comment = '%';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies the value of the Source No. field.', Comment = '%';
                }
                field("Source Subline No."; Rec."Source Subline No.")
                {
                    ToolTip = 'Specifies the value of the Source Subline No. field.', Comment = '%';
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ToolTip = 'Specifies the value of the Source Subtype field.', Comment = '%';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Source Type field.', Comment = '%';
                }
                field("Special Equipment Code"; Rec."Special Equipment Code")
                {
                    ToolTip = 'Specifies the value of the Special Equipment Code field.', Comment = '%';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.', Comment = '%';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the value of the Variant Code field.', Comment = '%';
                }
                field("Warehouse Reason Code"; Rec."Warehouse Reason Code")
                {
                    ToolTip = 'Specifies the value of the Warehouse Reason Code field.', Comment = '%';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the value of the Warranty Date field.', Comment = '%';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the value of the Weight field.', Comment = '%';
                }
                field("Whse. Document Line No."; Rec."Whse. Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Whse. Document Line No. field.', Comment = '%';
                }
                field("Whse. Document No."; Rec."Whse. Document No.")
                {
                    ToolTip = 'Specifies the value of the Whse. Document No. field.', Comment = '%';
                }
                field("Whse. Document Type"; Rec."Whse. Document Type")
                {
                    ToolTip = 'Specifies the value of the Whse. Document Type field.', Comment = '%';
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ToolTip = 'Specifies the zone code where the bin on this line is located.';
                }
            }
        }
    }
}
