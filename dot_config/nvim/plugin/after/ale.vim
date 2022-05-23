"ALE Settings
let g:ale_linters = {
\	'python':['flake8', 'bandit', 'mypy'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\   'html': ['prettier'],
\   'c': ['uncrustify'],
\   'css': ['prettier'],
\   'cpp': ['uncrustify'],
\   'fortran': ['remove_trailing_lines', 'trim_whitespace'],
\   'java': ['uncrustify'],
\   'javascript': ['prettier'],
\   'json': ['prettier']
\}

