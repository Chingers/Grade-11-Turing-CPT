
View.Set ("graphics:910,500")

%mouse var
var xmouse, ymouse, button : int

%check mouse var
var check : int := 0

%test
forward proc easy
forward proc medium
forward proc hard
forward proc choice


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
	Pic.DrawSpecial (partystart, 0, 0, picCopy, picGrowCenterToEdge, 200)
	Music.PlayFile ("airhorn.mp3")

	exit
    end if
end loop

View.Update
View.Set ("graphics:1215,600")

Music.PlayFileLoop ("gamepigeon.mp3")

Pic.Draw (background, 0, 0, picCopy)

Pic.Draw (smallredcup, 200, 360, picCopy)


%actual procedures
body proc easy

    loop

	for x : 200 .. 900


	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update


	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (10)

	end for

	for decreasing x : 900 .. 200

	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    delay (10)

	end for

    end loop

end easy

%medium
%elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
body proc medium
    loop

	for x : 200 .. 900


	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (5)

	end for

	for decreasing x : 900 .. 200

	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (5)

	end for

    end loop

end medium
%hard
%   elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
body proc hard
    loop

	for x : 200 .. 900

	    Pic.Draw (background, 0, 0, picCopy)

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (0)

	end for

	for decreasing x : 900 .. 200

	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (0)

	end for

    end loop
end hard






%first run

if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
    loop
    
	for x : 200 .. 900


	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update


	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (10)

	if (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    medium
	elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    hard

	end if

    end for

    for decreasing x : 900 .. 200

	Pic.Draw (background, 0, 0, picCopy)

	View.Update

	Pic.Draw (smallredcup, x, 360, picMerge)

	delay (10)

    if (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
	medium
    elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
	hard

    end if
end for

end loop

%medium
elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then

    loop

	for x : 200 .. 900


	    Pic.Draw (background, 0, 0, picCopy)

	    View.Update

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (5)

	if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    easy
	elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    hard

	end if


    end for
end if

    for decreasing x : 900 .. 200

	Pic.Draw (background, 0, 0, picCopy)

	View.Update

	Pic.Draw (smallredcup, x, 360, picMerge)

	View.Update

	delay (5)

    if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
	easy
    elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
	hard
    end if

end for

end loop
end if
%hard
elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then

    loop

	for x : 200 .. 900

	    Pic.Draw (background, 0, 0, picCopy)

	    Pic.Draw (smallredcup, x, 360, picMerge)

	    View.Update

	    delay (0)

	if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    easy
	elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    medium
	end if
    end for

    for decreasing x : 900 .. 200

	Pic.Draw (background, 0, 0, picCopy)

	View.Update

	Pic.Draw (smallredcup, x, 360, picMerge)

	View.Update

	delay (0)
    elsif (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
	easy
    elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
	medium
end if
    end for

end loop
end if





%checkmouse procedure

body proc choice
    loop
	mousewhere (xmouse, ymouse, button)

	%first box
	if (xmouse > 300 and xmouse < 410) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    easy

	    %blue box
	elsif (xmouse > 550 and xmouse < 660) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    medium

	    %green box
	elsif (xmouse > 800 and xmouse < 910) and (ymouse > 65 and ymouse < 170) and button = 1 then
	    hard

	end if
    end loop
end choice

choice


