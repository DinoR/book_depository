format long

R = [
       
        [557 0 0 0 0 0 0 0 0 0 15 0 0 1 13 0 22 0 0]; 
        [346 9 0 0 36 0 0 0 1 14 0 4 0 3 6 0 23 135 0]; 
        [204 0 0 0 0 0 0 0 0 0 0 2 4 0 1 0 9 57 0]; 
        [4047 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
        [18 0 0 0 0 0 0 0 0 0 0 0 1 4 0 8 0 1 46];
        [318 0 0 0 0 0 0 0 0 230 0 0 0 0 0 17 3 0 0]; 
        [41 0 0 0 0 0 278 0 0 0 0 0 0 0 0 0 0 0 0];
        [5531	9	0	0	36	0	278	0	1	244	15	6	5	8	20	25	57	193	46]
        
    ];

[E, s, L] = princomp(R);
Ev = E(:,1:2);
X = R * Ev;
disp('Matrika X');
disp(X);

y = X(:,2);
x = X(:,1);

scatter(x,y,'filled');

len = size(R);
len = len(1);
for i = 1:len
	scatter([1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011],R(i,:));
end
