page 52640 "ORB LIFT Item"
{
    ApplicationArea = All;
    Caption = 'LIFT Item';
    PageType = List;
    SourceTable = Item;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the item.';
                }
                field("No. 2"; Rec."No. 2")
                {
                    ToolTip = 'Specifies the value of the No. 2 field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the item.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ToolTip = 'Specifies a search description that you use to find the item in lists.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies information in addition to the description.';
                }
                field("Assembly BOM"; Rec."Assembly BOM")
                {
                    ToolTip = 'Specifies if the item is an assembly BOM.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the base unit used to measure the item, such as piece, box, or pallet. The base unit of measure also serves as the conversion basis for alternate units of measure.';
                }
                field("Price Unit Conversion"; Rec."Price Unit Conversion")
                {
                    ToolTip = 'Specifies the value of the Price Unit Conversion field.', Comment = '%';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies if the item card represents a physical inventory unit (Inventory), a labor time unit (Service), or a physical unit that is not tracked in inventory (Non-Inventory).';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies links between business transactions made for the item and an inventory account in the general ledger, to group amounts for that item type.';
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ToolTip = 'Specifies where to find the item in the warehouse. This is informational only.';
                }
                field("Item Disc. Group"; Rec."Item Disc. Group")
                {
                    ToolTip = 'Specifies an item group code that can be used as a criterion to grant a discount when the item is sold to a certain customer.';
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    ToolTip = 'Specifies if the item should be included in the calculation of an invoice discount on documents where the item is traded.';
                }
                field("Statistics Group"; Rec."Statistics Group")
                {
                    ToolTip = 'Specifies the value of the Statistics Group field.', Comment = '%';
                }
                field("Commission Group"; Rec."Commission Group")
                {
                    ToolTip = 'Specifies the value of the Commission Group field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Price/Profit Calculation"; Rec."Price/Profit Calculation")
                {
                    ToolTip = 'Specifies the relationship between the Unit Cost, Unit Price, and Profit Percentage fields associated with this item.';
                }
                field("Profit %"; Rec."Profit %")
                {
                    ToolTip = 'Specifies the profit margin that you want to sell the item at. You can enter a profit percentage manually or have it entered according to the Price/Profit Calculation field';
                }
                field("Costing Method"; Rec."Costing Method")
                {
                    ToolTip = 'Specifies the method that is used to calculate the unit cost of the item.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the cost of one unit of the item.';
                }
                field("Standard Cost"; Rec."Standard Cost")
                {
                    ToolTip = 'Specifies the unit cost that is used as an estimation to be adjusted with variances later.';
                }
                field("Last Direct Cost"; Rec."Last Direct Cost")
                {
                    ToolTip = 'Specifies the most recent direct unit cost of the item.';
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                }
                field("Cost is Adjusted"; Rec."Cost is Adjusted")
                {
                    ToolTip = 'Specifies whether the cost of the item has been adjusted.';
                }
                field("Allow Online Adjustment"; Rec."Allow Online Adjustment")
                {
                    ToolTip = 'Specifies the value of the Allow Online Adjustment field.', Comment = '%';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the vendor code of who supplies this item by default.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
                field("Reorder Point"; Rec."Reorder Point")
                {
                    ToolTip = 'Specifies a stock quantity that sets the inventory below the level that you must replenish the item.';
                }
                field("Maximum Inventory"; Rec."Maximum Inventory")
                {
                    ToolTip = 'Specifies a quantity that you want to use as a maximum inventory level.';
                }
                field("Reorder Quantity"; Rec."Reorder Quantity")
                {
                    ToolTip = 'Specifies a standard lot size quantity to be used for all order proposals.';
                }
                field("Alternative Item No."; Rec."Alternative Item No.")
                {
                    ToolTip = 'Specifies the value of the Alternative Item No. field.', Comment = '%';
                }
                field("Unit List Price"; Rec."Unit List Price")
                {
                    ToolTip = 'Specifies the value of the Unit List Price field.', Comment = '%';
                }
                field("Duty Due %"; Rec."Duty Due %")
                {
                    ToolTip = 'Specifies the value of the Duty Due % field.', Comment = '%';
                }
                field("Duty Code"; Rec."Duty Code")
                {
                    ToolTip = 'Specifies the value of the Duty Code field.', Comment = '%';
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ToolTip = 'Specifies the gross weight of the item.';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ToolTip = 'Specifies the net weight of the item.';
                }
                field("Units per Parcel"; Rec."Units per Parcel")
                {
                    ToolTip = 'Specifies the value of the Units per Parcel field.', Comment = '%';
                }
                field("Unit Volume"; Rec."Unit Volume")
                {
                    ToolTip = 'Specifies the volume of one unit of the item.';
                }
                field(Durability; Rec.Durability)
                {
                    ToolTip = 'Specifies the value of the Durability field.', Comment = '%';
                }
                field("Freight Type"; Rec."Freight Type")
                {
                    ToolTip = 'Specifies the value of the Freight Type field.', Comment = '%';
                }
                field("Tariff No."; Rec."Tariff No.")
                {
                    ToolTip = 'Specifies a code for the item''s tariff number.';
                }
                field("Duty Unit Conversion"; Rec."Duty Unit Conversion")
                {
                    ToolTip = 'Specifies the value of the Duty Unit Conversion field.', Comment = '%';
                }
                field("Country/Region Purchased Code"; Rec."Country/Region Purchased Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region Purchased Code field.', Comment = '%';
                }
                field("Budget Quantity"; Rec."Budget Quantity")
                {
                    ToolTip = 'Specifies the value of the Budget Quantity field.', Comment = '%';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ToolTip = 'Specifies the value of the Budgeted Amount field.', Comment = '%';
                }
                field("Budget Profit"; Rec."Budget Profit")
                {
                    ToolTip = 'Specifies the value of the Budget Profit field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                }
                field("Cost is Posted to G/L"; Rec."Cost is Posted to G/L")
                {
                    ToolTip = 'Specifies whether the cost of the item has been posted to the general ledger.';
                }
                field("Block Reason"; Rec."Block Reason")
                {
                    ToolTip = 'Specifies the value of the Block Reason field.', Comment = '%';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies when the item card was last modified.';
                }
                field("Last Time Modified"; Rec."Last Time Modified")
                {
                    ToolTip = 'Specifies the value of the Last Time Modified field.', Comment = '%';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
                }
                field("Net Invoiced Qty."; Rec."Net Invoiced Qty.")
                {
                    ToolTip = 'Specifies how many units of the item in inventory have been invoiced.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ToolTip = 'Specifies the value of the Net Change field.', Comment = '%';
                }
                field("Purchases (Qty.)"; Rec."Purchases (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Purchases (Qty.) field.', Comment = '%';
                }
                field("Sales (Qty.)"; Rec."Sales (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Sales (Qty.) field.', Comment = '%';
                }
                field("Positive Adjmt. (Qty.)"; Rec."Positive Adjmt. (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Positive Adjmt. (Qty.) field.', Comment = '%';
                }
                field("Negative Adjmt. (Qty.)"; Rec."Negative Adjmt. (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Negative Adjmt. (Qty.) field.', Comment = '%';
                }
                field("Purchases (LCY)"; Rec."Purchases (LCY)")
                {
                    ToolTip = 'Specifies the value of the Purchases (LCY) field.', Comment = '%';
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ToolTip = 'Specifies the value of the Sales (LCY) field.', Comment = '%';
                }
                field("Positive Adjmt. (LCY)"; Rec."Positive Adjmt. (LCY)")
                {
                    ToolTip = 'Specifies the value of the Positive Adjmt. (LCY) field.', Comment = '%';
                }
                field("Negative Adjmt. (LCY)"; Rec."Negative Adjmt. (LCY)")
                {
                    ToolTip = 'Specifies the value of the Negative Adjmt. (LCY) field.', Comment = '%';
                }
                field("COGS (LCY)"; Rec."COGS (LCY)")
                {
                    ToolTip = 'Specifies the value of the COGS (LCY) field.', Comment = '%';
                }
                field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
                {
                    ToolTip = 'Specifies how many units of the item are inbound on purchase orders, meaning listed on outstanding purchase order lines.';
                }
                field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
                {
                    ToolTip = 'Specifies how many units of the item are allocated to sales orders, meaning listed on outstanding sales orders lines.';
                }
                field("Price Includes VAT"; Rec."Price Includes VAT")
                {
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales document lines for this item should be shown with or without VAT.';
                }
                field("VAT Bus. Posting Gr. (Price)"; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    ToolTip = 'Specifies the VAT business posting group for customers for whom you want the sales price including VAT to apply.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field(Picture; Rec.Picture)
                {
                    ToolTip = 'Picture';
                }
                field("Transferred (Qty.)"; Rec."Transferred (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Transferred (Qty.) field.', Comment = '%';
                }
                field("Transferred (LCY)"; Rec."Transferred (LCY)")
                {
                    ToolTip = 'Specifies the value of the Transferred (LCY) field.', Comment = '%';
                }
                field("Country/Region of Origin Code"; Rec."Country/Region of Origin Code")
                {
                    ToolTip = 'Specifies a code for the country/region where the item was produced or processed.';
                }
                field("Automatic Ext. Texts"; Rec."Automatic Ext. Texts")
                {
                    ToolTip = 'Specifies that an extended text that you have set up will be added automatically on sales or purchase documents for this item.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ToolTip = 'Specifies the tax group that is used to calculate and post sales tax.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field(Reserve; Rec.Reserve)
                {
                    ToolTip = 'Specifies if and how the item will be reserved. Never: It is not possible to reserve the item. Optional: You can reserve the item manually. Always: The item is automatically reserved from demand, such as sales orders, against inventory, purchase orders, assembly orders, and production orders.';
                }
                field("Reserved Qty. on Inventory"; Rec."Reserved Qty. on Inventory")
                {
                    ToolTip = 'Specifies the value of the Reserved Qty. on Inventory field.', Comment = '%';
                }
                field("Reserved Qty. on Purch. Orders"; Rec."Reserved Qty. on Purch. Orders")
                {
                    ToolTip = 'Specifies the value of the Reserved Qty. on Purch. Orders field.', Comment = '%';
                }
                field("Reserved Qty. on Sales Orders"; Rec."Reserved Qty. on Sales Orders")
                {
                    ToolTip = 'Specifies the value of the Reserved Qty. on Sales Orders field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Res. Qty. on Outbound Transfer"; Rec."Res. Qty. on Outbound Transfer")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Outbound Transfer field.', Comment = '%';
                }
                field("Res. Qty. on Inbound Transfer"; Rec."Res. Qty. on Inbound Transfer")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Inbound Transfer field.', Comment = '%';
                }
                field("Res. Qty. on Sales Returns"; Rec."Res. Qty. on Sales Returns")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Sales Returns field.', Comment = '%';
                }
                field("Res. Qty. on Purch. Returns"; Rec."Res. Qty. on Purch. Returns")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Purch. Returns field.', Comment = '%';
                }
                field("Stockout Warning"; Rec."Stockout Warning")
                {
                    ToolTip = 'Specifies if a warning is displayed when you enter a quantity on a sales document that brings the item''s inventory below zero.';
                }
                field("Prevent Negative Inventory"; Rec."Prevent Negative Inventory")
                {
                    ToolTip = 'Specifies whether you can post a transaction that will bring the item''s inventory below zero. Negative inventory is always prevented for Consumption and Transfer type transactions.';
                }
                field("Variant Mandatory if Exists"; Rec."Variant Mandatory if Exists")
                {
                    ToolTip = 'Specifies whether a variant must be selected if variants exist for the item.';
                }
                field("Cost of Open Production Orders"; Rec."Cost of Open Production Orders")
                {
                    ToolTip = 'Specifies the value of the Cost of Open Production Orders field.', Comment = '%';
                }
                field("Application Wksh. User ID"; Rec."Application Wksh. User ID")
                {
                    ToolTip = 'Specifies the ID of a user who is working in the Application Worksheet window.';
                }
                field("Coupled to CRM"; Rec."Coupled to CRM")
                {
                    ToolTip = 'Specifies that the item is coupled to a product in Dynamics 365 Sales.';
                }
                field("Coupled to Dataverse"; Rec."Coupled to Dataverse")
                {
                    ToolTip = 'Specifies that the item is coupled to a product in Dynamics 365 Sales.';
                }
                field("Assembly Policy"; Rec."Assembly Policy")
                {
                    ToolTip = 'Specifies which default order flow is used to supply this assembly item.';
                }
                field("Res. Qty. on Assembly Order"; Rec."Res. Qty. on Assembly Order")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Assembly Order field.', Comment = '%';
                }
                field("Res. Qty. on  Asm. Comp."; Rec."Res. Qty. on  Asm. Comp.")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on  Asm. Comp. field.', Comment = '%';
                }
                field("Qty. on Assembly Order"; Rec."Qty. on Assembly Order")
                {
                    ToolTip = 'Specifies how many units of the item are allocated to assembly orders, which is how many are listed on outstanding assembly order headers.';
                }
                field("Qty. on Asm. Component"; Rec."Qty. on Asm. Component")
                {
                    ToolTip = 'Specifies how many units of the item are allocated as assembly components, which means how many are listed on outstanding assembly order lines.';
                }
                field("Qty. on Job Order"; Rec."Qty. on Job Order")
                {
                    ToolTip = 'Specifies how many units of the item are allocated to projects, meaning listed on outstanding project planning lines.';
                }
                field("Res. Qty. on Job Order"; Rec."Res. Qty. on Job Order")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Project Order field.', Comment = '%';
                }
                field(GTIN; Rec.GTIN)
                {
                    ToolTip = 'Specifies the Global Trade Item Number (GTIN) for the item. For example, the GTIN is used with bar codes to track items, and when sending and receiving documents electronically. The GTIN number typically contains a Universal Product Code (UPC), or European Article Number (EAN).';
                }
                field("Default Deferral Template Code"; Rec."Default Deferral Template Code")
                {
                    ToolTip = 'Specifies how revenue or expenses for the item are deferred to other accounting periods by default.';
                }
                field("Low-Level Code"; Rec."Low-Level Code")
                {
                    ToolTip = 'Specifies the item''s level in a bill of material if the item is a component in a production BOM or an assembly BOM.';
                }
                field("Lot Size"; Rec."Lot Size")
                {
                    ToolTip = 'Specifies the default number of units of the item that are processed in one production operation. This affects standard cost calculations and capacity planning. If the item routing includes fixed costs such as setup time, the value in this field is used to calculate the standard cost and distribute the setup costs. During demand planning, this value is used together with the value in the Default Dampener % field to ignore negligible changes in demand and avoid re-planning. Note that if you leave the field blank, it will be threated as 1.';
                }
                field("Serial Nos."; Rec."Serial Nos.")
                {
                    ToolTip = 'Specifies a number series code to assign consecutive serial numbers to items produced.';
                }
                field("Last Unit Cost Calc. Date"; Rec."Last Unit Cost Calc. Date")
                {
                    ToolTip = 'Specifies the value of the Last Unit Cost Calc. Date field.', Comment = '%';
                }
                field("Rolled-up Material Cost"; Rec."Rolled-up Material Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Material Cost field.', Comment = '%';
                }
                field("Rolled-up Capacity Cost"; Rec."Rolled-up Capacity Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Capacity Cost field.', Comment = '%';
                }
                field("Scrap %"; Rec."Scrap %")
                {
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                }
                field("Inventory Value Zero"; Rec."Inventory Value Zero")
                {
                    ToolTip = 'Specifies whether the item on inventory must be excluded from inventory valuation. This is relevant if the item is kept on inventory on someone else''s behalf.';
                }
                field("Discrete Order Quantity"; Rec."Discrete Order Quantity")
                {
                    ToolTip = 'Specifies the value of the Discrete Order Quantity field.', Comment = '%';
                }
                field("Minimum Order Quantity"; Rec."Minimum Order Quantity")
                {
                    ToolTip = 'Specifies a minimum allowable quantity for an item order proposal.';
                }
                field("Maximum Order Quantity"; Rec."Maximum Order Quantity")
                {
                    ToolTip = 'Specifies a maximum allowable quantity for an item order proposal.';
                }
                field("Safety Stock Quantity"; Rec."Safety Stock Quantity")
                {
                    ToolTip = 'Specifies a quantity of stock to have in inventory to protect against supply-and-demand fluctuations during replenishment lead time.';
                }
                field("Order Multiple"; Rec."Order Multiple")
                {
                    ToolTip = 'Specifies a parameter used by the planning system to modify the quantity of planned supply orders.';
                }
                field("Safety Lead Time"; Rec."Safety Lead Time")
                {
                    ToolTip = 'Specifies a date formula to indicate a safety lead time that can be used as a buffer period for production and other delays.';
                }
                field("Flushing Method"; Rec."Flushing Method")
                {
                    ToolTip = 'Specifies how consumption of the item (component) is calculated and handled in production processes. Manual: Enter and post consumption in the consumption journal manually. Forward: Automatically posts consumption according to the production order component lines when the first operation starts. Backward: Automatically calculates and posts consumption according to the production order component lines when the production order is finished. Pick + Forward / Pick + Backward: Variations with warehousing.';
                }
                field("Replenishment System"; Rec."Replenishment System")
                {
                    ToolTip = 'Specifies the type of supply order created by the planning system when the item needs to be replenished.';
                }
                field("Scheduled Receipt (Qty.)"; Rec."Scheduled Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Scheduled Receipt (Qty.) field.', Comment = '%';
                }
                field("Scheduled Need (Qty.)"; Rec."Scheduled Need (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Scheduled Need (Qty.) field.', Comment = '%';
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ToolTip = 'Specifies how calculated consumption quantities are rounded when entered on consumption journal lines.';
                }
                field("Sales Unit of Measure"; Rec."Sales Unit of Measure")
                {
                    ToolTip = 'Specifies the unit of measure code used when you sell the item.';
                }
                field("Purch. Unit of Measure"; Rec."Purch. Unit of Measure")
                {
                    ToolTip = 'Specifies the unit of measure code used when you purchase the item.';
                }
                field("Time Bucket"; Rec."Time Bucket")
                {
                    ToolTip = 'Specifies a time period that defines the recurring planning horizon used with Fixed Reorder Qty. or Maximum Qty. reordering policies.';
                }
                field("Reserved Qty. on Prod. Order"; Rec."Reserved Qty. on Prod. Order")
                {
                    ToolTip = 'Specifies the value of the Reserved Qty. on Prod. Order field.', Comment = '%';
                }
                field("Res. Qty. on Prod. Order Comp."; Rec."Res. Qty. on Prod. Order Comp.")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Prod. Order Comp. field.', Comment = '%';
                }
                field("Res. Qty. on Req. Line"; Rec."Res. Qty. on Req. Line")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Req. Line field.', Comment = '%';
                }
                field("Reordering Policy"; Rec."Reordering Policy")
                {
                    ToolTip = 'Specifies the reordering policy.';
                }
                field("Include Inventory"; Rec."Include Inventory")
                {
                    ToolTip = 'Specifies that the inventory quantity is included in the projected available balance when replenishment orders are calculated.';
                }
                field("Manufacturing Policy"; Rec."Manufacturing Policy")
                {
                    ToolTip = 'Specifies if additional orders for any related components are calculated.';
                }
                field("Rescheduling Period"; Rec."Rescheduling Period")
                {
                    ToolTip = 'Specifies a period within which any suggestion to change a supply date always consists of a Reschedule action and never a Cancel + New action.';
                }
                field("Lot Accumulation Period"; Rec."Lot Accumulation Period")
                {
                    ToolTip = 'Specifies a period in which multiple demands are accumulated into one supply order when you use the Lot-for-Lot reordering policy.';
                }
                field("Dampener Period"; Rec."Dampener Period")
                {
                    ToolTip = 'Specifies a period of time during which you do not want the planning system to propose to reschedule existing supply orders forward. The dampener period limits the number of insignificant rescheduling of existing supply to a later date if that new date is within the dampener period. The dampener period function is only initiated if the supply can be rescheduled to a later date and not if the supply can be rescheduled to an earlier date. Accordingly, if the suggested new supply date is after the dampener period, then the rescheduling suggestion is not blocked. If the lot accumulation period is less than the dampener period, then the dampener period is dynamically set to equal the lot accumulation period. This is not shown in the value that you enter in the Dampener Period field. The last demand in the lot accumulation period is used to determine whether a potential supply date is in the dampener period. If this field is empty, then the value in the Default Dampener Period field in the Manufacturing Setup window applies. The value that you enter in the Dampener Period field must be a date formula, and one day (1D) is the shortest allowed period.';
                }
                field("Dampener Quantity"; Rec."Dampener Quantity")
                {
                    ToolTip = 'Specifies a dampener quantity to block insignificant change suggestions for an existing supply, if the change quantity is lower than the dampener quantity.';
                }
                field("Overflow Level"; Rec."Overflow Level")
                {
                    ToolTip = 'Specifies a quantity you allow projected inventory to exceed the reorder point, before the system suggests to decrease supply orders.';
                }
                field("Planning Transfer Ship. (Qty)."; Rec."Planning Transfer Ship. (Qty).")
                {
                    ToolTip = 'Specifies the value of the Planning Transfer Ship. (Qty). field.', Comment = '%';
                }
                field("Planning Worksheet (Qty.)"; Rec."Planning Worksheet (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planning Worksheet (Qty.) field.', Comment = '%';
                }
                field("Stockkeeping Unit Exists"; Rec."Stockkeeping Unit Exists")
                {
                    ToolTip = 'Specifies that a stockkeeping unit exists for this item.';
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ToolTip = 'Specifies a code for the manufacturer of the catalog item.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ToolTip = 'Specifies the category that the item belongs to. Item categories also contain any assigned item attributes.';
                }
                field("Created From Nonstock Item"; Rec."Created From Nonstock Item")
                {
                    ToolTip = 'Specifies that the item was created from a catalog item.';
                }
                field("Substitutes Exist"; Rec."Substitutes Exist")
                {
                    ToolTip = 'Specifies that a substitute exists for this item.';
                }
                field("Qty. in Transit"; Rec."Qty. in Transit")
                {
                    ToolTip = 'Specifies the value of the Qty. in Transit field.', Comment = '%';
                }
                field("Trans. Ord. Receipt (Qty.)"; Rec."Trans. Ord. Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the quantity of the items that remains to be received but are not yet shipped as the difference between the Quantity and the Quantity Shipped fields.';
                }
                field("Trans. Ord. Shipment (Qty.)"; Rec."Trans. Ord. Shipment (Qty.)")
                {
                    ToolTip = 'Specifies the quantity of the items that remains to be shipped as the difference between the Quantity and the Quantity Shipped fields.';
                }
                field("Purchasing Code"; Rec."Purchasing Code")
                {
                    ToolTip = 'Specifies the code for a special procurement method, such as drop shipment.';
                }
                field("Qty. Assigned to ship"; Rec."Qty. Assigned to ship")
                {
                    ToolTip = 'Specifies the value of the Qty. Assigned to ship field.', Comment = '%';
                }
                field("Qty. Picked"; Rec."Qty. Picked")
                {
                    ToolTip = 'Specifies the value of the Qty. Picked field.', Comment = '%';
                }
                // field("Excluded from Cost Adjustment"; Rec."Excluded from Cost Adjustment")
                // {
                //     ToolTip = 'Specifies whether the item is excluded from the cost adjustment process.';
                // }
                field("Service Item Group"; Rec."Service Item Group")
                {
                    ToolTip = 'Specifies the code of the service item group that the item belongs to.';
                }
                field("Qty. on Service Order"; Rec."Qty. on Service Order")
                {
                    ToolTip = 'Specifies how many units of the item are allocated to service orders, meaning listed on outstanding service order lines.';
                }
                field("Res. Qty. on Service Orders"; Rec."Res. Qty. on Service Orders")
                {
                    ToolTip = 'Specifies the value of the Res. Qty. on Service Orders field.', Comment = '%';
                }
                field("Item Tracking Code"; Rec."Item Tracking Code")
                {
                    ToolTip = 'Specifies how serial or lot numbers assigned to the item are tracked in the supply chain.';
                }
                field("Lot Nos."; Rec."Lot Nos.")
                {
                    ToolTip = 'Specifies the number series code that will be used when assigning lot numbers.';
                }
                field("Expiration Calculation"; Rec."Expiration Calculation")
                {
                    ToolTip = 'Specifies the date formula for calculating the expiration date on the item tracking line. Note: This field will be ignored if the involved item has Require Expiration Date Entry set to Yes on the Item Tracking Code page.';
                }
                field("Qty. on Purch. Return"; Rec."Qty. on Purch. Return")
                {
                    ToolTip = 'Specifies the value of the Qty. on Purch. Return field.', Comment = '%';
                }
                field("Qty. on Sales Return"; Rec."Qty. on Sales Return")
                {
                    ToolTip = 'Specifies the value of the Qty. on Sales Return field.', Comment = '%';
                }
                field("No. of Substitutes"; Rec."No. of Substitutes")
                {
                    ToolTip = 'Specifies the number of substitutions that have been registered for the item.';
                }
                field("Warehouse Class Code"; Rec."Warehouse Class Code")
                {
                    ToolTip = 'Specifies the warehouse class code for the item.';
                }
                field("Special Equipment Code"; Rec."Special Equipment Code")
                {
                    ToolTip = 'Specifies the code of the equipment that warehouse employees must use when handling the item.';
                }
                field("Put-away Template Code"; Rec."Put-away Template Code")
                {
                    ToolTip = 'Specifies the code of the put-away template by which the program determines the most appropriate zone and bin for storage of the item after receipt.';
                }
                field("Put-away Unit of Measure Code"; Rec."Put-away Unit of Measure Code")
                {
                    ToolTip = 'Specifies the code of the item unit of measure in which the program will put the item away.';
                }
                field("Phys Invt Counting Period Code"; Rec."Phys Invt Counting Period Code")
                {
                    ToolTip = 'Specifies the code of the counting period that indicates how often you want to count the item in a physical inventory.';
                }
                field("Last Counting Period Update"; Rec."Last Counting Period Update")
                {
                    ToolTip = 'Specifies the last date on which you calculated the counting period. It is updated when you use the function Calculate Counting Period.';
                }
                field("Last Phys. Invt. Date"; Rec."Last Phys. Invt. Date")
                {
                    ToolTip = 'Specifies the date on which you last posted the results of a physical inventory for the item to the item ledger.';
                }
                field("Use Cross-Docking"; Rec."Use Cross-Docking")
                {
                    ToolTip = 'Specifies if this item can be cross-docked.';
                }
                field("Next Counting Start Date"; Rec."Next Counting Start Date")
                {
                    ToolTip = 'Specifies the starting date of the next counting period.';
                }
                field("Next Counting End Date"; Rec."Next Counting End Date")
                {
                    ToolTip = 'Specifies the ending date of the next counting period.';
                }
                field("Unit Group Exists"; Rec."Unit Group Exists")
                {
                    ToolTip = 'Specifies the value of the Unit Group Exists field.', Comment = '%';
                }
                field("Identifier Code"; Rec."Identifier Code")
                {
                    ToolTip = 'Specifies a unique code for the item in terms that are useful for automatic data capture.';
                }
                field("Unit of Measure Id"; Rec."Unit of Measure Id")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure Id field.', Comment = '%';
                }
                field("Tax Group Id"; Rec."Tax Group Id")
                {
                    ToolTip = 'Specifies the value of the Tax Group Id field.', Comment = '%';
                }
                field("Sales Blocked"; Rec."Sales Blocked")
                {
                    ToolTip = 'Specifies that the item cannot be entered on sales documents, except return orders and credit memos, and journals.';
                }
                field("Purchasing Blocked"; Rec."Purchasing Blocked")
                {
                    ToolTip = 'Specifies that the item cannot be entered on purchase documents, except return orders and credit memos, and journals.';
                }
                field("Item Category Id"; Rec."Item Category Id")
                {
                    ToolTip = 'Specifies the value of the Item Category Id field.', Comment = '%';
                }
                field("Inventory Posting Group Id"; Rec."Inventory Posting Group Id")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group Id field.', Comment = '%';
                }
                field("Gen. Prod. Posting Group Id"; Rec."Gen. Prod. Posting Group Id")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group Id field.', Comment = '%';
                }
                // field("Service Blocked"; Rec."Service Blocked")
                // {
                //     ToolTip = 'Specifies that the item cannot be entered on service items, service contracts and service documents, except credit memos.';
                // }
                field("Over-Receipt Code"; Rec."Over-Receipt Code")
                {
                    ToolTip = 'Specifies the policy that will be used for the item if more items than ordered are received.';
                }
                field("Duty Class"; Rec."Duty Class")
                {
                    ToolTip = 'Specifies the value of the Duty Class field.', Comment = '%';
                }
                field("Consumptions (Qty.)"; Rec."Consumptions (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Consumptions (Qty.) field.', Comment = '%';
                }
                field("Outputs (Qty.)"; Rec."Outputs (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Outputs (Qty.) field.', Comment = '%';
                }
                field("Rel. Scheduled Receipt (Qty.)"; Rec."Rel. Scheduled Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Rel. Scheduled Receipt (Qty.) field.', Comment = '%';
                }
                field("Rel. Scheduled Need (Qty.)"; Rec."Rel. Scheduled Need (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Rel. Scheduled Need (Qty.) field.', Comment = '%';
                }
                field("SAT Item Classification"; Rec."SAT Item Classification")
                {
                    ToolTip = 'Specifies the classification required for reporting to the Mexican tax authorities (SAT)';
                }
                field("SAT Hazardous Material"; Rec."SAT Hazardous Material")
                {
                    ToolTip = 'Specifies the type of hazardous material being transported.';
                }
                field("SAT Packaging Type"; Rec."SAT Packaging Type")
                {
                    ToolTip = 'Specifies the type of packaging that is required to transport the hazardous material.';
                }
                field("SAT Material Type"; Rec."SAT Material Type")
                {
                    ToolTip = 'Specifies the production stage or state of this material. This information is required by Carte Porte in Mexico.';
                }
                field(IN_ExtendedDescription; Rec.IN_ExtendedDescription)
                {
                    ToolTip = 'Specifies the value of the Extended Description field.', Comment = '%';
                }
                field(IN_Queue; Rec.IN_Queue)
                {
                    ToolTip = 'Specifies the value of the Queue field.', Comment = '%';
                }
                field(BCItemTemplate; Rec.BCItemTemplate)
                {
                    ToolTip = 'Works in the background';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Width';
                }
                field(Height; Rec.Height)
                {
                    ToolTip = 'Height';
                }
                field("Short Description"; Rec."Short Description")
                {
                    ToolTip = 'Specifies the value of the Short Description field.', Comment = '%';
                }
                field("Department Dimension"; Rec."Department Dimension")
                {
                    ToolTip = 'Specifies the value of the Department Dimension field.', Comment = '%';
                }
                field("Division Dimension"; Rec."Division Dimension")
                {
                    ToolTip = 'Specifies the value of the Division Dimension field.', Comment = '%';
                }
                field("Product Line Dimension"; Rec."Product Line Dimension")
                {
                    ToolTip = 'Specifies the value of the Product Line Dimension field.', Comment = '%';
                }
                field("Material Dimension"; Rec."Material Dimension")
                {
                    ToolTip = 'Specifies the value of the Material Dimension field.', Comment = '%';
                }
                field("LV Sourced"; Rec."LV Sourced")
                {
                    ToolTip = 'Specifies the value of the LV Sourced field.', Comment = '%';
                }
                field("Gift Card -CL-"; Rec."Gift Card -CL-")
                {
                    ToolTip = 'Select an option for gift cards for this item';
                }
                field("POS Prompt Group Code -CL-"; Rec."POS Prompt Group Code -CL-")
                {
                    ToolTip = 'Select a POS prompt group code for this item';
                }
                field("POS Store Filter Exists -CL-"; Rec."POS Store Filter Exists -CL-")
                {
                    ToolTip = 'Specifies the value of the POS Store Filter Exists field.', Comment = '%';
                }
                field("Routing No."; Rec."Routing No.")
                {
                    ToolTip = 'Specifies the number of the production routing that the item is used in.';
                }
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    ToolTip = 'Specifies the number of the production BOM that the item represents.';
                }
                field("Single-Level Material Cost"; Rec."Single-Level Material Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Material Cost field.', Comment = '%';
                }
                field("Single-Level Capacity Cost"; Rec."Single-Level Capacity Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Capacity Cost field.', Comment = '%';
                }
                field("Single-Level Subcontrd. Cost"; Rec."Single-Level Subcontrd. Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Subcontrd. Cost field.', Comment = '%';
                }
                field("Single-Level Cap. Ovhd Cost"; Rec."Single-Level Cap. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Cap. Ovhd Cost field.', Comment = '%';
                }
                field("Single-Level Mfg. Ovhd Cost"; Rec."Single-Level Mfg. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Single-Level Mfg. Ovhd Cost field.', Comment = '%';
                }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                    ToolTip = 'Specifies the item''s indirect cost as an absolute amount.';
                }
                field("Rolled-up Subcontracted Cost"; Rec."Rolled-up Subcontracted Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Subcontracted Cost field.', Comment = '%';
                }
                field("Rolled-up Mfg. Ovhd Cost"; Rec."Rolled-up Mfg. Ovhd Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Mfg. Ovhd Cost field.', Comment = '%';
                }
                field("Rolled-up Cap. Overhead Cost"; Rec."Rolled-up Cap. Overhead Cost")
                {
                    ToolTip = 'Specifies the value of the Rolled-up Cap. Overhead Cost field.', Comment = '%';
                }
                field("Planning Issues (Qty.)"; Rec."Planning Issues (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planning Issues (Qty.) field.', Comment = '%';
                }
                field("Planning Receipt (Qty.)"; Rec."Planning Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planning Receipt (Qty.) field.', Comment = '%';
                }
                field("Planned Order Receipt (Qty.)"; Rec."Planned Order Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planned Order Receipt (Qty.) field.', Comment = '%';
                }
                field("FP Order Receipt (Qty.)"; Rec."FP Order Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the FP Order Receipt (Qty.) field.', Comment = '%';
                }
                field("Rel. Order Receipt (Qty.)"; Rec."Rel. Order Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Rel. Order Receipt (Qty.) field.', Comment = '%';
                }
                field("Planning Release (Qty.)"; Rec."Planning Release (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planning Release (Qty.) field.', Comment = '%';
                }
                field("Planned Order Release (Qty.)"; Rec."Planned Order Release (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Planned Order Release (Qty.) field.', Comment = '%';
                }
                field("Purch. Req. Receipt (Qty.)"; Rec."Purch. Req. Receipt (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Purch. Req. Receipt (Qty.) field.', Comment = '%';
                }
                field("Purch. Req. Release (Qty.)"; Rec."Purch. Req. Release (Qty.)")
                {
                    ToolTip = 'Specifies the value of the Purch. Req. Release (Qty.) field.', Comment = '%';
                }
                field("Order Tracking Policy"; Rec."Order Tracking Policy")
                {
                    ToolTip = 'Specifies if and how order tracking entries are created and maintained between supply and its corresponding demand.';
                }
                field("Prod. Forecast Quantity (Base)"; Rec."Prod. Forecast Quantity (Base)")
                {
                    ToolTip = 'Specifies the value of the Prod. Forecast Quantity (Base) field.', Comment = '%';
                }
                field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
                {
                    ToolTip = 'Specifies how many units of the item are allocated to production orders, meaning listed on outstanding production order lines.';
                }
                field("Qty. on Component Lines"; Rec."Qty. on Component Lines")
                {
                    ToolTip = 'Specifies how many units of the item are allocated as production order components, meaning listed under outstanding production order lines.';
                }
                field(Critical; Rec.Critical)
                {
                    ToolTip = 'Specifies if the item is included in availability calculations to promise a shipment date for its parent item.';
                }
                field("Common Item No."; Rec."Common Item No.")
                {
                    ToolTip = 'Specifies the unique common item number that the intercompany partners agree upon.';
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
