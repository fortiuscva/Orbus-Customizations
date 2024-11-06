page 52642 "ORB LIFT Item Journal Line"
{
    ApplicationArea = All;
    Caption = 'LIFT Item Journal Line';
    PageType = List;
    SourceTable = "Item Journal Line";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ToolTip = 'Specifies the name of the journal template, the basis of the journal batch, that the entries were posted from.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the number of the journal line.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'The item to consume.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies the type of transaction that will be posted from the item journal line.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies a document number for the journal line.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Description of the item being consumed.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the inventory location where the item on the journal line will be registered.';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                }
                field("Source Posting Group"; Rec."Source Posting Group")
                {
                    ToolTip = 'Specifies the value of the Source Posting Group field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the produced item that can be posted as output on the journal line.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ToolTip = 'Specifies the value of the Invoiced Quantity field.';
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ToolTip = 'Specifies the price of one unit of the item on the journal line.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the line''s net amount.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ToolTip = 'Specifies the discount amount of this entry on the line.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ToolTip = 'Specifies the code for the salesperson or purchaser who is linked to the sale or purchase on the journal line.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                    ToolTip = 'Specifies if the quantity on the journal line must be applied to an already-posted entry. In that case, enter the entry number that the quantity will be applied to.';
                }
                field("Item Shpt. Entry No."; Rec."Item Shpt. Entry No.")
                {
                    ToolTip = 'Specifies the value of the Item Shpt. Entry No. field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Shpt. Method Code"; Rec."Shpt. Method Code")
                {
                    ToolTip = 'Specifies the value of the Shpt. Method Code field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the entries were posted from.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                }
                field("Recurring Method"; Rec."Recurring Method")
                {
                    ToolTip = 'Specifies a recurring method, if you have indicated that the journal is recurring.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the expiration date, if any, of the item carrying the item tracking number.';
                }
                field("Recurring Frequency"; Rec."Recurring Frequency")
                {
                    ToolTip = 'Specifies a recurring frequency if you have indicated that the journal is recurring.';
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                    ToolTip = 'Specifies the value of the Drop Shipment field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    ToolTip = 'Specifies the new location to link the items on this journal line.';
                }
                field("New Shortcut Dimension 1 Code"; Rec."New Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the new dimension value code that will link to the items on the journal line.';
                }
                field("New Shortcut Dimension 2 Code"; Rec."New Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the new dimension value code that will link to the items on the journal line.';
                }
                field("Qty. (Calculated)"; Rec."Qty. (Calculated)")
                {
                    ToolTip = 'Specifies the quantity on hand of the item.';
                }
                field("Qty. (Phys. Inventory)"; Rec."Qty. (Phys. Inventory)")
                {
                    ToolTip = 'Specifies the quantity on hand of the item as determined from a physical count.';
                }
                field("Last Item Ledger Entry No."; Rec."Last Item Ledger Entry No.")
                {
                    ToolTip = 'Specifies the value of the Last Item Ledger Entry No. field.';
                }
                field("Phys. Inventory"; Rec."Phys. Inventory")
                {
                    ToolTip = 'Specifies the value of the Phys. Inventory field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("Entry/Exit Point"; Rec."Entry/Exit Point")
                {
                    ToolTip = 'Specifies the value of the Entry/Exit Point field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Area"; Rec."Area")
                {
                    ToolTip = 'Specifies the value of the Area field.';
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ToolTip = 'Specifies the value of the Transaction Specification field.';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ToolTip = 'Specifies the value of the Posting No. Series field.';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ToolTip = 'Specifies the value of the Reserved Quantity field.';
                }
                field("Unit Cost (ACY)"; Rec."Unit Cost (ACY)")
                {
                    ToolTip = 'Specifies the value of the Unit Cost (ACY) field.';
                }
                field("Source Currency Code"; Rec."Source Currency Code")
                {
                    ToolTip = 'Specifies the value of the Source Currency Code field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Document Line No. field.';
                }
                field("VAT Reporting Date"; Rec."VAT Reporting Date")
                {
                    ToolTip = 'Specifies the value of the VAT Date field.';
                }
                field("Order Type"; Rec."Order Type")
                {
                    ToolTip = 'Specifies the value of the Order Type field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Order No.';
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                    ToolTip = 'Specifies the line number of the order that created the entry.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("New Dimension Set ID"; Rec."New Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the New Dimension Set ID field.';
                }
                field("Assemble to Order"; Rec."Assemble to Order")
                {
                    ToolTip = 'Specifies the value of the Assemble to Order field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Job Purchase"; Rec."Job Purchase")
                {
                    ToolTip = 'Specifies the value of the Job Purchase field.';
                }
                field("Job Contract Entry No."; Rec."Job Contract Entry No.")
                {
                    ToolTip = 'Specifies the value of the Job Contract Entry No. field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Variant of the item being consumed.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies a bin code for the item.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Qty. per Unit of Measure field.';
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                    ToolTip = 'Specifies the new bin code to link to the items on this journal line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Unit of measure for recording output.';
                }
                field("Derived from Blanket Order"; Rec."Derived from Blanket Order")
                {
                    ToolTip = 'Specifies the value of the Derived from Blanket Order field.';
                }
                field("Qty. Rounding Precision"; Rec."Qty. Rounding Precision")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision field.';
                }
                field("Qty. Rounding Precision (Base)"; Rec."Qty. Rounding Precision (Base)")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision (Base) field.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ToolTip = 'Specifies the value of the Quantity (Base) field.';
                }
                field("Invoiced Qty. (Base)"; Rec."Invoiced Qty. (Base)")
                {
                    ToolTip = 'Specifies the value of the Invoiced Qty. (Base) field.';
                }
                field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
                {
                    ToolTip = 'Specifies the quantity of the item reserved for the line.';
                }
                field(Level; Rec.Level)
                {
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Flushing Method"; Rec."Flushing Method")
                {
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                }
                field("Changed by User"; Rec."Changed by User")
                {
                    ToolTip = 'Specifies the value of the Changed by User field.';
                }
                field("Originally Ordered No."; Rec."Originally Ordered No.")
                {
                    ToolTip = 'Specifies the value of the Originally Ordered No. field.';
                }
                field("Originally Ordered Var. Code"; Rec."Originally Ordered Var. Code")
                {
                    ToolTip = 'Specifies the value of the Originally Ordered Var. Code field.';
                }
                field("Out-of-Stock Substitution"; Rec."Out-of-Stock Substitution")
                {
                    ToolTip = 'Specifies the value of the Out-of-Stock Substitution field.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the value of the Item Category Code field.';
                }
                field(Nonstock; Rec.Nonstock)
                {
                    ToolTip = 'Specifies the value of the Catalog field.';
                }
                field("Purchasing Code"; Rec."Purchasing Code")
                {
                    ToolTip = 'Specifies the value of the Purchasing Code field.';
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                    ToolTip = 'Specifies a reference to the item number as defined by the item''s barcode.';
                }
                field("Item Reference Unit of Measure"; Rec."Item Reference Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Item Reference Unit of Measure field.';
                }
                field("Item Reference Type"; Rec."Item Reference Type")
                {
                    ToolTip = 'Specifies the value of the Item Reference Type field.';
                }
                field("Item Reference Type No."; Rec."Item Reference Type No.")
                {
                    ToolTip = 'Specifies the value of the Item Reference Type No. field.';
                }
                field("Planned Delivery Date"; Rec."Planned Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Planned Delivery Date field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("Value Entry Type"; Rec."Value Entry Type")
                {
                    ToolTip = 'Specifies the value of the Value Entry Type field.';
                }
                field("Item Charge No."; Rec."Item Charge No.")
                {
                    ToolTip = 'Specifies the value of the Item Charge No. field.';
                }
                field("Inventory Value (Calculated)"; Rec."Inventory Value (Calculated)")
                {
                    ToolTip = 'Specifies the calculated inventory value of the item at the specified posting date.';
                }
                field("Inventory Value (Revalued)"; Rec."Inventory Value (Revalued)")
                {
                    ToolTip = 'Specifies the new inventory value.';
                }
                field("Variance Type"; Rec."Variance Type")
                {
                    ToolTip = 'Specifies the value of the Variance Type field.';
                }
                field("Inventory Value Per"; Rec."Inventory Value Per")
                {
                    ToolTip = 'Specifies the value of the Inventory Value Per field.';
                }
                field("Partial Revaluation"; Rec."Partial Revaluation")
                {
                    ToolTip = 'Specifies the value of the Partial Revaluation field.';
                }
                field("Applies-from Entry"; Rec."Applies-from Entry")
                {
                    ToolTip = 'Specifies the number of the outbound item ledger entry, whose cost is forwarded to the inbound item ledger entry.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field("Unit Cost (Calculated)"; Rec."Unit Cost (Calculated)")
                {
                    ToolTip = 'Specifies the current unit cost of this item before revaluation.';
                }
                field("Unit Cost (Revalued)"; Rec."Unit Cost (Revalued)")
                {
                    ToolTip = 'Specifies the revalued unit cost of this item.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Update Standard Cost"; Rec."Update Standard Cost")
                {
                    ToolTip = 'Specifies the value of the Update Standard Cost field.';
                }
                field("Amount (ACY)"; Rec."Amount (ACY)")
                {
                    ToolTip = 'Specifies the value of the Amount (ACY) field.';
                }
                field(Correction; Rec.Correction)
                {
                    ToolTip = 'Specifies the value of the Correction field.';
                }
                field(Adjustment; Rec.Adjustment)
                {
                    ToolTip = 'Specifies the value of the Adjustment field.';
                }
                field("Applies-to Value Entry"; Rec."Applies-to Value Entry")
                {
                    ToolTip = 'Specifies the value of the Applies-to Value Entry field.';
                }
                field("Invoice-to Source No."; Rec."Invoice-to Source No.")
                {
                    ToolTip = 'Specifies the value of the Invoice-to Source No. field.';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the journal type, which is either Work Center or Machine Center.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Operation No."; Rec."Operation No.")
                {
                    ToolTip = 'Specifies the number of the production operation on the item journal line when the journal functions as an output journal.';
                }
                field("Work Center No."; Rec."Work Center No.")
                {
                    ToolTip = 'Specifies the value of the Work Center No. field.';
                }
                field("Setup Time"; Rec."Setup Time")
                {
                    ToolTip = 'Specifies the time required to set up the machines for this journal line.';
                }
                field("Run Time"; Rec."Run Time")
                {
                    ToolTip = 'Specifies the run time of the operations represented by this journal line.';
                }
                field("Stop Time"; Rec."Stop Time")
                {
                    ToolTip = 'Specifies the stop time of this capacity ledger entry.';
                }
                field("Output Quantity"; Rec."Output Quantity")
                {
                    ToolTip = 'Specifies the quantity of the produced item that can be posted as output on the journal line.';
                }
                field("Scrap Quantity"; Rec."Scrap Quantity")
                {
                    ToolTip = 'Specifies the number of units produced incorrectly, and therefore cannot be used.';
                }
                field("Concurrent Capacity"; Rec."Concurrent Capacity")
                {
                    ToolTip = 'Specifies the concurrent capacity.';
                }
                field("Setup Time (Base)"; Rec."Setup Time (Base)")
                {
                    ToolTip = 'Specifies the value of the Setup Time (Base) field.';
                }
                field("Run Time (Base)"; Rec."Run Time (Base)")
                {
                    ToolTip = 'Specifies the value of the Run Time (Base) field.';
                }
                field("Stop Time (Base)"; Rec."Stop Time (Base)")
                {
                    ToolTip = 'Specifies the value of the Stop Time (Base) field.';
                }
                field("Output Quantity (Base)"; Rec."Output Quantity (Base)")
                {
                    ToolTip = 'Specifies the value of the Output Quantity (Base) field.';
                }
                field("Scrap Quantity (Base)"; Rec."Scrap Quantity (Base)")
                {
                    ToolTip = 'Specifies the value of the Scrap Quantity (Base) field.';
                }
                field("Cap. Unit of Measure Code"; Rec."Cap. Unit of Measure Code")
                {
                    ToolTip = 'Specifies the unit of measure code for the capacity usage.';
                }
                field("Qty. per Cap. Unit of Measure"; Rec."Qty. per Cap. Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Qty. per Cap. Unit of Measure field.';
                }
                field("Starting Time"; Rec."Starting Time")
                {
                    ToolTip = 'Specifies the starting time of the operation on the item journal line.';
                }
                field("Ending Time"; Rec."Ending Time")
                {
                    ToolTip = 'Specifies the ending time of the operation on the item journal line.';
                }
                field("Routing No."; Rec."Routing No.")
                {
                    ToolTip = 'Specifies the value of the Routing No. field.';
                }
                field("Routing Reference No."; Rec."Routing Reference No.")
                {
                    ToolTip = 'Specifies the value of the Routing Reference No. field.';
                }
                field("Prod. Order Comp. Line No."; Rec."Prod. Order Comp. Line No.")
                {
                    ToolTip = 'Specifies the production order component line number.';
                }
                field(Finished; Rec.Finished)
                {
                    ToolTip = 'Specifies that the operation represented by the output journal line is finished.';
                }
                field("Unit Cost Calculation"; Rec."Unit Cost Calculation")
                {
                    ToolTip = 'Specifies the value of the Unit Cost Calculation field.';
                }
                field(Subcontracting; Rec.Subcontracting)
                {
                    ToolTip = 'Specifies the value of the Subcontracting field.';
                }
                field("Stop Code"; Rec."Stop Code")
                {
                    ToolTip = 'Specifies the stop code.';
                }
                field("Scrap Code"; Rec."Scrap Code")
                {
                    ToolTip = 'Specifies the scrap code.';
                }
                field("Work Center Group Code"; Rec."Work Center Group Code")
                {
                    ToolTip = 'Specifies the value of the Work Center Group Code field.';
                }
                field("Work Shift Code"; Rec."Work Shift Code")
                {
                    ToolTip = 'Specifies the work shift code for this Journal line.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the Serial Number.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the Lot Number.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the warranty expiration date of the item.';
                }
                field("New Serial No."; Rec."New Serial No.")
                {
                    ToolTip = 'Specifies the value of the New Serial No. field.';
                }
                field("New Lot No."; Rec."New Lot No.")
                {
                    ToolTip = 'Specifies the value of the New Lot No. field.';
                }
                field("New Item Expiration Date"; Rec."New Item Expiration Date")
                {
                    ToolTip = 'Specifies the value of the New Item Expiration Date field.';
                }
                field("Item Expiration Date"; Rec."Item Expiration Date")
                {
                    ToolTip = 'Specifies the value of the Item Expiration Date field.';
                }
                field("Package No."; Rec."Package No.")
                {
                    ToolTip = 'Specifies the package number of the item.';
                }
                field("New Package No."; Rec."New Package No.")
                {
                    ToolTip = 'Specifies the value of the New Package No. field.';
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    ToolTip = 'Specifies the value of the Return Reason Code field.';
                }
                field("Price Calculation Method"; Rec."Price Calculation Method")
                {
                    ToolTip = 'Specifies the method that will be used for price calculation in the journal line.';
                }
                field("Warehouse Adjustment"; Rec."Warehouse Adjustment")
                {
                    ToolTip = 'Specifies the value of the Warehouse Adjustment field.';
                }
                field("Direct Transfer"; Rec."Direct Transfer")
                {
                    ToolTip = 'Specifies the value of the Direct Transfer field.';
                }
                field("Phys Invt Counting Period Code"; Rec."Phys Invt Counting Period Code")
                {
                    ToolTip = 'Specifies the value of the Phys Invt Counting Period Code field.';
                }
                field("Phys Invt Counting Period Type"; Rec."Phys Invt Counting Period Type")
                {
                    ToolTip = 'Specifies the value of the Phys Invt Counting Period Type field.';
                }
                field("ORB IWX AutoPost State"; Rec."ORB IWX AutoPost State")
                {
                    ToolTip = 'Whether or not this has been errored from the auto-post.';
                }
                field("ORB IWX AutoPost Error Message"; Rec."ORB IWX AutoPost Error Message")
                {
                    ToolTip = 'The last error message from the auto-post.';
                }
                field("ORB IWX AutoPost Error DT"; Rec."ORB IWX AutoPost Error DT")
                {
                    ToolTip = 'The last time this item journal line encountered an error message.';
                }
                field("SFI Time Card No."; Rec."SFI Time Card No.")
                {
                    ToolTip = 'The Shop Floor Time Card that has more information.';
                }
                field("SFI Time Card Line No."; Rec."SFI Time Card Line No.")
                {
                    ToolTip = 'The specific line on the Shop Floor Time Card.';
                }
                field("SFI Employee No."; Rec."SFI Employee No.")
                {
                    ToolTip = 'Specifies the value of the SFI Employee No. field.', Comment = '%';
                }
                field("SFI Shop Floor Employee No."; Rec."SFI Shop Floor Employee No.")
                {
                    ToolTip = 'The Shop Floor Employee that last modified the operation';
                }
                field("SFI Output Recorded DateTime"; Rec."SFI Output Recorded DateTime")
                {
                    ToolTip = 'The timestamp when this output was recorded.';
                }
                field("SFI Cumulative Output Hours"; Rec."SFI Cumulative Output Hours")
                {
                    ToolTip = 'The cumulative output hours until the point of this record.';
                }
                field("SFI Time Since Last Output"; Rec."SFI Time Since Last Output")
                {
                    ToolTip = 'The time since the last output.  This can be used in multi-shot reporting and analysis.';
                }
                field("SFI Units per Hour Snapshot"; Rec."SFI Units per Hour Snapshot")
                {
                    ToolTip = 'The current ratio of units per hour at the time this was recorded. This can be used in multi-shot reporting and analysis.';
                }
                field("SFI Hours per Unit Snapshot"; Rec."SFI Hours per Unit Snapshot")
                {
                    ToolTip = 'The current ratio of hours per unit at the time this was recorded. This can be used in multi-shot reporting and analysis.';
                }
                field("SFI Prod. Order Comp. Line No."; Rec."SFI Prod. Order Comp. Line No.")
                {
                    ToolTip = 'Specifies the value of the Workaround Prod. Order Comp. Line No. field.';
                }
                field("SFI Operation No."; Rec."SFI Operation No.")
                {
                    ToolTip = 'Specifies the value of the Workaround Operation No. field.';
                }
                field("SFI Routing Link Code"; Rec."SFI Routing Link Code")
                {
                    ToolTip = 'Specifies the value of the Workaround Routing Link Code field.';
                }
                field("SFI Routing Reference No."; Rec."SFI Routing Reference No.")
                {
                    ToolTip = 'Specifies the value of the Workaround Routing Reference No. field.';
                }
                field("SFI License Plate No."; Rec."SFI License Plate No.")
                {
                    ToolTip = 'The license plate to output to when it is the last operation.';
                }
                field("SFI Client Config No."; Rec."SFI Client Config No.")
                {
                    ToolTip = 'The client configuration to use when checking settings such as license plating.';
                }
                field("WMDM Prod. Serial No."; Rec."WMDM Prod. Serial No.")
                {
                    ToolTip = 'Specifies the value of the WMDM Prod. Serial No. field.', Comment = '%';
                }
                field("WMDM Prod. Lot No."; Rec."WMDM Prod. Lot No.")
                {
                    ToolTip = 'Specifies the value of the WMDM Prod. Lot No. field.', Comment = '%';
                }
                field("WMDM Barcode Data"; Rec."WMDM Barcode Data")
                {
                    ToolTip = 'Specifies the value of the WMDM Barcode Data field.', Comment = '%';
                }
                field("WMDM Cons. Serial No."; Rec."WMDM Cons. Serial No.")
                {
                    ToolTip = 'Specifies the value of the WMDM Cons. Serial No. field.', Comment = '%';
                }
                field("WMDM Cons. Lot No."; Rec."WMDM Cons. Lot No.")
                {
                    ToolTip = 'Specifies the value of the WMDM Cons. Lot No. field.', Comment = '%';
                }
                field("WMDM Quantity Required"; Rec."WMDM Quantity Required")
                {
                    ToolTip = 'Specifies the value of the WMDM Quantity Required field.', Comment = '%';
                }
                field("WMDM Entry"; Rec."WMDM Entry")
                {
                    ToolTip = 'Specifies the value of the WMDM Entry field.', Comment = '%';
                }
                field("WMDM Document No."; Rec."WMDM Document No.")
                {
                    ToolTip = 'Specifies the value of the WMDM Document No. field.', Comment = '%';
                }
                field("LPM License Plate No."; Rec."LPM License Plate No.")
                {
                    ToolTip = 'Specifies the value of the LPM License Plate No. field.', Comment = '%';
                }
                field("LPM Source Line No."; Rec."LPM Source Line No.")
                {
                    ToolTip = 'Specifies the value of the LPM Source Line No. field.', Comment = '%';
                }
                field("WMDM PDA Config ID"; Rec."WMDM PDA Config ID")
                {
                    ToolTip = 'Specifies the value of the WMDM PDA Config ID field.', Comment = '%';
                }
                field("LPM Action"; Rec."LPM Action")
                {
                    ToolTip = 'Specifies the value of the LPM Action field.', Comment = '%';
                }
                // field("IWX Prod. Package No."; Rec."IWX Prod. Package No.")
                // {
                //     ToolTip = 'Specifies the value of the IWX Prod. Package No. field.', Comment = '%';
                // }
                // field("IWX Cons. Package No."; Rec."IWX Cons. Package No.")
                // {
                //     ToolTip = 'Specifies the value of the IWX Cons. Package No. field.', Comment = '%';
                // }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                    ToolTip = 'Specifies the value of the Overhead Rate field.';
                }
                field("Single-Level Material Cost"; Rec."Single-Level Material Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Material Cost field.';
                }
                field("Single-Level Capacity Cost"; Rec."Single-Level Capacity Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Capacity Cost field.';
                }
                field("Single-Level Subcontrd. Cost"; Rec."Single-Level Subcontrd. Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Subcontrd. Cost field.';
                }
                field("Single-Level Cap. Ovhd Cost"; Rec."Single-Level Cap. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Cap. Ovhd Cost field.';
                }
                field("Single-Level Mfg. Ovhd Cost"; Rec."Single-Level Mfg. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Mfg. Ovhd Cost field.';
                }
                field("Rolled-up Material Cost"; Rec."Rolled-up Material Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Material Cost field.';
                }
                field("Rolled-up Capacity Cost"; Rec."Rolled-up Capacity Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Capacity Cost field.';
                }
                field("Rolled-up Subcontracted Cost"; Rec."Rolled-up Subcontracted Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Subcontracted Cost field.';
                }
                field("Rolled-up Mfg. Ovhd Cost"; Rec."Rolled-up Mfg. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Mfg. Ovhd Cost field.';
                }
                field("Rolled-up Cap. Overhead Cost"; Rec."Rolled-up Cap. Overhead Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Cap. Overhead Cost field.';
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
            }
        }
    }
}
