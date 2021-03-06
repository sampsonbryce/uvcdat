import os, sys, MV2, numpy, vcs, cdms2, testing.regression as regression

pth0 = os.path.dirname(__file__)
f = cdms2.open(os.path.join(pth0,"celine.nc"))
s = f("data")
x = regression.init()
x.scriptrun(os.path.join(pth0,"celine.json"))
i = x.getisofill("celine")
b = vcs.createboxfill()
b.levels=i.levels
b.fillareacolors=i.fillareacolors
b.boxfill_type="custom"
x.plot(s,b,bg=1)
fnm = "test_celine_iso_2.png"
regression.run(x, fnm)