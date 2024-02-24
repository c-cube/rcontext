
# Rcontext

[![Build and Test](https://github.com/c-cube/rcontext/actions/workflows/main.yml/badge.svg)](https://github.com/c-cube/rcontext/actions/workflows/main.yml)

[documentation](https://c-cube.github.io/rcontext/)

Rcontext is a immutable context to carry around in the processing of a
network request, or any other asynchronous task. It can carry around
cross-cutting concerns such as deadlines, tracing information, timing
information, debugging tags, etc.

At its core, a `Rcontext.t` is a wrapper around [hmap](https://github.com/dbuenzli/hmap),
alongside a set of standard hmap **keys**.
Each key provides access to some specific information (deadline, timing information, etc.)

The hope is that this can be a lightweight dependency for projects that
need to carry this kind of information around, and to help standardize _keys_.
[Rcontext] relies on
[dune's alternative dependencies](https://dune.readthedocs.io/en/stable/reference/library-dependencies.html#alternative-dependencies)
to use optional dependencies for standard keys, instead of hard dependencies.

## License

MIT
