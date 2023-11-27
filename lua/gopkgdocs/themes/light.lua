--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush                             = require('lush')
local hsl                              = lush.hsl

-- colors
local primary                          = hsl(201, 100, 70)  -- #38B9FF
local primary_variant                  = primary.abs_da(40) -- #00659B
local primary_light                    = hsl(201, 37, 90)   -- #DAE7EE

local complementary_to_primary_variant = hsl(21, 100, 77)   -- #9B3600

local background                       = hsl(0, 0, 90)
local foreground                       = hsl(0, 0, 10)
local darktxt_on_background            = hsl(0, 0, 61)

-- local overlay                          = hsl(210, 6, 34)    -- #484C51
local overlay                          = background.abs_li(14) -- #484C51
local overlay2                         = hsl(210, 6, 45)       -- #53585E
local overlay_text                     = hsl(0, 0, 100)
local green_on_overlay                 = hsl(122, 74, 50)
local green_on_overlay2                = green_on_overlay.abs_li(11)
local primary_on_overlay               = primary.abs_li(10)

local blue_below_primary               = primary_variant
local green                            = hsl(122, 75, 50) -- #20DF26
local blue                             = hsl(201, 88, 61)

local darktxt_on_primary               = hsl(0, 0, 19)

local bg_for_primarytxt                = hsl(207, 97, 13)
local darktxt_on_green                 = hsl(0, 0, 19)


---@diagnostic disable: undefined-global
local spec = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        Elevation { fg = overlay_text, bg = overlay },
        SecondElevation = { fg = overlay_text, bg = overlay2 },

        String { fg = complementary_to_primary_variant },            --   A string constant: "this is a string"
        Normal { fg = foreground, bg = background },                 -- Normal text
        ColorColumn { bg = primary_variant, fg = overlay_text },     -- Columns set with 'colorcolumn'
        Conceal { bg = darktxt_on_background, fg = hsl(32, 0, 12) }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Title { fg = primary },                                      -- Titles for output from ":set all", ":autocmd" etc.
        Cursor { fg = overlay_text, bg = overlay },                  -- Character under the cursor
        CurSearch { bg = primary_variant },                          -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        CursorColumn { Elevation },                                         -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine { Elevation },                                           -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory { fg = foreground },                                      -- Directory names (and other special names in listings)
        DiffChange { fg = primary_on_overlay },                             -- Diff mode: Changed line |diff.txt|
        DiffAdd { bg = bg_for_primarytxt, fg = primary },                   -- Diff mode: Added line |diff.txt|
        DiffDelete { fg = hsl(351, 100, 60) },                              -- Diff mode: Deleted line |diff.txt|
        DiffText { bg = green, fg = darktxt_on_green },                     -- Diff mode: Changed text within a changed line |diff.txt|
        EndOfBuffer { fg = darktxt_on_background.da(15) },                  -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor { bg = green, fg = darktxt_on_green },                   -- Cursor in a focused terminal
        TermCursorNC { bg = TermCursor.bg.abs_da(10), fg = TermCursor.fg }, -- Cursor in an unfocused terminal
        ErrorMsg { bg = hsl(351, 69, 30) },                                 -- Error messages on the command line
        -- VertSplit      { }, -- Column separating vertically split windows
        Folded { Elevation },                                               -- Line used for closed folds
        FoldColumn { Elevation },                                           -- 'foldcolumn'
        SignColumn { Elevation },                                           -- Column where |signs| are displayed
        -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute { DiffText },                                            -- |:substitute| replacement text highlighting
        LineNr { fg = darktxt_on_background, bg = background },             -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove { LineNr },                                             -- Line number for when the 'relativenumber' option is set, above the cursor line
        LineNrBelow { LineNr },                                             -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr { fg = primary_light },                                -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen { bg = overlay2 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, b`msgsep` flag of 'display'
        MoreMsg { fg = foreground, bold = true }, -- |more-prompt|
        NonText { fg = primary },                 -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        NormalFloat { Elevation },                -- Normal text in floating windows.
        FloatBorder { fg = overlay },             -- Border of floating windows.
        -- FloatTitle     { }, -- Title of floating windows.
        -- NormalNC {  },    -- normal text in non-current windows
        Pmenu { fg = foreground.da(30), bg = overlay },       -- Popup menu: Normal item.
        PmenuSel { fg = overlay_text, bg = primary_variant }, -- Popup menu: Selected item.
        PmenuKind { Pmenu },                                  -- Popup menu: Normal item "kind"
        PmenuKindSel { PmenuSel },                            -- Popup menu: Selected item "kind"
        PmenuExtra { Pmenu },                                 -- Popup menu: Normal item "extra text"
        PmenuExtraSel { PmenuSel },                           -- Popup menu: Selected item "extra text"
        PmenuSbar { fg = overlay_text, bg = overlay2 },       -- Popup menu: Scrollbar.
        PmenuThumb { bg = Normal.fg, fg = hsl(32, 0, 12) },   -- Popup menu: Thumb of the scrollbar.
        -- Question       { }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine { DiffText },                            -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search { DiffText },                                  -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SpecialKey { fg = primary },                          -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        -- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine { fg = foreground, bg = primary_variant },      -- Status line of current window
        StatusLineNC { bg = primary_variant, fg = hsl(0, 0, 83) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine { bg = overlay },                                  -- Tab pages line, not active tab page label
        TabLineFill { bg = green, fg = darktxt_on_green },         -- Tab pages line, where there are no labels
        -- TabLineSel     { }, -- Tab pages line, active tab page label
        Visual { bg = overlay.da(20), fg = overlay_text },         -- Visual mode selection
        -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg { fg = hsl(351, 100, 60) },                     -- Warning messages
        Whitespace { fg = darktxt_on_background },                 -- "nbsp", "space", "tab" and "trail" in 'listchars'
        Winseparator { fg = overlay },                             -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu { DiffText },                                     -- Current match in 'wildmenu' completion
        WinBar { fg = foreground, bold = true },                   -- Window bar of current window
        WinBarNC { fg = darktxt_on_background, bold = true },      -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.



        Comment { fg = green },                            -- Any comment

        Constant { fg = primary },                         -- (*) Any constant
        Character { fg = hsl(201, 100, 90) },              --   A character constant: 'c', '\n'
        Number { Character },                              --   A number constant: 234, 0xff
        Boolean { fg = primary },                          --   A boolean constant: TRUE, false
        Float { Character },                               --   A floating point constant: 2.3e10

        Identifier { fg = foreground },                    -- (*) Any variable name
        Function { fg = primary },                         --   Function name (also: methods for classes)

        Statement { fg = primary },                        -- (*) Any statement
        Conditional { fg = primary },                      --   if, then, else, endif, switch, etc.
        Repeat { fg = primary },                           --   for, do, while, etc.
        Label { fg = primary },                            --   case, default, etc.
        Operator { fg = foreground },                      --   "sizeof", "+", "*", etc.
        Keyword { fg = primary },                          --   any other keyword
        Exception { fg = primary },                        --   try, catch, throw

        PreProc { fg = primary },                          -- (*) Generic Preprocessor
        Include { PreProc },                               --   Preprocessor #include
        Define { PreProc },                                --   Preprocessor #define
        Macro { PreProc },                                 --   Same as Define
        PreCondit { PreProc },                             --   Preprocessor #if, #else, #endif, etc.

        Type { fg = primary },                             -- (*) int, long, char, etc.
        StorageClass { fg = primary },                     --   static, register, volatile, etc.
        Structure { fg = primary },                        --   struct, union, enum, etc.
        Typedef { fg = primary },                          --   A typedef

        Special { fg = primary },                          -- (*) Any special symbol
        SpecialChar { fg = primary },                      --   Special character in a constant
        Tag { fg = primary },                              --   You can use CTRL-] on this
        Delimiter { fg = foreground },                     --   Character that needs attention
        SpecialComment { fg = green_on_overlay2 },         --   Special things inside a comment (e.g. '\n')
        Debug { fg = primary },                            --   Debugging statements

        Underlined { fg = PreProc.fg, gui = "underline" }, -- Text that stands out, HTML links
        Ignore { fg = foreground.da(60) },                 -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error { WarningMsg },                              -- Any erroneous construct
        Todo { fg = green, bg = hsl(125, 29, 20).sa(40) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
        -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
        -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
        -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
        -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
        -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
        -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
        -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
        -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
        -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        sym "@text.literal" { Comment },      -- Comment
        sym "@text.reference" { Identifier }, -- Identifier
        sym "@text.title" { Title },          -- Title
        -- sym"@text.uri"          { }, -- Underlined
        -- sym"@text.underline"    { }, -- Underlined
        sym "@text.todo" { Todo },              -- Todo
        sym "@comment" { Comment },             -- Comment
        sym "@punctuation" { fg = foreground }, -- Delimiter
        sym "@constant" { Constant },           -- Constant
        sym "@constant.builtin" { Constant },   -- Special
        sym "@constant.macro" { Constant },     -- Define
        sym "@define" { fg = primary },         -- Define
        sym "@macro" { fg = primary },          -- Macro
        sym "@string" { String },               -- String
        -- sym"@string.escape"     { }, -- SpecialChar
        -- sym"@string.special"    { }, -- SpecialChar
        sym "@character" { Character },             -- Character
        sym "@character.special" { Character },     -- SpecialChar
        sym "@number" { Character },                -- Number
        sym "@boolean" { fg = primary },            -- Boolean
        sym "@float" { Character },                 -- Float
        sym "@function" { fg = primary },           -- Function
        sym "@function.builtin" { fg = primary },   -- Special
        sym "@function.macro" { fg = primary },     -- Macro
        sym "@function.call" { fg = foreground },
        sym "@parameter" { fg = foreground },       -- Identifier
        sym "@method" { fg = foreground },          -- Function
        sym "@field" { fg = foreground },           -- Identifier
        sym "@property" { fg = foreground },        -- Identifier
        sym "@constructor" { fg = primary },        -- Special
        sym "@conditional" { fg = primary },        -- Conditional
        sym "@repeat" { fg = primary },             -- Repeat
        sym "@label" { fg = primary },              -- Label
        sym "@operator" { fg = foreground },        -- Operator
        sym "@keyword" { fg = primary },            -- Keyword
        sym "@exception" { fg = primary },          -- Exception
        sym "@variable" { fg = foreground },        -- Identifier
        sym "@type" { fg = foreground },            -- Type
        sym "@type.definition" { fg = foreground }, -- Typedef
        sym "@type.builtin" { fg = primary },
        -- sym"@storageclass"      { }, -- StorageClass
        -- sym"@structure"         { }, -- Structure
        sym "@namespace" { fg = primary_light }, -- Identifier
        sym "@include" { fg = primary },         -- Include
        sym "@preproc" { fg = primary },         -- PreProc
        -- sym"@debug"             { }, -- Debug
        -- sym"@tag"               { }, -- Tag
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return spec
