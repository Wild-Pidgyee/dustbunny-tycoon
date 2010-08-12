% TFsym()  -	A MATLAB based application written for Automatic Control System 8th edition
% by Kuo and Golnaraghi, Published by John Wiley and Sons, All rights reserved.
% This toolbox is used for preliminary
% control system analyses using the symbolic toolbox.
%
% � Farid Golnaraghi 2002
% University of Waterloo and The MechWorks Software Inc., Waterloo, Ont., Canada
% Version 2002 - First Trial
% Last Modified: 02/10/2002
%=============================================================
clear all

MWKSMENU= figure('Units','Normal','Position',[0.3 0.55 0.6 0.25],...
	'Name','Transfer Function Symbolic � 2001&2002 Farid Golnaraghi and Benjamin Kuo',...
   'color',0.8*[.9 .9 1],'NumberTitle','off','Menubar','None');

uicontrol('Units','Normal','Position',[0.1 15/18 0.80 2/18],'Style','PushButton',...
   'String','Help for 1st Time User','fontsize',10,'FontWeight','Demi','Callback','helpdlg('' You must have access to MATLAB Symbolic Toolbox. To run Programs, go to MATLAB Command window after clicking each pushbutton.''),');

uicontrol('Units','Normal','Position',[0.1 11/18 0.80 3/18],'Style','PushButton',...
   'String','Transfer Function and Inverse Laplace','fontsize',10,'FontWeight','Demi','Callback',[,...
        'disp('' Transfer Function Symbolic. � Kuo & Golnaraghi 8th edition, John Wiley''),',...
        'disp('' e.g. Use the following input format: (s+2)*(s^3+2*s+1)/(s*(s^2+2*s+1))''),',...
        'eval(TFsingle)']);
uicontrol('Units','Normal','Position',[0.1 7/18 0.80 3/18],'Style','PushButton',...
   'String','State-Space','fontsize',10,'FontWeight','Demi','Callback',[,...
        'disp(''State-Space Symbolic. � Kuo & Golnaraghi 8th edition, John Wiley''),',...
        'disp(''Enter the Coefficient Matrices (empty matrices will give error)''),',...
        'disp(''E.g. For a 2x2 identity matrix type in:  [1  0; 0 1]''),',...
        'disp('' [1 ; 0 ; 1]  is a 3x1 column vector &  [1 0 0]  is a 1x3 row vector''),',...
        'eval(TFss)']);
uicontrol('Units','Normal','Position',[0.1 4/18 0.80 3/18],'Style','PushButton',...
   'String','State-Space with Init. Cond.','fontsize',10,'FontWeight','Demi','Callback',[,...
        'disp(''State-Space Symbolic. � Kuo & Golnaraghi 8th edition, John Wiley''),',...
        'disp(''Enter the Coefficient Matrices (empty matrices will give error)''),',...
        'disp(''E.g. For a 2x2 identity matrix type in:  [1  0; 0 1]''),',...
        'disp('' [1 ; 0 ; 1]  is a 3x1 column vector &  [1 0 0]  is a 1x3 row vector''),',...
        'eval(TFsswic)']);

uicontrol('Units','Normal','Position',[0.1 1/20 0.80 1/9],'Style','PushButton',...
   'String','Close and Exit','fontsize',10,'FontWeight','Demi','Callback','close(gcf)')

TFsingle=[,...
        'syms s,',...
        'disp(''  ''),',...
        'clear Gsym; Gsym=input('' Enter G = '');',...
        'pretty(Gsym),',...
        '[NUMGsym,DENGsym]=numden(Gsym);NUMG=sym2poly(NUMGsym);DENG=sym2poly(DENGsym);',...
        'disp('' G in polynomial form: ''),G=tf(NUMG,DENG),',...
        'disp('' G factored:''),zpk(G),disp('' Inverse Laplace Transform:''),Gtime=ilaplace(Gsym),'];
TFss=[,...
        'syms s,',...
        'disp(''  ''),',...
        'clear Asym; Asym=input('' Enter A = ''),',...
        'if isempty(Asym)==1,Asym=input('' Enter A = ''),end,',...
        '[nrowA,ncolA]=size(Asym);if nrowA~=ncolA,disp('' error: A is not a square matrix''),else,',...
        'SIA=s*eye(nrowA)-Asym;disp(''Determinant of (s*I-A) is: ''),detSIA=det(SIA),',...
        'disp('' the eigen values of A are: ''),eigA=eval(solve(detSIA)),',...
        'disp('' Inverse of (s*I-A) is: ''),SIAinv=inv(SIA); pretty(SIAinv),',...
        'disp('' State transition matrix (phi) of A: ''),SIAtime=ilaplace(SIAinv);phi=SIAtime;pretty(phi),',...
        'clear Bsym; Bsym=input('' Enter B = ''),',...
        'if isempty(Bsym)==1,Bsym=input('' Enter B = ''),end,',...
        'clear Csym; Csym=input('' Enter C = ''),',...
        'if isempty(Csym)==1,Csym=input('' Enter C = ''),end,',...
        'clear Dsym; Dsym=input('' Enter D = ''),',...
        'if isempty(Dsym)==1,Dsym=input('' Enter D = ''),end,',...
        'disp('' Transfer function between u(t)and y(t) is: ''),Gr=Csym*SIAinv*Bsym;pretty(simplify(Gr)),',...
        'clear U;U=input('' Enter the input U(s): ''),',...
        'if isempty(U)== 0,',...
        'disp('' States (X) in Laplace Domain: ''),X=factor(SIAinv*(Bsym*U));pretty(simplify(X)),',...
        'disp('' Inverse Laplace x(t): ''),x=ilaplace(X); pretty(x),',...
        'disp('' Output Y(s) (with initial conditions): ''),Y=Csym*X;pretty(simplify(Y)),',...
        'disp('' Inverse Laplace y(t): ''),y=ilaplace(Y);pretty(y),',...
        'else, disp('' Empty set... end program''),',...
        'end,end,',...
  ];

TFsswic=[,...
        'syms s,',...
        'disp(''  ''),',...
        'clear Asym; Asym=input('' Enter A = ''),',...
        'if isempty(Asym)==1,Asym=input('' Enter A = ''),end,',...
        '[nrowA,ncolA]=size(Asym);if nrowA~=ncolA,disp('' error: A is not a square matrix''),else,',...
        'SIA=s*eye(nrowA)-Asym;disp(''Determinant of (s*I-A) is: ''),detSIA=det(SIA),',...
        'disp('' the eigen values of A are: ''),eigA=eval(solve(detSIA)),',...
        'disp('' Inverse of (s*I-A) is: ''),SIAinv=inv(SIA); pretty(SIAinv),',...
        'disp('' State transition matrix (phi) of A: ''),SIAtime=ilaplace(SIAinv);phi=SIAtime;pretty(phi),',...
        'clear Bsym; Bsym=input('' Enter B = ''),',...
        'if isempty(Bsym)==1,Bsym=input('' Enter B = ''),end,',...
        'clear Csym; Csym=input('' Enter C = ''),',...
        'if isempty(Csym)==1,Csym=input('' Enter C = ''),end,',...
        'clear Dsym; Dsym=input('' Enter D = ''),',...
        'if isempty(Dsym)==1,Dsym=input('' Enter D = ''),end,',...
        'disp('' Transfer function between u(t)and y(t) is: ''),Gr=Csym*SIAinv*Bsym;pretty(simplify(Gr)),',...
        'clear ICvect; ICvect=input('' Enter the initial condition vector x(0): ''),',...
        'if isempty(ICvect)== 0,',...
        'clear U;U=input('' Enter the input U(s): ''),',...
        'disp('' States (X) in Laplace Domain: ''),X=factor(SIAinv*(ICvect+Bsym*U));pretty(simplify(X)),',...
        'disp('' Inverse Laplace x(t): ''),x=ilaplace(X);pretty(x),',...
        'disp('' Output Y(s) (with initial conditions): ''),Y=Csym*X+Dsym*U;pretty(simplify(Y)),',...
        'disp('' Inverse Laplace y(t): ''),y=ilaplace(Y);pretty(y),',...
        'else, disp('' Empty set... end program''),',...
        'end,end,',...
  ];