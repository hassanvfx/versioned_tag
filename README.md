# Git Versioned Tag Script

This bash script, `versioned_tag.sh`, assists in creating the next git tag version, adhering to the semantic versioning pattern (major.minor.patch).

# Preview

<img width="571" alt="image" src="https://github.com/hassanvfx/versioned_tag/assets/425926/8b9f0614-cb61-4223-9fbf-4299169ba12a">

## Prerequisites

- You should have `git` installed.

## Installation

To clone and install the script for global access:

BASH
```
git clone https://github.com/hassanvfx/versioned_tag.git && cd versioned_tag && chmod +x versioned_tag.sh && echo "export PATH=\$PATH:$(pwd)" >> ~/.bash_profile && source ~/.bash_profile
```

ZSH
```
git clone https://github.com/hassanvfx/versioned_tag.git && cd versioned_tag && chmod +x versioned_tag.sh && echo "export PATH=\$PATH:$(pwd)" >> ~/.zshrc && source ~/.zshrc
```

## Usage

Once you've installed the script as described above:

1. Navigate to the git repository you wish to work with.
2. Run `versioned_tag`.
3. Follow the on-screen prompts to increment the tag version as desired.

## License

This project is open source, under the MIT License.
