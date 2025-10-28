# Noti Plugin Configuration

The Noti plugin is configured in `lua/plugins/noti.lua`.

## Keybindings

| Key          | Command              | Description                    |
|--------------|---------------------|--------------------------------|
| `<leader>nn` | `:NotiNew`          | Create a new note              |
| `<leader>nl` | `:NotiList`         | List all notes                 |
| `<leader>ns` | `:NotiSearch`       | Search notes                   |
| `<leader>nt` | `:NotiTags`         | Browse tags                    |
| `<leader>nf` | `:NotiFolders`      | Browse folders                 |
| `<leader>ng` | `:NotiGitStatus`    | Show git status                |
| `<leader>nc` | `:NotiGitCommit`    | Commit changes                 |
| `<leader>np` | `:NotiGitSync`      | Sync with remote               |

## Usage

### Creating a Note
Press `<leader>nn` or use `:NotiNew "My Note Title"`

### Browsing Notes
Press `<leader>nl` to see all notes. In the list:
- Press `Enter` on a note to open it
- Press `q` to close the list

### Searching
Press `<leader>ns` and type your search query, or use `:NotiSearch "query"`

### Tags and Folders
- Press `<leader>nt` to browse tags, then `Enter` on a tag to filter notes
- Press `<leader>nf` to browse folders, then `Enter` on a folder to see notes

### Git Operations
- `<leader>ng` - Check status
- `<leader>nc` - Commit changes
- `<leader>np` - Full sync (commit + pull + push)

## Configuration

Edit `lua/plugins/noti.lua` to customize:
- `vim.g.noti_notes_dir` - Notes directory (default: `~/notes`)
- `vim.g.noti_default_folder` - Default folder for new notes
- `vim.g.noti_default_tags` - Default tags for new notes

## Help

Type `:help noti` for complete documentation.
