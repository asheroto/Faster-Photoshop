# Instantly Load/Open Photoshop

![Example](https://github.com/asheroto/Faster-Photoshop/blob/master/example.gif?raw=true)

In today's gotta-have-it-fast world, waiting 5 seconds for Photoshop to load is so '90s. 🤣

Maybe it's no big deal, but hey, if we *could* make Photoshop load **instantly**, why not?

Hence the idea for **Faster-Photoshop**!

No need to wait on Photoshop to load any longer!

- **Faster-Photoshop** makes Photoshop open **instantly** when you press `Ctrl+Win+Shift+P`
- With Photoshop open, when you press the `Alt+F4` Photoshop is **instantly** closed
- Pressing `Ctrl+Win+Shift+P` again makes Photoshop open **instantly**

## How it works

#### Startup:
- At log on, **Faster-Photoshop** launches `Photoshop.exe` in the background
- It waits a few seconds and then hides the main window
- It suspends the processes `Photoshop.exe` and `dynamiclinkmanager.exe`, which ensures no resources are in use

#### To Open Photoshop:
- Press `Ctrl+Win+Shift+P`

#### To Close Photoshop
- While in Photoshop, press `Alt+F4`

#### To Actually End the Photoshop Processes
- While in Photoshop, go to File > Exit

## Installation:
- Install [AutoHotkey](https://www.autohotkey.com/) if not already installed
- Download zip file from Releases and extract
- Leave `pssuspend.exe` and `pssuspend64.exe` in the same directory as the **ahk** file
- Start > search for **Task Scheduler**, and open it
	- Go to **Action** > **Create Task**
	- Set the name to **Faster-Photoshop**
	- Check **Run with highest privileges** (this helps avoid the pssuspend window flash)
	- Under the **Triggers** tab, create a new one **At log on** of **specific user** (your user account)
	- Under the **Actions** tab, create a new one to **Start Program** and specify the path to the **ahk** file
	- Under the **Settings** tab, *uncheck* the option **Stop the task if it runs longer than**
	- Click **OK**