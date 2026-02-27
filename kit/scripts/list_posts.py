#!/usr/bin/env python3
# List posts from YAML with index
import yaml
from pathlib import Path

path = Path("content/posts/posts_001.yaml")
posts = yaml.safe_load(path.read_text(encoding="utf-8"))
for i, p in enumerate(posts, 1):
    if not isinstance(p, dict): 
        continue
    print(f"[{i:02d}] ({p.get('type')}) {p.get('text','').replace('\n',' / ')[:120]}")
