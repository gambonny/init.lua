<img width="1432" alt="screenshot" src="https://user-images.githubusercontent.com/88061915/203118003-a8c1623a-4021-42fb-8e63-3def9d9d6cd8.png">

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
    <leader>to => command history
    <leader>tj => jump list

    <leader>tt => treesitter
    <leader>th => harpoon
    <leader>ta => adjacent

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
    <leader>gn => rename
    <leader>go => toggle outline
    <leader>gk => hover doc
    <A-t>      => toggle float terminal    
    
### Neotest Jest
    <leader>t1 => run the current file
    <leader>t2 => run the nearest test
    <leader>t3 => displays test suite structure from project root
    <leader>t4 => display tests output
    <leader>t5 => stop the nearest test

### Harpoon
    <leader>aa => add file
    <leader>ar => remove file
    <leader>ac => clear all

#### Leaps
    s  => Initiate search in the forward
    S  => Initiate search in the backward
    gs => Initiate search in other windows
    
#### Comments
    gcc        => comment/uncomment current line
    gc{motion} => comment/uncomment selection defined by a motion
    
#### Surrounding pairs
    ys{motion}{char}        => add
    ds{char}                => delete
    cs{target}{replacement} => change

#### Smart splits
    <A-y> => resize left
    <A-u> => resize down
    <A-i> => resize up
    <A-o> => resize right

    <A-h> => move cursor left
    <A-j> => move cursor down
    <A-k> => move cursor up
    <A-l> => move cursor right

#### Marks
    mx        => set mark x
    m,        => set the next available alphabetical (lowercase) mark
    m;        => toggle the next available mark at the current line
    dmx       => delete mark x
    dm-       => delete all marks on the current line
    dm<space> => delete all marks in the current buffer
    m<        => fill quickfix with all marks in the current buffer
    m>        => fill quickfix with all global marks in open buffers
    m_        => fill quickfix with all marks in all open buffers
    
#### Panels
    <A-z>     => toggle zen mode
    <leader>z => toggle maximize
    <leader>of => toggle neo-tree file tree
    <leader>ob => toggle neo-tree buffers tree
    <leader>oh => toggle neo-tree git status tree

### Text Objects
    ih => hunk
    af => outer function
    if => inner function
    at => outer parameter
    it => inner parameter

### Navigation
    ]b => next buffer
    [b => previous buffer
    
    ]q => next quickfix result
    [q => previous quickfix result

    ]h => next hunk
    [h => previous hunk

    ]d => next LSP diagnostic
    [d => previous LSP diagnostic
    
    ]a => next Harpoon file
    [a => previous Harpoon file
    
    m] => move to next mark
    m[ => move to previous mark
    
    ]j => jump to next buffer
    [j => jump to previous buffer
