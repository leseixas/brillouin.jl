#JulieTest config file
  
include(Pkg.dir("JulieTest/src/watch.jl"))

# Configure the watcher

watch = ["src", "test"]
interval = 0.25 # in seconds

# Configure the test runner

# reporter = "dot"
reporter = "spec"

# start JulieTest
julieTest()
