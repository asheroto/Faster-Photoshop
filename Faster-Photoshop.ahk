; Faster-Photoshop
;
; Summary:
; - Makes Photoshop appear to open instantly
;
; Version:
; - 0.1
;
; Author:
; - asheroto
;
; Project URL:
; - https://github.com/asheroto/Faster-Photoshop
;
; Description:
; - On startup, Photoshop is loaded, the window is immediately hidden, and the processes are suspended
; - Upon pressing the hotkey Ctrl+Win+Shift+P to show Photoshop, the processes are resumed, the window is shown, focused, and maximized
; - Upon pressing Alt+F4 to close the window, the window is immediately hidden, and the processes are suspended
;
; Dependencies:
; - Sysinternals PsSuspend (keep pssuspend.exe and pssuspend64.exe in the same directory as the ahk file)

#SingleInstance, Force

; Photoshop - load on startup
If(ProcessExist("Photoshop.exe") == false) {
	; Run process
	ShellRun("Photoshop.exe")

	; Hide initial screen
	WinWait, ahk_exe Photoshop.exe
	WinHide, ahk_exe Photoshop.exe

	; Hide main screen
	WinWait, ahk_class Photoshop
	Sleep, 100
	WinHide, ahk_class Photoshop
	Sleep, 500

	; Suspend processes
	ProcessSuspend(true)
}

; Photoshop - open window & resume processes - Ctrl+Win+Shift+P
^#+p::
	If(ProcessExist("Photoshop.exe")) {
		; Resume processes
		ProcessSuspend(false)

		; Wait, show, maximize window
		Sleep, 500
		WinShow, ahk_class Photoshop
		WinActivate, ahk_class Photoshop
		WinMaximize, ahk_class Photoshop
	} else {
		; Run process
		ShellRun("Photoshop.exe")
	}
return

; Photoshop - close window & suspend processes - Alt+F4
#IfWinActive ahk_class Photoshop
	!F4::
		; Minimize, hide, suspend processes
		WinMinimize
		Sleep, 100
		WinHide
		Sleep, 500
		ProcessSuspend(true)
	return
#IfWinActive

; Suspend or resume processes
ProcessSuspend(Command) {
	If(Command == true) {
		; Suspend Photoshop processes
		Run, pssuspend Photoshop,,Hide
		Run, pssuspend dynamiclinkmanager,,Hide
	} else {
		; Resume Photoshop processes
		Run, pssuspend Photoshop -r,,Hide
		Run, pssuspend dynamiclinkmanager -r,,Hide
	}
}

; Returns if process is running
ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

; Runs a command as the logged in user
ShellRun(prms*)
{
	shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")

	desktop := shellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP

	; Retrieve top-level browser object.
	if ptlb := ComObjQuery(desktop,"{4C96BE40-915C-11CF-99D3-00AA004AE837}", "{000214E2-0000-0000-C000-000000000046}")
	{
		; IShellBrowser.QueryActiveShellView -> IShellView
		if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
		{
			; Define IID_IDispatch.
			VarSetCapacity(IID_IDispatch, 16)
			NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")

			; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
			DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
				, "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)

			; Get Shell object.
			shell := ComObj(9,pdisp,1).Application

			; IShellDispatch2.ShellExecute
			shell.ShellExecute(prms*)

			ObjRelease(psv)
		}
		ObjRelease(ptlb)
	}
}