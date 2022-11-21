# nvim-conf

### Shortcuts
    jj         => esc
    \d         => delete buffer
    <leader>ev => edit init.lua
    <leader>w  => save
    <leader>x  => save and quit
    <leader>q  => quit
    <leader>Q  => quit all
    
  
### System Copy
    cpiw => copy word into system clipboard
    cpi' => copy inside single quotes to system clipboard
    cvi' => paste inside single quotes from system clipboard
    cP   => copy the current line directly.
    cV   => paste the content of system clipboard to the next line

### Opening GitHub
    <leader>ho => open the project's git repository page in GitHub
    <leader>hf => open the current file page in GitHub

### GitSigns
    <leader>hs => stage hunk
    <leader>hr => reset hunk
    <leader>hS => stage buffer
    <leader>hu => undo stage hunk
    <leader>hR => reset buffer
    <leader>hp => preview hunk
    <leader>hb => blame line
    <leader>hl => toggle current line blame
    <leader>hd => diff this
    <leader>ht => toggle deleted
    <leader>hq => open changes in quickfix

### Telescope
    <C-p> => find files 
    <leader>tb => buffers
    <leader>tm => marks
    <leader>tg => grep string
    <leader>tl => live grep
    <leader>tf => fuzzy find current buffer
    <leader>tc => git commits
    <leader>ti => git commits current buffer
    <leader>ts => git status
    <leader>ta => command history
    <leader>tj => jump list

    <leader>tt => treesitter
    <leader>th => Harpoon

### LSP
    <leader>gd => go to definition
    <leader>gv => open definition in vertical split
    <leader>gx => open definition in horizontal split
    <leader>gt => go to type definition
    <leader>gp => peek definition
    <leader>gi => list implementations
    <leader>gr => list references
    <leader>gf => open saga finder 
    <leader>ga => open code actions
    <leader>gr => rename
    <leader>go => toggle outline
    <leader>gk => hover doc
    <A-t>      => toggle float terminal

### Text Objects
    ih => Gitsigns select_hunk

### File Navigation
    ]h => next hunk
    [h => previous hunk

    ]d => next LSP diagnostic
    [d => previous LSP diagnostic
