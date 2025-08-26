AlwaysOnTopSetting := IniRead("config.ini", "Settings", "AlwaysOnTop")
InitialOntopState := AlwaysOnTopSetting == "True" ? 1 : 0

AussieGUI["AlwaysOnTop"].Value := InitialOntopState

ApplyOntop(isOntop) {
    if isOntop {
        AussieGUI.Opt("+AlwaysOnTop")  ; Enable Always on Top
    }
    else {
        AussieGUI.Opt("-AlwaysOnTop")  ; Disable Always on Top
    }
}

AlwaysOnTopToggle(ctrl, *) {
    if ctrl.Value {
        IniWrite("True", "config.ini", "Settings", "AlwaysOnTop")
    } else {
        IniWrite("False", "config.ini", "Settings", "AlwaysOnTop")
    }
    ApplyOntop(ctrl.Value)
}

ApplyOntop(initialOntopState)

NotepadSetting := IniRead("config.ini", "Settings", "ShowNotepad")
InitialNotepadState := NotepadSetting == "True" ? 1 : 0

AussieGUI["ShowNotesButton"].Value := InitialNotepadState

ShowNotepad(isExpanded) {

    Global NotePadEmbedded
    Global ToolsTab

    if isExpanded {
        AussieGUI["NotePadEmbedded"].Visible := 1
        AussieGUI.Show("h815")
        ToolsTab.Move(,, , 600)
        ToolsTab.Choose(1)
    }
    else {
        AussieGUI["NotePadEmbedded"].Visible := 0
        AussieGUI.Show("h295 w630")
        ToolsTab.Move(,, , 80)
    }
}

ShowNotes(ctrl, *) {
    if ctrl.Value {
        IniWrite("True", "config.ini", "Settings", "ShowNotepad")
    } else {
        IniWrite("False", "config.ini", "Settings", "ShowNotepad")
    }
    ShowNotepad(ctrl.Value)
}

ShowNotepad(initialNotepadState)

DarkmodeSetting := IniRead("config.ini", "Settings", "Darkmode")
initialDarkmodeState := DarkmodeSetting == "True" ? 1 : 0

AussieGUI["DarkModeButton"].Value := initialDarkmodeState

; Function to apply darkmode settings
ApplyDarkmode(isDark) {
    if isDark {
        AussieGUI.SetFont("cFFFFFF")
        AussieGUI.BackColor := "014f13"
        NotesGui.BackColor := "014f13"
        TemplatesGui.BackColor := "014f13"
        TemplateTab.Opt("xm h80 w610 Background01370d cFFFFFF")
        ToolsTab.Opt("WP h80 Background01370d cFFFFFF vToolsTab")
        AlwaysOnTopCheckBoxText.Opt("+BackgroundTrans cFFFFFF")
        ShowNotesButtonText.Opt("cFFFFFF")
        DarkmodeButtonText.Opt("cFFFFFF")
        NotePadEmbedded.Opt("Backgroundc0f0f13 cFFFFFF")
        Notes.Opt("Backgroundc000000 cFFFFFF")
        Notes.SetFont("s10", "Nunito")
        Templates.Opt("Backgroundc0f0f13 cFFFFFF")
        Templates.SetFont("s10", "Nunito")
    } else {
        AussieGUI.BackColor := "01711b"
        AussieGUI.Color := "c000000"
        NotesGui.BackColor := "01711b"
        TemplatesGui.BackColor := "01711b"
        TemplateTab.Opt("xm h80 w610 BackgroundWhite c000000")
        ToolsTab.Opt("WP h80 BackgroundWhite vToolsTab c000000")
        AlwaysOnTopCheckBoxText.Opt("c000000")
        ShowNotesButtonText.Opt("c000000")
        DarkmodeButtonText.Opt("c000000")
        NotePadEmbedded.Opt("BackgroundcFFFFFF c000000")
        Notes.Opt("BackgroundcFFFFFF c000000")
        Notes.SetFont("s10", "Nunito")
        Templates.Opt("BackgroundcFFFFFF c000000")
        Templates.SetFont("s10", "Nunito")
    }
}

Darkmode(ctrl, *) {
    if ctrl.Value {
        IniWrite("True", "config.ini", "Settings", "Darkmode")
    } else {
        IniWrite("False", "config.ini", "Settings", "Darkmode")
    }
    ApplyDarkmode(ctrl.Value)
}

ApplyDarkmode(initialDarkmodeState)