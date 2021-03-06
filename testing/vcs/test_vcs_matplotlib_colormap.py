import os, sys, cdms2, vcs, testing.regression as regression

# Load the clt data:
dataFile = cdms2.open(os.path.join(vcs.sample_data, "clt.nc"))
clt = dataFile("clt")
clt = clt(latitude=(-90.0, 90.0), longitude=(-180., 175.), squeeze=1,
          time=('1979-1-1 0:0:0.0', '1988-12-1 0:0:0.0'))

# Initialize canvas:
canvas = regression.init()
canvas.setcolormap(vcs.matplotlib2vcs("viridis"))
canvas.plot(clt, bg=1)
regression.run(canvas, "test_matplotlib_colormap.png")