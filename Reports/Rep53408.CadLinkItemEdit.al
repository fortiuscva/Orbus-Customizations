report 53408 "ORB CadLink Item Edit"
{
    Caption = 'Cadlink Item Edit';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Cadlink;
    //ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = where(SystemCreatedBy = filter('{64c13f97-76b2-45fd-ab67-ec09c46494f5}'));
            column(No_; "No.")
            {
                Caption = 'Item No.';
            }
            column(Description; Description)
            {
                Caption = 'Item No.';
            }
            column(Department_Dimension; "Department Dimension")
            {
                Caption = 'Department Dimension';
            }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
                Caption = 'Global Dimension 2 Code -Base BC Department Dimension';
            }
            column(ProductionBOM; ProductionBOMVarGbl)
            {
                Caption = 'Production BOM';
            }
            column(ValueExists; NoValueBooleanGbl)
            {
                Caption = 'Value Exists';

            }
            column(SystemModifiedAt; SystemModifiedAt)
            {

                Caption = 'Modified Date';
            }

            trigger OnAfterGetRecord()
            var
                ItemRecLcl: Record Item;

            begin
                if ("Department Dimension" = '') and (SystemCreatedBy = '{64c13f97-76b2-45fd-ab67-ec09c46494f5}') then begin
                    if UpdateDeptDimensionBooleanGbl then begin
                        if "Global Dimension 2 Code" <> '' then begin
                            clear(ItemVarGbl);
                            if ItemRecLcl.Get("No.") then begin
                                ItemRecLcl.Validate("Department Dimension", "Global Dimension 2 Code");
                                ItemRecLcl.Modify();
                                ItemVarGbl := ItemRecLcl."No.";
                                If GuiAllowed then
                                    window.update(1, ItemVarGbl)
                            end;
                        end;
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                If GuiAllowed and UpdateDeptDimensionBooleanGbl then
                    window.open('####1###', ItemVarGbl)
                else
                    if not GuiAllowed then
                        UpdateDeptDimensionBooleanGbl := true;
            end;

            trigger OnPostDataItem()
            begin
                If GuiAllowed and UpdateDeptDimensionBooleanGbl then begin
                    window.Close();
                    Message('Cadlink Item Department Dimesions completed');
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(CADLINKOptions)
                {
                    field(UpdateDeptDimensionBooleanGbl; UpdateDeptDimensionBooleanGbl)
                    {
                        Caption = 'Update Department Dimension';
                        ApplicationArea = All;

                    }

                }
            }
        }
    }

    rendering
    {
        layout(Cadlink)
        {
            Type = Excel;
            LayoutFile = 'CADLINK Items.xlsx';
        }
    }

    var
        window: Dialog;
        ItemVarGbl: Text;
        ProductionBOMVarGbl: code[20];
        RoutingVarGbl: code[20];
        NoValueBooleanGbl: Boolean;
        UpdateDeptDimensionBooleanGbl: Boolean;

}