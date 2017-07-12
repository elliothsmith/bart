function initGlobalDIO(dev)
global dio

%initialize data io object
dio = digitalio('nidaq',dev);
hline = addline(dio, 0:7, 0, 'Out');
hline2 = addline(dio, 1, 1, 'Out');

