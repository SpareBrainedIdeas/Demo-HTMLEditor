page 73000 SendHTML
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Segment Header";

    layout
    {
        area(Content)
        {
            group(Editor)
            {
                usercontrol("HTMLEditor"; HTMLEditor)
                {
                    trigger ControlReady()
                    begin
                        AddinReady := true;
                        //Message('Control Addin HTMLEditor Ready');
                        CurrPage.HTMLEditor.setHTML(rawHTML);
                    end;

                    trigger HTMLEditor(newHTML: Text)
                    begin
                        rawHTML := newHTML;
                    end;

                    trigger resizedControl(newheight: Integer)
                    begin
                        if (AddinReady) then
                            CurrPage.HTMLEditor.resizeIFrame(newheight);
                    end;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SendEmail)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('This button would send something.');
                end;
            }

            action(TestHTML)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    rawHTML := 'This is a <i>formatted</i> <strike>text</strike> <b>test</b> message.';
                    CurrPage.HTMLEditor.setHTML(rawHTML);
                end;
            }

            action(ShowHTML)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message(rawHTML);
                end;
            }
        }
    }

    var
        rawHTML: Text;
        AddinReady: Boolean;
}