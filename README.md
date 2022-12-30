
# Instantly Load/Open Photoshop

![Example](https://github.com/asheroto/Faster-Photoshop/blob/master/Demo.gif?raw=true)

In today's gotta-have-it-fast world, waiting 5-10 seconds for Photoshop to load is so '90s. 🤣

Maybe it's no big deal, but hey, if we *could* make Photoshop load **instantly**, why not?

Hence the idea for **Faster-Photoshop**!

No need to wait on Photoshop to load any longer!

- **Faster-Photoshop** makes Photoshop open **instantly** when you press `Ctrl+Win+Shift+P`
- With Photoshop open, when you press the `Alt+F4` Photoshop is **instantly** closed
- Pressing `Ctrl+Win+Shift+P` again makes Photoshop open **instantly**

## How it works

#### Startup
- At log on, **Faster-Photoshop** launches `Photoshop.exe` in the background
- It waits a second and then hides the main window
- It suspends the processes `Photoshop.exe` and `dynamiclinkmanager.exe` which ensures no resources are in use

#### To Open Photoshop
- Press `Ctrl+Win+Shift+P`

#### To Close Photoshop
- While in Photoshop, press `Alt+F4`

#### To Actually End the Photoshop Processes
- While in Photoshop, go to File > Exit

## Installation

### Compiled/EXE version (AutoHotkey install not required)
- [Download the zip file](https://github.com/asheroto/Faster-Photoshop/releases/latest/download/Faster-Photoshop_Compiled.zip) from [Releases](https://github.com/asheroto/Faster-Photoshop/releases) and extract files
- Leave `pssuspend.exe` and `pssuspend64.exe` in the same directory as `Faster-Photoshop.exe`
- Start > search for **Task Scheduler**, and open it
	- Go to **Action** > **Create Task**
	- Set the name to **Faster-Photoshop**
	- Optional: *Check* **Run with highest privileges** to help hide the Photoshop splash screen faster when loading (Photoshop will still run as local user account)
	- Under the **Triggers** tab, create a new one **At log on** of **specific user** (your user account)
	- Under the **Actions** tab, create a new one to **Start Program** and specify the path to `Faster-Photoshop.exe`
	- Under the **Settings** tab, *uncheck* the option **Stop the task if it runs longer than**
	- Click **OK**

### Source/AHK version (AutoHotkey install required)
- Install [AutoHotkey](https://www.autohotkey.com/) if not already installed
- [Download the zip file](https://github.com/asheroto/Faster-Photoshop/releases/latest/download/Faster-Photoshop.zip) from [Releases](https://github.com/asheroto/Faster-Photoshop/releases) and extract files
- Leave `pssuspend.exe` and `pssuspend64.exe` in the same directory as `Faster-Photoshop.ahk`
- Start > search for **Task Scheduler**, and open it
	- Go to **Action** > **Create Task**
	- Set the name to **Faster-Photoshop**
	- Optional: *Check* **Run with highest privileges** to help hide the Photoshop splash screen faster when loading (Photoshop will still run as local user account)
	- Under the **Triggers** tab, create a new one **At log on** of **specific user** (your user account)
	- Under the **Actions** tab, create a new one to **Start Program** and specify the path to `Faster-Photoshop.ahk`
	- Under the **Settings** tab, *uncheck* the option **Stop the task if it runs longer than**
	- Click **OK**