project('example', 'cpp',
    version: '0.1.0',
    default_options: ['cpp_std=c++11']
)

amazing_dep = dependency('amazing')

example = executable('example', ['example.cpp'],
    include_directories: include_directories('.'),
    dependencies: [amazing_dep],
    install: true
)
