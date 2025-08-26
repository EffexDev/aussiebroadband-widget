#Requires AutoHotkey v2.0
#Include Templates.ahk

; Hotkey to reload the script. I mostly use this for debugging and testing
!F1::
{
    Reload
}

;Below is just the variable declarations for the template maps to be global, as well as setting the customername field. If it is not set you might accidentally put the wrong customers name in
IniWrite("xxx", "config.ini", "Customer", "CustomerName")

Global LiveChatMap := Map()
Global GeneralNBNMap := Map()
Global GeneralHardwareMap := Map()
Global GeneralOTRSMap := Map()
Global RedmineJiraMap := Map()
Global SignupMap := Map()
Global PromptMap := Map()
Global PPMap := Map()
Global FHMap := Map()
Global ReconnectionMap := Map()
Global CallbackMap := Map()
Global FaultTemplatesMap := Map()
Global DiscoveryMap := Map()
Global SpeedsMap := Map()
Global DropoutsMap := Map()
Global ConnectionMap := Map()
Global SetupMap := Map()
Global LinkMap := Map()
Global LocalIssuesMap := Map()
Global ServiceRequestMap := Map()
Global DelaysMap := Map()
Global HFCMap := Map()
Global FTTCMap := Map()
Global FTTPMap := Map()
Global ValidationMap := Map()
Global BanlistingMap := Map()
Global FailedPaymentMap := Map()
Global PaymentMap := Map()
Global NBNCompMap := Map()
Global RaisingMap := Map()
Global ClarificationMap := Map()
Global ResolutionsMap := Map()
Global ChangesMap := Map()
Global TIOMap := Map()
Global ContactsMap := Map()
Global TCSGeneralMap := Map()
Global TCSBillingMap := Map()
Global TCSSuspensionMap := Map()
Global TCSChangesMap := Map()
Global ComplaintOutageMap := Map()

Global NotesGui := Gui(,"Notepad"), Notes := NotesGui.Add("Edit", "h600 w685", "")
Global TemplatesGui := Gui(,"Templates"), Templates := TemplatesGui.Add("Edit", "h600 w685", "")

; Making all of the popout GUIs consistent

Notes.SetFont("s10","Nunito")
Templates.SetFont("s10","Nunito")

NotesGui.BackColor := "01711b"
TemplatesGui.BackColor := "01711b"

; The main body of the GUI itself. Dimensions and tabs etc
Global AussieGUI := Gui("+Border","Aussie Broadband Widget V1.0")
AussieGUI.BackColor := "01711b"
AussieGUI.Add("Picture", "ym+5 x+20 h70 w-1","aussieLogo.png")
AussieGUI.SetFont("s10 c000000","Nunito")
AussieGUI.Add("Text", "y+20 xm cFFFFFF" , "Customer Name:")
Global CustomerNameField := AussieGUI.Add("Edit", "yp-3 xm+105 w150 vCustomerNameValue", "").OnEvent("Change", CustomerNameEdit)
TemplateTab := AussieGUI.Add("Tab3","xm h70 w610 BackgroundWhite", ["General", "Accounts", "Faults","Order Support","Complaints","T and Cs"])
ToolsTab := AussieGUI.Add("Tab3", "WP h80 BackgroundWhite c222222 vToolsTab", ["QOL", "Automations", "Useful Links", "Options"])

iconsize := 32
hIcon := LoadPicture("TaskBarIcon.ico", "Icon1 w" iconsize " h" iconsize, &imgtype)
SendMessage(0x0080, 0, hIcon, AussieGUI)
SendMessage(0x0080, 1, hIcon, AussieGUI) 
AussieGUI.Show("x0 y0 w630")

TraySetIcon(A_ScriptDir "\TaskBarIcon.ico") 

;DO NOT REMOVE it will break stuff
Send "xxx"

;First set of tabs, for department selection to segregate templates and keep things organised. This grabs the options selected in both dropdowns and saves them into a variable to be used later.
TemplateTab.UseTab(1)
SelGeneralReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedGeneralReason Choose1", GeneralReasons)
SelGeneralReason.OnEvent('Change', SelGeneralReasonSelected)
SelGeneralTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedGeneral Choose1", GeneralTemplates
[SelGeneralReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunGeneral)

TemplateTab.UseTab(2)
SelAccountReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedAccountReason Choose1", AccountReasons)
SelAccountReason.OnEvent('Change', SelAccountReasonSelected)
SelAccountTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedAccount Choose1", AccountTemplates
[SelAccountReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunAccount)

TemplateTab.UseTab(3)
SelFaultReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedFaultReason Choose1", FaultReasons)
SelFaultReason.OnEvent('Change', SelFaultReasonSelected)
SelFaultTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedFault Choose1", FaultTemplates[SelFaultReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunFault)

TemplateTab.UseTab(4)
SelDeliveryReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedDeliveryReason Choose1", DeliveryReasons)
SelDeliveryReason.OnEvent('Change', SelDeliveryReasonSelected)
SelDeliveryTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedDelivery Choose1", DeliveryTemplates[SelDeliveryReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunDelivery)

TemplateTab.UseTab(5)
SelComplaintReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedComplaintReason Choose1", ComplaintReasons)
SelComplaintReason.OnEvent('Change', SelComplaintReasonSelected)
SelComplaintTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedComplaint Choose1", ComplaintTemplates[SelComplaintReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunComplaint)

TemplateTab.UseTab(6)
SelTCSReason := AussieGUI.AddDropDownList("w200 h100 r20 BackgroundFFFFFF vPickedTCSReason Choose1", TCSReasons)
SelTCSReason.OnEvent('Change', SelTCSReasonSelected)
SelTCSTemplate := AussieGUI.AddDropDownList("yp w200 r20 BackgroundFFFFFF vPickedTCS Choose1", TCSTemplates[SelTCSReason.Value])
GenerateFault := AussieGUI.Add("Button", "yp", "Generate").OnEvent("Click", RunTCS)


; The tools tab. Controls the bottom set of tabs and the content of them. Functions are in the FunctionsLibrary file
ToolsTab.UseTab(1)
Superlookup := AussieGUI.Add("Button","xm+15 y245 w90 vSuperlookup", "Superlookup").OnEvent("Click", ProcessSuperlookup)
AussieGUI.Add("Button", "yp w90", "Notes").OnEvent("Click", NotePad)
AussieGUI.Add("Button","yp w100", "Lock Terminal").OnEvent("Click", LockTerminal)
NotePadEmbedded := AussieGUI.Add("Edit", "yp+40 xm+10 h510 w585 vNotePadEmbedded", "")

ToolsTab.UseTab(2)
AussieGUI.Add("Button", "xm+15 y245 Section", "Ping Test").OnEvent("Click", PingTest)
AussieGUI.Add("Button", "yp", "Traceroute").OnEvent("Click", Traceroute)
AussieGUI.Add("Button", "yp", "NSLookup").OnEvent("Click", NSLookup)
AussieGUI.Add("Button", "yp", "Prorata Calc").OnEvent("Click", ProRataCalc)

ToolsTab.UseTab(3)
AussieGUI.Add("Button", "xm+15 y245 Section", "CMS").OnEvent("Click", RunCMS)
AussieGUI.Add("Button", "yp", "NBN SQ").OnEvent("Click", RunNBNSQ)
AussieGUI.Add("Button", "yp", "Complaints").OnEvent("Click", RunComplaints)

ToolsTab.UseTab(4)
Global AlwaysOnTopButton := AussieGUI.Add("Checkbox", "xm+15 y245 Section vAlwaysOnTop ").OnEvent("Click", AlwaysOnTopToggle)
AlwaysOnTopCheckBoxText := AussieGUI.Add("Text", "yp xp+20 c000000", "Always on Top")
Global ShowNotesButton := AussieGUI.Add("Checkbox", "yp x+20 vShowNotesButton").OnEvent("Click", ShowNotes)
ShowNotesButtonText := AussieGUI.Add("Text", "yp xp+20 c000000", "Show Notepad")
Global DarkmodeButton := AussieGUI.Add("Checkbox", "yp x+20 vDarkModeButton ").OnEvent("Click", Darkmode)
DarkmodeButtonText := AussieGUI.Add("Text", "yp xp+20 c000000", "Darkmode")
Global UpdateButton := AussieGUI.Add("Button", "yp-5 x+120", "Check for Updates")
UpdateButton.OnEvent("Click", UpdateWidgetCheck)
AussieGUI["NotePadEmbedded"].Visible := 0

; Customer name edit field. This is sanitised because tabs and symbols can cause output generation errors
global CustomerName := ""  
CustomerNameEdit(CustomerNameValue, *) {
    global CustomerName
    CustomerName := AussieGUI["CustomerNameValue"].Value
    global CustomerNameSanitised := Trim(CustomerName)
    IniWrite(CustomerNameSanitised, "config.ini", "Customer", "CustomerName")
    UpdateTemplates()
}

; Logic for cascading dropdowns
SelGeneralReasonSelected(*) 
{
    SelGeneralTemplate.Delete()
    SelGeneralTemplate.Add(GeneralTemplates[SelGeneralReason.value])
    SelGeneralTemplate.Choose(1)
}

SelAccountReasonSelected(*) 
{
    SelAccountTemplate.Delete()
    SelAccountTemplate.Add(AccountTemplates[SelAccountReason.value])
    SelAccountTemplate.Choose(1)
}

SelFaultReasonSelected(*) 
{
    SelFaultTemplate.Delete()
    SelFaultTemplate.Add(FaultTemplates[SelFaultReason.value])
    SelFaultTemplate.Choose(1)
}

SelDeliveryReasonSelected(*) 
{
    SelDeliveryTemplate.Delete()
    SelDeliveryTemplate.Add(DeliveryTemplates[SelDeliveryReason.value])
    SelDeliveryTemplate.Choose(1)
}

SelComplaintReasonSelected(*) 
{
    SelComplaintTemplate.Delete()
    SelComplaintTemplate.Add(ComplaintTemplates[SelComplaintReason.value])
    SelComplaintTemplate.Choose(1)
}

SelTCSReasonSelected(*) 
{
    SelTCSTemplate.Delete()
    SelTCSTemplate.Add(TCSTemplates[SelTCSReason.value])
    SelTCSTemplate.Choose(1)
}

#Include Settings.ahk
#Include Generate.ahk
#Include FunctionLibrary.ahk
