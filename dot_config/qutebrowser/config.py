from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config.load_autoconfig(False)

# c.colors.webpage.darkmode.enabled = True

c.url.default_page = "~/.config/qutebrowser/startpage/index.html"
c.url.start_pages = c.url.default_page

c.url.searchengines = {
    "DEFAULT":"https://duckduckgo.com/?q={}",
    "yt":
    "https://www.youtube.com/results?search_query={}",
    "wa":
    "https://www.wolframalpha.com/input/?i={}",
    "aw":
    "https://wiki.archlinux.org/index.php?search={}&title=Special%3ASearch&go=Go",
    "gh":
    "https://github.com/search?q={}",
    "wp":
    "https://en.wikipedia.org/w/index.php?search={}",
    "rd":
    "https://old.reddit.com/search?q={}",
    "go":
    "https://www.google.com/search?q={}",
    "rs":
    "https://doc.rust-lang.org/std/index.html?search={}",
    "lg":
    "http://libgen.rs/search.php?req={}"
}

config.source("modustheme.py")
