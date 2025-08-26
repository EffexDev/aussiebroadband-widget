RunGeneral(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()
    try {
        templateMap := TemplatesMaps.Get(Saved.PickedGeneralReason)
        Output := templateMap.Get(Saved.PickedGeneral)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}

RunAccount(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()

    try {
        templateMap := TemplatesMaps.Get(Saved.PickedAccountReason)
        Output := templateMap.Get(Saved.PickedAccount)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}

RunFault(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()

    try {
        templateMap := TemplatesMaps.Get(Saved.PickedFaultReason)
        Output := templateMap.Get(Saved.PickedFault)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}

RunDelivery(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()

    try {
        templateMap := TemplatesMaps.Get(Saved.PickedDeliveryReason)
        Output := templateMap.Get(Saved.PickedDelivery)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}

RunComplaint(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()

    try {
        templateMap := TemplatesMaps.Get(Saved.PickedComplaintReason)
        Output := templateMap.Get(Saved.PickedComplaint)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}

RunTCS(ctrl, *) {
    Global ShowNotesButton
    Saved := AussieGUI.Submit(False)
    Output := ""

    UpdateTemplates()

    try {
        templateMap := TemplatesMaps.Get(Saved.PickedTCSReason)
        Output := templateMap.Get(Saved.PickedTCS)

        showNotes := AussieGUI["ShowNotesButton"].Value
        
        if (showNotes) {
            ToolsTab.Choose(1)
            NotePadEmbedded.Value := ""
            Sleep(100)
            NotePadEmbedded.Value := Output
            ControlFocus NotePadEmbedded
        } else {
            TemplatesPad()
            Templates.Value := ""
            Sleep(100)
            Templates.Value := Output
            ToolsTab.Choose(1)
        }
    } catch as Error {
        MsgBox "Make sure you select all options and enter customer name."
    }
}