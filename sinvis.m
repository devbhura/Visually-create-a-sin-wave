%{

------------------------------
Date: 11/2/2017

Version 1: The function takes in one input and displays an animated sine
function with a circle, a point, a horizontal and a radial line. 
Status: Works
%}

function sinvis(per)

%Checks if per is scalar
if isscalar(per)==0
    
    %Displays the error
    error('Input must be scalar');
    %exits the function
    return;

%Checks if per is positive
elseif per<=0 
    
    %Displays the error
    error('Input must be positive');
    %exits the function
    return;
    
%Checks if per is integer
elseif rem(per,1)~=0 
    
    %Displays the error
    error('Input must be an integer');
    
    %exits the function
    return;

else
    
end

%Creates a variable named angle which has 1000 values between 0 to 2pi
angle=linspace(0,2*pi,1000);

%Calculates the cosine of all values of angle for x coordinatesx=cos(angle);
x=cos(angle);
%Calculates the sine of all values of angle for y coordinates
y=sin(angle);

%Sets the handle for plotting the circle
plotcircle=plot(x,y);

%Calls the function to draw the plot
drawnow

%Holds on to the function above
hold on

%Range has all vales between 0 and the input period times 2pi
range=linspace(0,2*pi*per,1000*per);

%Calculates the sine for range for sine plotting
sineval=sin(range);

%Sets the handle for plotting the sine function 
plotsine=plot(range,sineval);
drawnow
hold on

%The initial coordinates of radial line is stored
radiallinex=[0 range(1)];
radialliney=[0 sineval(1)];

%Sets the handle for plotting the radial line
plotradial=plot(radiallinex,radialliney);
drawnow
hold on

%The initial coordinates of horizontal line is stored
horizontallinex=[0 range(1)];
horizontalliney=[sineval(1) sineval(1)];

%Sets the handle for plotting the horizontal line
plothorizontal=plot(horizontallinex,horizontalliney);
drawnow
hold on

%Sets the handle for plotting the point
plotpoint=plot(0,sineval(1),'*');
drawnow
hold on

%Sets the axis dimensions
axis([-2 2 -2 2]);

%For loop for animation
for i=1:length(range)
    
    
    %Adds the range value to original x value of circle so that the circle
    %moves in the figre
    for j=1:length(x)
        
        circx(1,j)=x(1,j)+range(i);
        
    end
    
    %Calls the plothandle for circle 
    set(plotcircle,'Xdata',circx)
    set(plotcircle,'Ydata',y)
    
    %Changes the coordinates of the sine function
    sinex=range(1:i);
    siney=sineval(1:i);
    
    %Calls the plothandle for sine function
    set(plotsine,'Xdata',sinex)
    set(plotsine,'Ydata',siney)
    
    %Changes the coordinates of the radial line
    radiallinex=[(0+range(i)) (range(i)+x(i))];
    radialliney=[(0) sineval(i)];
    
    %Calls the plothandle for radial line
    set(plotradial,'Xdata',radiallinex)
    set(plotradial,'Ydata',radialliney)
    
    %Changes the coordinates of the horizontal line
    horizontallinex=[range(i) (range(i)+x(i))];
    horizontalliney=[sineval(i) sineval(i)];
    
    %Calls the plothandle for horizontal line
    set(plothorizontal,'Xdata',horizontallinex)
    set(plothorizontal,'Ydata',horizontalliney)
    
    %Calls the plothandle for point
    set(plotpoint,'Xdata',range(i));
    set(plotpoint,'Ydata',sineval(i));
    
    %Resets the axis dimensions at every iteraton
    axis([(-2+range(i)) (2+range(i)) -2 2]);
    
    drawnow;
    
end


hold off

end
