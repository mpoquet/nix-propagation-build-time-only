project('amazing', 'cpp',
    version: '0.1.0',
    default_options: ['cpp_std=c++11']
)

nlohmann_json_dep = dependency('nlohmann_json')

amazing_shared = shared_library('amazing',
    ['amazing.cpp', 'amazing.hpp'],
    include_directories: [include_directories('.')],
    dependencies: [nlohmann_json_dep],
    install: true, install_dir: 'lib'
)

install_headers('amazing.hpp', subdir: 'amazing')

# Generate a pkg-config file for the library.
pkgc = import('pkgconfig')
pkgc.generate(name: 'amazing',
    libraries: amazing_shared,
    version: meson.project_version(),
    requires: 'nlohmann_json>=3.9.1',
    description: 'An example library to test Nix input propagation.'
)
