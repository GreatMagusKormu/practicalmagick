[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("THIS TOOL WILL MAKE COPIES OF
UP TO THREE IMAGES AND PUT THEM IN A HORIZONTAL COLLAGE.
THIS TOOL RUNS OFF THE IMAGE MAGICK TOOLSET AND
IS PRIMARILY INTENDED FOR USE WITH RAINMETER.
DO YOU AGREE TO PROCEED WITH CARE AND CAUTION?
PRESS OK FOR YES AND CANCEL FOR NO.",0,"Done",0x4) | % {if  ($_ -ne "6") {exit}}

$wd = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter your working directory
formatted like this: D:\Downloads_old\.
The path you enter here should be where your source files are located
and where the destination file will reside. If you will be using source files from multiple
locations or wish to output your end result to a different folder please cancel this window.", "Working Directory", "D:\Pictures\Icons\")

$up = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter a file/image name
formatted like this: output.png (essentially filename.fileextension).
The filename you enter here should be the
destination file where the inactive/up state image of the button meter resides.", "Up Image Location", "Up.png")

$down = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter a file/image name
formatted like this: output.png (essentially filename.fileextension).
The filename you enter here should be the
destination file where the down/left moust button pressed state image of the button meter resides.", "Down Image Location", "Down.png")

$hover = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter a file/image name
formatted like this: output.png (essentially filename.fileextension).
The filename you enter here should be the
destination file where the mouse over/hover state image of the button meter resides.", "Hover Image Location", "Hover.png")

$output = [Microsoft.VisualBasic.Interaction]::InputBox("Please enter a file/image name
formatted like this: output.png (essentially filename.fileextension).
The filename you enter here should be the
destination file where all three images will reside.", "Output Image Destination", "output.png")

cd $wd

& magick $up $down $hover "+append" $output