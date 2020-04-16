# zedo-shim

When I'm programming, I often need a better build system.
However, the system I have in mind---`zedo`, a variant of djb's `redo`---isn't widely installed.
This shim should make it easier for users and contributors to use my `zedo`-based build systems
    without having to build and install _yet another thing_ first.

The (so far untested) idea is to include this repository as a git submodule.
Then, the user/contributor need only update the submodule and put `zedo-shim/bin` on their path.
Then the uild system will work (though sub-optimally).


## Random Notes

Actually, I haven't built a real `zedo` that works.
However, that seems to be because I keep using partially-built versions in "production" environments as a test.
When I get frustrated with my progress on the "test" project because of inadequacies in `zedo`, I move to a different project and no longer have a testbed for `zedo`.

I'm hoping this shim will allow me to work on whatever project I want without too many build-system annoyances.
Then, I'll be able to put in incremental improvements to `zedo` and immediately test them on any of my projects.

Meanwhile, I'll also have to keep this shim up-to-date with new configuration, flags, commands, and what-not.
Since I don't want to do much of that in shell, I should be motivated to keep the zedo interface _very_ small.

Further, relative performance metrics should give me a better idea of how much overhead the "smart" features of true `zedo` introduces.
Admittedly, there'll be some overhead even here, what with build sub-scripts always being invoked indirectly through `zedo`.
The idea though is that incremental builds will then save a lot of time.
