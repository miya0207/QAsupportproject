#!/usr/bin/env python3
# Pick an unused post from YAML (very small utility)
import argparse, yaml, random
from pathlib import Path

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--yaml", default="content/posts/posts_001.yaml")
    ap.add_argument("--seed", type=int, default=None)
    args = ap.parse_args()

    if args.seed is not None:
        random.seed(args.seed)

    path = Path(args.yaml)
    data = yaml.safe_load(path.read_text(encoding="utf-8"))
    # YAML starts with comments, so data is list
    candidates = [p for p in data if isinstance(p, dict) and p.get("used") != True]
    if not candidates:
        print("No candidates found (all used?)")
        return
    p = random.choice(candidates)
    print(f"type: {p.get('type')}")
    print("----")
    print(p.get("text","").rstrip())

if __name__ == "__main__":
    main()
