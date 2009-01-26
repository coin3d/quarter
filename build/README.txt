Regarding the Visual Studio projects, they are a bit clumsily configured
currently, partly because we want all build-configuration options to be
available, but the solution/workspace is building libraries, plugins, and
applications, and they have certain inter-dependencies.

It is therefore important that you build following the following procedure:

To build debug do this:

  1) set the build configuration to "Debug (DLL)"
  2) build "quarter1"
  3) build "quarter1_install"
  4) build "quarterwidgetplugin1"
  5) build "quarterwidgetplugin1_install"
  6) set the build configuration to "Debug"
  7) build "minimal_example"
  8) launch the example (e.g. Debug->Launch New Instance in the menu)

Each component should be installed before the next one is built.

To build release, switch 1) to "Release (DLL)" and 6) to "Release".

There are no build-rules to build the example against static library
builds.
