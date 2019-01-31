
View.Set ("graphics:910,500")

%mouse var
var xmouse, ymouse, button : int

%check mouse var
var check : string



%picture variables
var menu := Pic.FileNew ("cuppongmenu.jpg")

var partystart := Pic.FileNew ("partystart.jpg")

var background := Pic.FileNew ("background.jpg")

var redcup := Pic.FileNew ("redcup.jpg")

var smallredcup := Pic.FileNew ("smallredcup.jpg")

var press := Pic.FileNew ("button.jpg")


%font variables
%font buttons
var buttonfont : int
buttonfont := Font.New ("Franklin Gothic:18:bold")

%animation var

%cup moving
var smallredcupx : int
smallredcupx := 550

%to the right
var right : int := 0

%to the left
var left : int := 0

%stop
var move : int := 0

%delay
var d : int := 50

%stop movement
var stop : int := 0

%dir
var direction : int := 0

%Coordinates of cup
var cupx, cupy, goingRight : int
cupx := 200
cupy := 360
goingRight := 1


% speeds

var speede, speedm, speedh, speedChosen : int

speede := 30
speedm := 15
speedh := 0
speedChosen := 0
%%MAIN MENU%%


%menu draw
Pic.Draw (menu, 0, 0, picCopy)

redcup := Pic.Scale (redcup, 100, 120)
Pic.Draw (redcup, 620, 110, picCopy)

drawfillbox (440, 110, 620, 230, black)
%drawbox (633, 115, 708, 225, red)

Font.Draw ("Click on the small", 415, 200, buttonfont, white)
Font.Draw ("cup to START", 440, 170, buttonfont, white)

%music for main menu
process playstuff
    Music.PlayFileLoop ("menumusic.mp3")
end playstuff
fork playstuff

%button to start
loop
    mousewhere (xmouse, ymouse, button)
    if (xmouse >= 633 and xmouse <= 708) and (ymouse >= 115 and ymouse <= 225) and button = 1 then

	Music.PlayFileStop
	Pic.DrawSpecial (partystart, 0, 0, picCopy, picGrowCenterToEdge, 500)
	Music.PlayFile ("airhorn.mp3")

	exit
    end if
end loop

delay (1000)

View.Update
View.Set ("graphics:1215,600")

Music.PlayFileLoop ("gamepigeon.mp3")

Pic.Draw (background, 0, 0, picCopy)

Pic.Draw (smallredcup, cupx, cupy, picCopy)



loop
    mousewhere (xmouse, ymouse, button)
    if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then

	speedChosen := 1

	%blue box
    elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then

	speedChosen := 2

	%green box
    elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then

	speedChosen := 3

    end if

    if (speedChosen > 0) then
	
	View.Set("offscreenonly")
	Pic.Draw (background, 0, 0, picCopy)


	Pic.Draw (smallredcup, cupx, cupy, picMerge)

	View.Update

	case speedChosen of

	    label 1 :
		delay (speede)
	    label 2 :
		delay (speedm)
	    label 3 :
		delay (speedh)
	end case

	if (cupx >= 900) then

	    goingRight := 0

	elsif (cupx <= 200) then

	    goingRight := 1

	end if

	if (goingRight = 1) then

	    cupx += 1
	elsif (goingRight = 0) then

	    cupx -= 1

	end if

    end if
end loop







