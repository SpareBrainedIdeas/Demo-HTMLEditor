pageextension 73001 AddHTMLSend extends "Segment List" // 5093
{
    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action("Send HTML Email")
            {
                ApplicationArea = All;
                RunPageOnRec = true;
                RunObject = page "SendHTML";
            }
        }
    }
}